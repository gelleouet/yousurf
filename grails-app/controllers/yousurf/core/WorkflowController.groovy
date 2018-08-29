package yousurf.core

import grails.plugin.springsecurity.annotation.Secured
import yousurf.AbstractController
import yousurf.AppException
import yousurf.command.WorkflowCommand


class WorkflowController extends AbstractController {

    WorkflowService workflowService


    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def index(WorkflowCommand command) {
        def deploiementList = workflowService.search(command, pagination())
        def totalCount = workflowService.count(command)
        return [deploiementList: deploiementList, totalCount: totalCount, command: command]
    }


    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def view(WorkflowCommand command) {
        def deployment

        if (command.id) {
            deployment = workflowService.findDeploymentById(command.id)
            command.libelle = deployment.name
        }

        [command: command]
    }


    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def save(WorkflowCommand command) {
        parseUploadFile(command)
        workflowService.save(command)
        redirect action: 'index'
    }


    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def delete(WorkflowCommand command) {
        try {
            workflowService.deleteDeployment(command.id)
        } catch (AppException ex) {
            this.setAppException(ex)
        }

        forward action: 'index'
    }


    /**
     * Renvoit l'image du diagramme BPMN
     *
     * @return
     */
    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def imgDiagram(String id) {
        workflowService.renderDiagram(id, response.getOutputStream())
    }


    /**
     * Affiche une boite de dialogue pour le rendu du diagramme BPMN
     *
     * @param workflow
     * @return
     */
    @Secured("hasRole('ROLE_ADMIN_SYS')")
    def dialogDiagram(String id) {
        render(template: 'dialogDiagram', model: [deploymentId: id])
    }


    private void parseUploadFile(WorkflowCommand command) {
        def file = request.getFile("dataFile")

        if (file && !file.empty) {
            command.data = file.getInputStream().getBytes()
        }
    }
}
