package yousurf.core

import com.budjb.rabbitmq.publisher.RabbitMessagePublisher
import grails.async.Promises
import grails.converters.JSON


class QueueService {

    RabbitMessagePublisher rabbitMessagePublisher


    /**
     * Envoi d'un message sur le bus RabbitMQ
     * Sans transaction pour ne pas loader des assocations au momemt de la conversion JSON
     * Cela veut dire que l'objet doit être dans son état final en arrivant ici, au code appelant de faire
     * le nécessaire pour que les infos nécessaires soit déjà chargées
     *
     * @param exchange
     * @param routingKey
     * @param body
     */
    void queueMessage(String exchange, String routingKey, Map body) {
        if (!body) {
            body = [:]
        }

        rabbitMessagePublisher.send(exchange, routingKey, (body as JSON).toString())
    }


    /**
     * Envoi d'un message en asynchrone
     *
     * @param exchange
     * @param routingKey
     * @param body
     */
    void asyncQueueMessage(String exchange, String routingKey, Map body) {
        Promises.task {
            sendMessage(exchange, routingKey, body)
        }.onError {
            log.error "Cannot send message ${routingKey}", it
        }
    }
}
