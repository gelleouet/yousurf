package yousurf

import grails.plugin.springsecurity.annotation.Secured
import yousurf.command.ContactCommand


class ContactController extends AbstractController {

    ContactService contactService


    /**
     * Recherche multi-critère et paginée
     *
     */
    @Secured('isAuthenticated()')
    def index(ContactCommand command) {
        def contacts = contactService.search(command, pagination())
        respond contacts, model: [command: command]
    }
}
