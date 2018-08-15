package yousurf


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
}