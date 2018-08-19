package yousurf

import grails.plugin.springsecurity.annotation.Secured


/**
 * Class de base pour les controller
 */
abstract class AbstractController {

    /**
     * Retourne les infos de pagination depuis la request
     *
     */
    protected Map pagination() {
        [offset: params.offset ?: 0, max: params.max ?: 25]
    }


    /**
     * Insère une exception dans la requête
     *
     * @param exception
     */
    protected setAppException(AppException exception) {
        request.appException = exception
    }


    /**
     * Modèle commun pour edition/creation
     *
     * @param model
     * @return
     */
    protected Map fetchModel(Map model) {
       return model
    }
}