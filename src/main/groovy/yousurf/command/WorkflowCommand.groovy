package yousurf.command

import grails.validation.Validateable

class WorkflowCommand implements Validateable {
    String libelle
    String id
    byte[] data


    static constraints = {
        libelle nullable: true
        id nullable: true
        data nullable: true
    }
}
