package yousurf

class Creneau implements Serializable {
    String libelle


    static constraints = {
        libelle unique: true
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        sort "libelle"
    }
}
