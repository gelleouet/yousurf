package yousurf

import com.budjb.rabbitmq.consumer.MessageContext


class WorkflowConsumer {

    static rabbitConfig = [
            "queue": "yousurf.workflow"
    ]


    /**
     * Handle an incoming RabbitMQ message.
     *
     * @param body    The converted body of the incoming message.
     * @param context Properties of the incoming message.
     * @return
     */
    def handleMessage(Map body, MessageContext messageContext) {
        println body
    }
}
