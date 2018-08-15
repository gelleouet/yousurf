package yousurf

import grails.validation.Validateable


class InscriptionCommand implements Validateable {
    Date dateDebut
    Date dateFin
    String nomEleve
    String prenomEleve


    static constraints = {
        nomEleve nullable: true
        prenomEleve nullable: true
    }

    /**
     * Default constructor
     */
    InscriptionCommand() {
        dateDebut = new Date().clearTime() - 7
        dateFin = new Date().clearTime()
    }
}