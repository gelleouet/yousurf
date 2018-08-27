package yousurf

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import yousurf.aspect.annotation.Workflowable
import yousurf.command.ContactCommand
import org.hibernate.criterion.CriteriaSpecification
import yousurf.command.InscriptionCommand


//@Service(Inscription)
class InscriptionService extends AbstractService<Inscription> {
    EleveService eleveService
    ContactService contactService


    /**
     * Enregistrement d'une inscription.
     * Recherche d'élève et du contact existant pour éviter les doublons
     *
     * @param inscription
     * @return
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = [AppException])
    Inscription save(Inscription inscription) throws AppException {
        // recherche d'un élève existant si nouvelle saisie
        if (inscription.eleve?.email && !inscription.eleve.id) {
            Eleve existEleve = Eleve.findByEmail(inscription.eleve.email)

            if (existEleve) {
                inscription.eleve = existEleve
            }
        }

        // recherche d'un contact existant
        if (inscription.contact?.nom && inscription.contact?.prenom && !inscription.contact.id) {
            def contacts = contactService.search(new ContactCommand(nom: inscription.contact.nom,
                prenom: inscription.contact.prenom), [max:2])

            if (contacts.size() == 1) {
                inscription.contact = contacts[0]
            }
        }

        // refait les tests de validation si changement
        inscription.validate()

        return super.save(inscription)
    }


    /**
     * Dernière inscription confirmée d'un élève
     *
     * @param eleve
     * @return
     */
    Inscription findLastForEleve(Eleve eleve) {
        return Inscription.createCriteria().get {
            eq 'eleve', eleve
            eq 'confirm', true
            order 'dateCreated', 'desc'
            maxResults 1
        }
    }


    /**
     * Recherche multi-critère paginée des inscriptions
     *
     * @param command
     * @return
     */
    List<Inscription> search(InscriptionCommand command, Map pagination) {
        return Inscription.createCriteria().list(pagination) {
            createAlias 'eleve', 'eleve', CriteriaSpecification.LEFT_JOIN

            ge 'dateCreated', command.dateDebut

            if (command.dateFin) {
                le 'dateCreated', command.dateFin
            }

            if (command.prenomEleve) {
                ilike 'eleve.prenom', QueryUtils.matchAll(command.prenomEleve)
            }
            if (command.nomEleve) {
                ilike 'eleve.nom', QueryUtils.matchAll(command.nomEleve)
            }
            if (command.emailEleve) {
                ilike 'eleve.email', QueryUtils.matchAll(command.emailEleve)
            }

            eq 'confirm', command.confirm

            join 'formule'
            join 'niveau'

            order 'dateCreated', 'desc'
        }
    }


    /**
     * Confirmation d'une inscription
     *
     * @param inscription
     * @return
     * @throw AppException si l'inscription n'est pas valide. L'exception devra renvoyer le step en erreur
     * dans ses paramètres
     */
    @Workflowable
    @Transactional(readOnly = false, rollbackFor = [AppException])
    Inscription confirm(Inscription inscription) throws AppException {
        if (!inscription.eleve) {
            throw new AppException("Les coordonnées de l'élève sont incomplètes", [step: 1])
        }
        if (!inscription.contact) {
            throw new AppException("Les coordonnées du contact sont incomplètes", [step: 2])
        }
        if (!inscription.formule) {
            throw new AppException("La prestation est incomplète", [step: 4])
        }

        inscription.confirm = true
        inscription.dateCreated = new Date()

        return this.save(inscription)
    }

    /**
     * Création d'une inscription pré-remplie avec élève
     * Tente de récupérer un contact depuis une inscription existante
     *
     * @param eleve
     * @return
     */
    Inscription createForEleve(Eleve eleve) {
        Inscription inscription = new Inscription(eleve: eleve)
        Inscription lastInscription = this.findLastForEleve(eleve)

        if (lastInscription) {
            inscription.contact = lastInscription.contact
        }

        return inscription
    }
}
