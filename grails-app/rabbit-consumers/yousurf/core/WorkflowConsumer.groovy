package yousurf.core


import com.budjb.rabbitmq.consumer.MessageContext
import yousurf.AppException
import yousurf.Constantes


class WorkflowConsumer {

    static rabbitConfig = [
        "queue": Constantes.WORKFLOW_QUEUE,
        retry: false,
        transacted: false
    ]

    WorkflowService workflowService


    /**
     * Handle an incoming RabbitMQ message.
     *
     * @param body    The converted body of the incoming message.
     * @param context Properties of the incoming message.
     * @return
     */
    def handleMessage(Map body, MessageContext messageContext) {
        if (body?.workflowName) {
            try {
                workflowService.execute(body.workflowName, body)
            } catch (AppException ex) {
                log.error "Cannot execute workflow ${body.workflowName} : ${ex.message}"
                log.debug "Cannot execute workflow ${body.workflowName}", ex
            }
        }
    }
}
