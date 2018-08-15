package yousurf

/**
 * Utilitaires Query
 */
class QueryUtils {
    static String WILDCARD = "%"


    /**
     * Decorate droite/gauche avec le wildcard
     *
     * @param parameter
     * @return
     */
    static String matchAll(String parameter) {
        return "${WILDCARD}${parameter}${WILDCARD}"
    }
}