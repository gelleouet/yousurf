package yousurf

import grails.plugin.springsecurity.annotation.Secured


class TableauBordController extends AbstractController {

    @Secured('isAuthenticated()')
    def index() {

    }
}
