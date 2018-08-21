package yousurf

class InscriptionSignature {
    byte[] data
    Inscription inscription


    static belongsTo = [inscription: Inscription]


    static constraints = {
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        inscription index: 'InscriptionSignature_Idx'
    }
}
