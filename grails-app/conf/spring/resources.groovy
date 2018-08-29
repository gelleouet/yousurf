import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.engine.impl.history.HistoryLevel;
import yousurf.UserPasswordEncoderListener


// Place your Spring DSL code here
beans = {
    xmlns context:"http://www.springframework.org/schema/context"


    // Spring AOP Configuration
    // -----------------------------------------------------------------

    context.'component-scan'('base-package': "yousurf.aspect")


    // Spring Security Configuration
    // -----------------------------------------------------------------

    userPasswordEncoderListener(UserPasswordEncoderListener)


    // Activiti WorkflowCommand Configuration
    // -----------------------------------------------------------------

    // Démarre une instance Activiti WorkflowCommand
    processEngineConfiguration(SpringProcessEngineConfiguration) {
        transactionManager = ref("transactionManager")
        dataSource = ref("dataSource")
        history = HistoryLevel.NONE.getKey()
        dbHistoryUsed = false
        createDiagramOnDeploy = true
        asyncExecutorActivate = true

        // configuration SMTP
        /*mailServerHost = application.config.smtp.hostname
        mailServerPort = application.config.smtp.port
        mailServerDefaultFrom = application.config.smtp.from
        mailServerUsername = application.config.smtp.username
        mailServerPassword = application.config.smtp.password
        mailServerUseTLS = true*/

        databaseSchemaUpdate = true
        databaseSchema = "activiti"
    }

    processEngine(ProcessEngineFactoryBean) {
        processEngineConfiguration = ref("processEngineConfiguration")
    }

    repositoryService(processEngine: "getRepositoryService")
    runtimeService(processEngine: "getRuntimeService")
}
