package yousurf

class InscriptionCreneau implements Serializable {
    Inscription inscription
    Creneau creneau


    static belongsTo = [inscription: Inscription, creneau: Creneau]


    static constraints = {

    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        id composite: ['inscription', 'creneau']
        version false
    }
}
