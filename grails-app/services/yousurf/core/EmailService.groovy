package yousurf.core

import grails.core.GrailsApplication
import grails.gsp.PageRenderer
import grails.web.mapping.LinkGenerator
import org.apache.http.client.fluent.Request
import org.springframework.core.io.ByteArrayResource
import org.springframework.core.io.InputStreamSource
import org.springframework.core.io.UrlResource
import org.springframework.mail.MailException
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import yousurf.AppException
import yousurf.Constantes
import javax.mail.internet.MimeMessage


class EmailService {

    QueueService queueService
    JavaMailSender javaMailSender
    GrailsApplication grailsApplication
    PageRenderer groovyPageRenderer
    LinkGenerator grailsLinkGenerator


    /**
     * Envoi un email sur la queue associée
     * L'email ne sera réellement envoyée que lorsqu'il sera pris en charge par un consumer
     *
     * @param email
     */
    void queue(Email email) throws AppException {
        assertEmail(email)
        queueService.queueMessage(Constantes.DIRECT_EXCHANGE, Constantes.EMAIL_QUEUE, email)
    }


    /**
     * Envoi réel d'un email au format Map (avec toutes les propriétés de l'objet Email)
     *
     * @param email
     * @throws AppException
     */
    void send(Map email) throws AppException {
        send(new Email(email))
    }


    /**
     * Envoi réel d'un email
     *
     * @param email
     * @throws AppException
     */
    void send(Email email) throws AppException {
        assertEmail(email)

        MimeMessage message = javaMailSender.createMimeMessage()
        MimeMessageHelper helper = new MimeMessageHelper(message, email.attachments.size() > 0)

        helper.setFrom(grailsApplication.config.getProperty("email.smtp.from"))
        helper.setTo(email.to as String[])
        if (email.cc) {
            helper.setCc(email.cc as String[])
        }
        if (email.bcc) {
            helper.setBcc(email.bcc as String[])
        }
        helper.setSubject(email.subject)

        // le body est déjà prêt, on le prend tel quel
        // sinon on lance le template sur le model
        String body

        if (email.body) {
            body = email.body

        } else {
            def model = [publicBaseURL: grailsApplication.config.yousurf.server.publicBaseURL]
            model.putAll(email.model)
            body = groovyPageRenderer.render(view: "/email/${ email.view }", model: model)
            /*new FileOutputStream("/home/gregory/email.html").withStream {
                groovyPageRenderer.renderTo(view: "/email/${ email.view }", model: model, it)
            }*/

        }

        if (!body) {
            throw new AppException("body is empty !")
        }

        helper.setText(body, true)

        // gestion des pièces jointes
        email.attachments?.each { attachment ->
            if (attachment.name && (attachment.url || attachment.link)) {
                InputStreamSource source

                if (attachment.url) {
                    source = new UrlResource(attachment.url)
                } else {
                    // pour les ressources buildés, on passe par un buffer car JavaMail peut interroger plusieurs fois
                    // la ressource (ex : calculer size, content type, etc.)
                    // on passe le token aussi dans le header
                    try {
                        source = new ByteArrayResource(fetchUrl(attachment.link))
                    } catch (Exception ex) {
                        throw new AppException(ex)
                    }
                }

                helper.addAttachment(attachment.name, source, attachment.contentType)
            }
        }

        try {
            javaMailSender.send(message)
        } catch (MailException ex) {
            throw new AppException(ex)
        }
    }


    /**
     * Contrôle sur email
     *
     * @param email
     * @throws AppException
     */
    void assertEmail(Email email) throws AppException {
        if (! email?.to) {
            throw new AppException("to is required !")
        }

        if (!email.subject) {
            throw new AppException("subject is required !")
        }

        if (!email.body && !email.view) {
            throw new AppException("body or view is required !")
        }
    }

    /**
     * Télécharge une resource yousurf dans un buffer
     *
     * @param link
     * @return byte[]
     * @throws Exception
     */
    private byte[] fetchUrl(Map link) throws Exception {
        def params = [base: grailsApplication.config.yousurf.server.localBaseURL]
        params.putAll(link)
        String url = grailsLinkGenerator.link(params)

        return Request.Get(url)
                .addHeader("Authorization", grailsApplication.config.yousurf.security.token)
                .execute()
                .returnContent()
                .asBytes()
    }

}
