package yousurf

import grails.gorm.services.Service


@Service(Inscription)
abstract class InscriptionService extends AbstractService implements IInscriptionService {

    /**
     * Recherche multi-critère paginée des inscriptions
     *
     * @param command
     * @return
     */
    List<Inscription> search(InscriptionCommand command, Map pagination) {
        return Inscription.createCriteria().list(pagination) {
            between 'dateDebut', command.dateDebut, command.dateFin

            eleve {
                if (command.prenomEleve) {
                    ilike 'prenom', QueryUtils.matchAll(command.prenomEleve)
                }
                if (command.nomEleve) {
                    ilike 'nom', QueryUtils.matchAll(command.nomEleve)
                }
            }

            join 'formule'
            join 'niveau'

            order 'dateDebut', 'desc'
        }
    }
}
