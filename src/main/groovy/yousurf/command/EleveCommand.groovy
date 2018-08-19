package yousurf.command

import grails.validation.Validateable


class EleveCommand implements Validateable {
    String nom
    String prenom
    String email
    String q // pour les composants ajax


    static constraints = {
        nom nullable: true
        prenom nullable: true
        email nullable: true
        q nullable: true
    }
}