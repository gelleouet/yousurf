package yousurf

import com.budjb.rabbitmq.publisher.RabbitMessagePublisher
import grails.converters.JSON
import grails.gorm.transactions.Transactional
import jdk.nashorn.internal.runtime.JSONFunctions
import org.apache.fop.fonts.type1.AdobeStandardEncoding


@Transactional(readOnly = true, rollbackFor = [AppException])
abstract class AbstractService<T> {
    RabbitMessagePublisher rabbitMessagePublisher


    /**
     * Enregistrement domain avec validation
     *
     * @param domain
     * @return
     * @throws AppException
     */
    @Transactional(readOnly = false, rollbackFor = [AppException])
    T save(T domain) throws AppException {
        if (!domain.save()) {
            throw new AppException("Erreur enregistrement", [errors: domain.errors])
        }

        return domain
    }


    /**
     * Envoi d'un message sur le bus RabbitMQ
     *
     * @param exchange
     * @param routingKey
     * @param body
     */
    void sendAsyncMessage(String exchange, String routingKey, Map body) {
        if (!body) {
            body = [:]
        }

        rabbitMessagePublisher.send(exchange, routingKey, (body as JSON).toString())
    }
}