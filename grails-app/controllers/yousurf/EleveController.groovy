package yousurf

import grails.plugin.springsecurity.annotation.Secured
import yousurf.command.EleveCommand


class EleveController extends AbstractController {

    EleveService eleveService


    /**
     * Recherche multi-critère et paginée
     *
     */
    @Secured('isAuthenticated()')
    def index(EleveCommand command) {
        def eleves = eleveService.search(command, pagination())
        respond eleves, model: [command: command]
    }


    /**
     * Recherche multi-critère et paginée
     *
     */
    @Secured('isAuthenticated()')
    def auiSelect(EleveCommand command) {
        def eleves = eleveService.search(command, [:])
        respond eleves
    }

    /**
     * Edition d'un élève
     *
     * @param eleve
     * @return
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def edit(Eleve eleve) {
        def model = fetchModel([:])
        model.eleve = eleve
        return model
    }


    /**
     * Enregistrement d'un élève
     *
     * @param eleve
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def saveEdit(Eleve eleve) {
        eleveService.save(eleve)
        redirect(action: "index")
    }
}
