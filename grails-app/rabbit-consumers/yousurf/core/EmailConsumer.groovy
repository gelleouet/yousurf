package yousurf.core

import com.budjb.rabbitmq.consumer.MessageContext
import com.google.gson.Gson
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
     * @param context Properties of the incoming message.
     * @return
     */
    def handleMessage(MessageContext messageContext) {
        Gson gson = new Gson()
        Map body = gson.fromJson(new String(messageContext.body), Map.class)

        try {
            emailService.send(body)
        } catch (AppException ex) {
            log.error "Cannot send email ${body} : ${ex.message}"
            log.debug "Cannot send email ${body}", ex
        }
    }
}
