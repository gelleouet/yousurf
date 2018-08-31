import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.engine.impl.history.HistoryLevel
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
        databaseSchemaUpdate = application.yousurf.activiti.databaseSchemaUpdate
        databaseSchema = "activiti"
    }

    processEngine(ProcessEngineFactoryBean) {
        processEngineConfiguration = ref("processEngineConfiguration")
    }

    repositoryService(processEngine: "getRepositoryService")
    runtimeService(processEngine: "getRuntimeService")


    // Spring Email Configuration
    // -----------------------------------------------------------------

    javaMailSender(JavaMailSenderImpl) {
        host = application.config.email.smtp.host
        port = application.config.email.smtp.port
        username = application.config.email.smtp.username
        password = application.config.email.smtp.password
    }
}
