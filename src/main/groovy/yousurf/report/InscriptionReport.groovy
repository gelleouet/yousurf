package yousurf.report

import yousurf.AppException
import yousurf.Creneau
import yousurf.Formule
import yousurf.Inscription


class InscriptionReport extends Report {
    long inscriptionId


    InscriptionReport(long inscriptionId) {
        this.inscriptionId = inscriptionId
    }


    @Override
    protected void modelImpl(Map model) throws AppException {
        model.inscription = Inscription.read(this.inscriptionId)
        model.formules = Formule.list([sort: "id"])
        model.creneaux = Creneau.list([sort: "id"])
    }
}
