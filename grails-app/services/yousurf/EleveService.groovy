package yousurf

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import yousurf.command.EleveCommand


@Service(Eleve)
abstract class EleveService extends AbstractService {

    /**
     * Enregistrement
     *
     * @param inscription
     * @return
     */
    abstract Eleve save(Eleve eleve)


    /**
     * Recherche multi-critère paginée
     *
     * @param command
     * @return
     */
    List<Eleve> search(EleveCommand command, Map pagination) {
        return Eleve.createCriteria().list(pagination) {
            if (command.nom) {
                ilike 'nom', QueryUtils.matchAll(command.nom)
            }
            if (command.prenom) {
                ilike 'prenom', QueryUtils.matchAll(command.prenom)
            }
            if (command.email) {
                ilike 'email', QueryUtils.matchAll(command.email)
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
