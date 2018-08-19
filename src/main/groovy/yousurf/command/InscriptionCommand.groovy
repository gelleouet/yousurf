package yousurf.command

import grails.validation.Validateable


class InscriptionCommand implements Validateable {
    Date dateDebut
    Date dateFin
    String nomEleve
    String prenomEleve
    String emailEleve
    boolean confirm


    static constraints = {
        nomEleve nullable: true
        prenomEleve nullable: true
        emailEleve nullable: true
        dateFin nullable: true
    }

    /**
     * Default constructor
     */
    InscriptionCommand() {
        dateDebut = new Date().clearTime() - 30
        confirm = true
    }
}