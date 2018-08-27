package yousurf

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import yousurf.command.ContactCommand
import yousurf.command.EleveCommand


//@Service(Contact)
class ContactService extends AbstractService<Contact> {


    /**
     * Recherche multi-critère paginée
     *
     * @param command
     * @return
     */
    List<Contact> search(ContactCommand command, Map pagination) {
        return Contact.createCriteria().list(pagination) {
            if (command.nom) {
                ilike 'nom', QueryUtils.matchAll(command.nom)
            }
            if (command.prenom) {
                ilike 'prenom', QueryUtils.matchAll(command.prenom)
            }
            if (command.telephone) {
                or {
                    like 'telephone', QueryUtils.matchAll(command.telephone)
                    like 'portable', QueryUtils.matchAll(command.telephone)
                }
            }
            if (command.q) {
                or {
                    ilike 'nom', QueryUtils.matchAll(command.q)
                    ilike 'email', QueryUtils.matchAll(command.q)
                }
            }
            order "prenom"
            order "nom"
        }
    }
}
