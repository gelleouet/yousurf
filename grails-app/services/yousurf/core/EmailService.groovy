package yousurf.core

import grails.converters.JSON
import yousurf.AppException
import yousurf.Constantes


class EmailService {

    QueueService queueService


    /**
     * Envoi un email sur la queue associée
     * L'email ne sera réellement envoyée que lorsqu'il sera pris en charge par un consumer
     *
     * @param email
     */
    void queue(Email email) throws AppException {
        assertEmail(email)
        queueService.queueMessage(Constantes.DIRECT_EXCHANGE, Constantes.EMAIL_QUEUE,
            email as JSON)
    }


    /**
     * Envoi réel d'un email au format Map (avec toutes les propriétés de l'objet Email)
     *
     * @param email
     * @throws AppException
     */
    void send(Map email) throws AppException {
        assertEmail(email)
    }


    /**
     * Envoi réel d'un email
     *
     * @param email
     * @throws AppException
     */
    void send(Email email) throws AppException {
        assertEmail(email)
    }


    /**
     * Contrôle sur email
     *
     * @param email
     * @throws AppException
     */
    void assertEmail(def email) throws AppException {
        if (! email?.to) {
            throw new AppException("to is required !")
        }

        if (!email.subject) {
            throw new AppException("subject is required !")
        }

        if (!email.body) {
            throw new AppException("body is required !")
        }
    }

}
