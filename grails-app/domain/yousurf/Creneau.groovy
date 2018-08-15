package yousurf

class Creneau implements Serializable {
    String libelle


    static constraints = {
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        sort "libelle"
    }
}
