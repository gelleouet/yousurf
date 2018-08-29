package yousurf.core

import com.budjb.rabbitmq.consumer.MessageContext
import yousurf.AppException
import yousurf.Constantes


class EmailConsumer {

    static rabbitConfig = [
        "queue": Constantes.EMAIL_QUEUE,
        retry: false,
        transacted: false
    ]

    EmailService emailService


    /**
     * Handle an incoming RabbitMQ message.
     *
     * @param body    The converted body of the incoming message.
     * @param context Properties of the incoming message.
     * @return
     */
    def handleMessage(Map body, MessageContext messageContext) {
        try {
            emailService.send(body)
        } catch (AppException ex) {
            log.error "Cannot send email ${body} : ${ex.message}"
            log.debug "Cannot send email ${body}", ex
        }
    }
}
