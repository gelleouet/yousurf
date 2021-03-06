package yousurf


class Inscription implements Serializable {
    Date dateCreated
    Date dateDebut
    Date dateFin
    Eleve eleve
    Contact contact
    Niveau niveau
    boolean brevet25m
    String lieuSignature
    Formule formule
    Set parentaux = []
    Set medicaux = []
    Set creneaux = []
    Set signatures = []
    boolean confirm

    // User properties
    List<Integer> creneauxList = []
    String problemeMedical
    String autorisationParentale
    String signatureData
    int currentStep


    static transients = ['creneauxList', 'problemeMedical', 'currentStep', 'autorisationParentale', 'signatureData']


    static hasMany = [medicaux: InscriptionMedical, creneaux: InscriptionCreneau, parentaux: InscriptionAutorisation,
        signatures: InscriptionSignature]


    // toutes les propriétés sont déclarées en nullable car la création se fait en plusieurs étapes
    // à la confirmation, les propriétés seront bien non nulles
    static constraints = {
        dateDebut nullable: true
        dateFin nullable: true
        eleve nullable: true
        contact nullable: true
        niveau nullable: true
        lieuSignature nullable: true
        formule nullable: true
        autorisationParentale nullable: true, bindable: true
        creneauxList bindable: true
        problemeMedical nullable: true, bindable: true
        signatureData nullable: true, bindable: true
        currentStep bindable: true
    }


    static mapping = {
        table schema: Constantes.DEFAULT_SCHEMA
        medicaux cascade: 'all-delete-orphan'
        creneaux cascade: 'all-delete-orphan'
        parentaux cascade: 'all-delete-orphan'
        signatures cascade: 'all-delete-orphan'
        dateCreated index: 'Inscription_Idx'
        eleve index: 'Inscription_Idx'
        lieuSignature length: 128
    }


    static {
        grails.converters.JSON.registerObjectMarshaller(Inscription) {
            // ne pas serialier les associations pour éviter les sous-requetes lazy
            [id: it.id, 'class': it.class.name, dateCreated: it.dateCreated, dateDebut: it.dateDebut,
             dateFin: it.dateFin, brevet25m: it.brevet25m, lieuSignature: it.lieuSignature, confirm: it.confirm,
             eleve: [id: it.eleve?.id], contact: [id: it.contact?.id], formule: [id: it.formule?.id],
             niveau: [id: it.niveau?.id]]
        }
    }

    /**
     * Default constructor
     */
    Inscription() {
        dateDebut = new Date().clearTime()
        dateFin = new Date().clearTime()
        currentStep = 1
    }

    /**
     * Binding des créneaux depuis la propriété List
     *
     * @return this
     */
    Inscription bindCreneauxFromList() {
        // suppression des créneaux existants
        InscriptionCreneau.where { inscription == this }.deleteAll()

        // ajout des nouveaux créneaux
        creneauxList.each { creneauId ->
            this.addToCreneaux(creneau: Creneau.read(creneauId))
        }

        return this
    }


    /**
     * Binding des problèmes médicaux depuis la propriété simple
     *
     * @return
     */
    Inscription bindMedicaux() {
        if (problemeMedical) {
            if (medicaux) {
                medicaux[0].libelle = problemeMedical
            } else {
                this.addToMedicaux(libelle: problemeMedical)
            }
        } else {
            if (medicaux) {
                medicaux.clear()
            }
        }

        return this
    }


    /**
     * Binding des autorisations parentales depuis la propriété simple
     *
     * @return
     */
    Inscription bindParentaux() {
        if (autorisationParentale) {
            if (parentaux) {
                parentaux[0].libelle = autorisationParentale
            } else {
                this.addToParentaux(libelle: autorisationParentale)
            }
        } else {
            if (parentaux) {
                parentaux.clear()
            }
        }

        return this
    }

    /**
     * Bind de la signature depuis la propriété data
     *
     * @return
     */
    Inscription bindSignatures() {
        if (signatureData) {
            if (signatures) {
                signatures[0].data = signatureData.getBytes()
            } else {
                this.addToSignatures(data: signatureData.getBytes())
            }
        }

        // on ne traite pas le cas suppression car on ne supprime pas les anciennes signatures

        return this
    }
}
