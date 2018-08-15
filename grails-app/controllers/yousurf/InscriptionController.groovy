package yousurf

import grails.plugin.springsecurity.annotation.Secured


class InscriptionController extends AbstractController {

    InscriptionService inscriptionService

    /**
     * Page principale : affichage et recherche des inscriptions
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def index(InscriptionCommand command) {
        def inscriptions = inscriptionService.search(command, pagination())
        return [inscriptions: inscriptions, command: command ?: new InscriptionCommand()]
    }

    /**
     * Edition d'une inscription
     *
     * @param inscription
     * @return
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def edit(Inscription inscription) {
        def model = fetchModelInscription([:])
        model.inscription = inscription
        return model
    }


    /**
     * Nouvelle inscription
     */
    @Secured('permitAll')
    def create(Inscription inscription, int step) {
        def model = fetchModelInscription([:])
        model.inscription = inscription ?: new Inscription()
        if (step) {
            model.inscription.currentStep = step
        }
        model.maxStep = 7
        render (view: "create", model: model)
    }


    /**
     * Nouvelle inscription étape suivante
     */
    @Secured('permitAll')
    def createNextStep(Inscription inscription) {
        inscription.currentStep++
        create(inscription, inscription.currentStep)
    }


    /**
     * Nouvelle inscription étape précédente
     */
    @Secured('permitAll')
    def createPrevStep(Inscription inscription) {
        inscription.currentStep--
        create(inscription, inscription.currentStep)
    }


    /**
     * Enregistrement d'une inscription
     *
     * @param inscription
     */
    @Secured('permitAll')
    def saveCreate(Inscription inscription) {
        // binding manuel
        inscription.bindCreneauxFromList()
            .bindProblemeMedical()

        // on refait la validation pour recalculer les erreurs avant l'enregistrement
        inscription.validate()
        inscriptionService.saveInscription(inscription)

        def model = fetchModelInscription([:])
        model.inscription = inscription

        render(view: 'inscription', model: model)
    }


    /**
     * Prépare le modèle avec les données communes
     *
     * @param model
     */
    private def fetchModelInscription(def model) {
        model.formules = Formule.list([sort: "id"])
        model.creneaux = Creneau.list([sort: "id"])
        model.niveaux = Niveau.list([sort: "id"])
        return model
    }


    /**
     * Règlement et conditions
     *
     */
    @Secured('permitAll')
    def reglement() {

    }
}
