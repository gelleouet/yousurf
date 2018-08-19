package yousurf.command

import grails.validation.Validateable


class ContactCommand implements Validateable {
    String nom
    String prenom
    String telephone
    String q // pour les composants ajax


    static constraints = {
        nom nullable: true
        prenom nullable: true
        q nullable: true
        telephone nullable: true
    }
}