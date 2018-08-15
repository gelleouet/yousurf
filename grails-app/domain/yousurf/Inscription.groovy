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

    // User properties
    List<Integer> creneauxList = []
    String problemeMedical
    int currentStep


    static transients = ['creneauxList', 'problemeMedical', 'currentStep']


    static hasMany = [problemeMedicaux: ProblemeMedical, creneaux: InscriptionCreneau]

  
    static constraints = {
        autorisationParentale nullable: true
        creneauxList bindable: true
        problemeMedical nullable: true, bindable: true
        currentStep bindable: true
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        problemeMedicaux cascade: 'all-delete-orphan'
        creneaux cascade: 'all-delete-orphan'
        dateDebut index: 'Inscription_Idx'
        eleve index: 'Inscription_Idx'
    }

    /**
     * Default constructor
     */
    Inscription() {
        dateDebut = new Date()
        dateFin = new Date()
        dateSignature = new Date()
        currentStep = 1
    }

    /**
     * Binding des créneaux depuis la propriété List
     *
     * @return this
     */
    Inscription bindCreneauxFromList() {
        // suppression des créneaux existants qui ne sont pas dans la liste
        creneaux.removeAll { creneau ->
            ! (creneau.id in creneauxList)
        }

        // ajout des nouveaux créneaux
        creneauxList.each { creneauId ->
            if (! creneaux.find { it.id == creneauId } ) {
                this.addToCreneaux(creneau: Creneau.read(creneauId))
            }
        }

        return this
    }


    /**
     * Binding des problèmes médicaux depuis la propriété simple
     *
     * @return
     */
    Inscription bindProblemeMedical() {
        if (problemeMedical) {
            if (problemeMedicaux) {
                problemeMedicaux[0].libelle = problemeMedical
            } else {
                this.addToProblemeMedicaux(libelle: problemeMedical)
            }
        } else {
            if (problemeMedicaux) {
                problemeMedicaux.removeAll()
            }
        }

        return this
    }
}
