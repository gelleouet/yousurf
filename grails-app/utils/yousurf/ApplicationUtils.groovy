package yousurf

import grails.core.GrailsApplication

/**
 * Utilitaires application
 */
class ApplicationUtils {

    /**
     * Contrôle du token de connexion pour les appels API
     *
     * @param application
     * @param token
     * @throws AppException
     */
    static void assertAppToken(GrailsApplication application, String token) throws AppException {
        if (!token ||  token != application.config.getProperty("yousurf.security.token")) {
            throw new AppException("Invalid token !")
        }
    }
}
