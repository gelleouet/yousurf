package yousurf.core

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import org.activiti.engine.RepositoryService
import org.activiti.engine.RuntimeService
import org.activiti.engine.repository.Deployment
import org.activiti.engine.repository.DeploymentQuery
import org.activiti.engine.repository.ProcessDefinition
import org.activiti.engine.runtime.ProcessInstance
import yousurf.AbstractService
import yousurf.AppException
import yousurf.command.WorkflowCommand


/**
 * Administration / Exécution des workflows métier
 *
 * Facade sur système Activiti
 */
class WorkflowService extends AbstractService<WorkflowCommand> {
    RepositoryService repositoryService
    RuntimeService runtimeService
    GrailsApplication grailsApplication


    /**
     * Recherche des déploiements
     *
     * @param command
     * @param pagination
     * @return
     * @throws yousurf.AppException
     */
    List<Deployment> search(WorkflowCommand command, Map pagination) throws AppException {
        DeploymentQuery query = buildDeploymentQuery(command)
        return query.orderByDeploymentName().asc().listPage(pagination.offset, pagination.max)
    }


    /**
     * Compte le nombre de workflows
     *
     * @param command
     * @return
     * @throws AppException
     */
    long count(WorkflowCommand command) throws AppException {
        DeploymentQuery query = buildDeploymentQuery(command)
        return query.count()
    }

    /**
     * Construction de la query
     *
     * @param command
     * @return
     */
    protected DeploymentQuery buildDeploymentQuery(WorkflowCommand command) {
        DeploymentQuery query = repositoryService.createDeploymentQuery()

        if (command.libelle) {
            query.deploymentNameLike(command.libelle)
        }

        if (command.id) {
            query.deploymentId(command.id)
        }

        return query
    }


    /**
     * Enregistrement domain avec validation
     *
     * @param domain
     * @return
     * @throws AppException
     */
    @Override
    WorkflowCommand save(WorkflowCommand command) throws AppException {
        if (command.id && command.data) {
            this.deleteDeployment(command.id)
        }

        if (command.data) {
            this.createDeployment(command)
        }

        return command
    }


    /**
     * Création d'un workflow dans le repo.
     * Cette méthode ne vérifie pas si le workflow est déjà déployé
     *
     * @param command
     * @return
     * @throws AppException
     */
    @Transactional(readOnly = false, rollbackFor = [AppException])
    Deployment createDeployment(WorkflowCommand command) throws AppException {
        if (! command.data) {
            throw new AppException("Data is empty !")
        }

        Deployment deployment

        new ByteArrayInputStream(command.data).withStream { stream ->
            try {
                deployment = repositoryService.createDeployment()
                        .addInputStream("${command.libelle}.bpmn20.xml", stream).name(command.libelle).deploy()
            } catch (Exception ex) {
                throw new AppException(ex)
            }
        }

        return deployment
    }


    /**
     * Suppression d'un workflow existant dans le repo
     *
     * @param id
     * @return
     * @throws AppException
     */
    @Transactional(readOnly = false, rollbackFor = [AppException])
    void deleteDeployment(String id) throws AppException {
        if (!id) {
            throw new AppException("ID is required !")
        }

        try {
            repositoryService.deleteDeployment(id, true)
        } catch (Exception e) {
            throw new AppException(e)
        }
    }

    /**
     * Recherche via ID
     *
     * @param id
     * @return
     */
    Deployment findDeploymentById(String id) {
        return repositoryService.createDeploymentQuery().deploymentId(id).singleResult()
    }


    /**
     * Recherche via name
     *
     * @param id
     * @return
     */
    Deployment findDeploymentByName(String name) {
        return repositoryService.createDeploymentQuery().deploymentName(name).singleResult()
    }


    /**
     * Rendu du diagramme BPMN
     *
     * @param workflow
     * @param outStream
     *
     * @return
     * @throws AppException
     */
    void renderDiagram(String id, OutputStream outStream) throws AppException {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .deploymentId(id).singleResult()

        outStream.withStream { out ->
            repositoryService.getProcessDiagram(processDefinition.getId()).withStream { inStream ->
                out << inStream
            }
        }
    }


    /**
     * Exécute le workflow sur le contexte donné
     * La transaction est en écriture dans le cas de mise à jour depuis le workflow
     *
     * @param name
     * @param model
     * @return
     * @throws AppException
     */
    @Transactional(readOnly = false, rollbackFor = [AppException])
    void execute(String name, Map model) throws AppException {
        Deployment deployment = findDeploymentByName(name)

        if (deployment) {
            ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                    .deploymentId(deployment.getId()).singleResult();

            // prépare les variables de process
            Map variables = [context: model]

            try {
                ProcessInstance processInstance = runtimeService.startProcessInstanceById(
                        processDefinition.getId(), variables)
            } catch (Exception ex) {
                throw new AppException(ex)
            }

        } else {
            log.error "Workflow ${name} not found"
        }
    }
}
