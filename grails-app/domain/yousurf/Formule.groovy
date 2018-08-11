package yousurf

class Formule implements Serializable {
    String libelle
    String commentaire
    double prix
    double arrhe


    static constraints = {
        commentaire nullable:true
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
    }
}
