package yousurf

/**
 * Exception métier
 *
 */
class AppException extends Exception {
    /**
     * Paramètres en fonction de l'exception
     * Permet de passer des objets spécifiques en fonction de l'exception métier
     */
    Map params = [:]


    AppException(Map params) {
        this.params = params
    }

    AppException(String s, Map params) {
        super(s)
        this.params = params
    }

    AppException(String s) {
        super(s)
    }

    AppException(String s, Throwable throwable, Map params) {
        super(s, throwable)
        this.params = params
    }

    AppException(Throwable throwable, Map params) {
        super(throwable)
        this.params = params
    }

    AppException(Throwable throwable) {
        super(throwable)
    }

    AppException(String s, Throwable throwable, boolean b, boolean b1, Map params) {
        super(s, throwable, b, b1)
        this.params = params
    }
}
