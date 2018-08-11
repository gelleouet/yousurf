package yousurf

class Inscription implements Serializable {
    Date dateDebut
    Date dateFin
    Eleve eleve
    Contact contact
    Niveau niveau
    boolean brevet25m
    String lieuSignature
    Date dateSignature
    Formule formule
    String autorisationParentale
    Set problemeMedicaux = []
    Set creneaux = []


    static hasMany = [problemeMedicaux: ProblemeMedical, creneaux: InscriptionCreneau]

  
    static constraints = {
        autorisationParentale nullable: true
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        problemeMedicaux cascade: 'all-delete-orphan'
        creneaux cascade: 'all-delete-orphan'
        dateDebut index: 'Inscription_Idx'
    }
}
