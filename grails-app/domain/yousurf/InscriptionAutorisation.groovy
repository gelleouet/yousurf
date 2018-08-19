package yousurf

class InscriptionAutorisation {
    String libelle
    Inscription inscription


    static belongsTo = [inscription: Inscription]


    static constraints = {
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        inscription index: 'InscriptionAutorisation_Idx'
    }
}
