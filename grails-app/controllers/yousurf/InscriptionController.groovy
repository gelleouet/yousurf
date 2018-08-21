package yousurf

import grails.plugin.springsecurity.annotation.Secured
import yousurf.command.InscriptionCommand


class InscriptionController extends AbstractController {

    InscriptionService inscriptionService

    /**
     * Page principale : affichage et recherche des inscriptions
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def index(InscriptionCommand command) {
        def inscriptions = inscriptionService.search(command, pagination())
        return [inscriptions: inscriptions, command: command]
    }

    /**
     * Edition d'une inscription
     *
     * @param inscription
     * @return
     */
    @Secured("hasRole('ROLE_ADMIN')")
    def edit(Inscription inscription) {
        def model = fetchModel([:])
        model.inscription = inscription
        return model
    }

    /**
     * Création rapide depuis un élève
     *
     * @param eleve
     */
    @Secured('isAuthenticated()')
    def createForEleve(Eleve eleve) {
        Inscription inscription = inscriptionService.createForEleve(eleve)
        create(inscription, 1)
    }


    /**
     * Nouvelle inscription
     */
    @Secured('isAuthenticated()')
    def create(Inscription inscription, int step) {
        def model = fetchModel([:])
        model.inscription = inscription ?: new Inscription()
        model.steps = ['Coordonnées', 'Contact', 'Santé', 'Prestation', 'Autorisation', 'Attestation']

        // enregistrement à chaque étape l'inscription
        // en fonction des étapes, on doit faire des bindings manuels
        switch (model.inscription.currentStep) {
            case 3: inscription.bindMedicaux(); break
            case 4: inscription.bindCreneauxFromList(); break
            case 5: inscription.bindParentaux(); break
        }

        try {
            inscriptionService.save(model.inscription)

            // changement d'étape si pas d'erreur
            if (step) {
                model.inscription.currentStep = step
            }
        } catch (AppException exApp) {
            setAppException(exApp)
            // après erreur transaction rollbackée donc on doit rattacher l'objet
            inscription.attach()
        }

        render (view: "create", model: model)
    }


    /**
     * Nouvelle inscription étape suivante
     */
    @Secured('isAuthenticated()')
    def createNextStep(Inscription inscription) {
        create(inscription, inscription.currentStep + 1)
    }


    /**
     * Nouvelle inscription étape précédente
     */
    @Secured('isAuthenticated()')
    def createPrevStep(Inscription inscription) {
        create(inscription, inscription.currentStep - 1)
    }


    /**
     * Confirmation d'une inscription
     *
     * @param inscription
     */
    @Secured('isAuthenticated()')
    def confirm(Inscription inscription) {
        inscription.bindSignatures()

        try {
            inscriptionService.confirm(inscription)
        } catch (AppException exApp) {
            setAppException(exApp)
            // si erreur, transaction rollbackée et l'objet n'est pas attachée à une session ouverte
            inscription.attach()
            return create(inscription, exApp.params.step)
        }

        return [inscription: inscription]
    }


    /**
     * Prépare le modèle avec les données communes
     *
     * @param model
     */
    @Override
    protected Map fetchModel(Map model) {
        model.formules = Formule.list([sort: "id"])
        model.creneaux = Creneau.list([sort: "id"])
        model.niveaux = Niveau.list([sort: "id"])
        return model
    }


    /**
     * Règlement et conditions
     *
     */
    @Secured('isAuthenticated()')
    def reglement() {

    }
}
