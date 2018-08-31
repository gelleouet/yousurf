package yousurf.core


import com.budjb.rabbitmq.consumer.MessageContext
import com.google.gson.Gson
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
    def handleMessage(MessageContext messageContext) {
        Gson gson = new Gson()
        Map body = gson.fromJson(new String(messageContext.body), Map.class)

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
