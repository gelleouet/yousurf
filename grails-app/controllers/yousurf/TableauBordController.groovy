package yousurf

import grails.plugin.springsecurity.annotation.Secured


@Secured('isAuthenticated()')
class TableauBordController extends AbstractController {

    def index() {

    }
}
