package yousurf.report

import grails.core.GrailsApplication
import yousurf.report.Report
import javax.servlet.http.HttpServletResponse


/**
 * Contrat de base pour le reporting
 */
abstract class AbstractReportService implements ReportService {

    static final String DEFAULT_CONTENT_TYPE = "application/download"
    static final String DEFAULT_EXTENSION = "pdf"


    GrailsApplication grailsApplication


    /**
     * La méthode haut niveau à implémenter sans tenir compte de aspects bas niveau (fermeture flux, buffer, ...)
     *
     * @param report
     * @param outStream
     * @throws Exception
     */
    protected abstract void renderImpl(Report report, OutputStream outStream) throws Exception


    /**
     * Rendu dans un flux quelconque. Le flux sera bufferisé et on s'assure qu'il est bien fermé
     * en fin de méthode même avec erreur
     * Le report est initialisé avec le rendu
     *
     * @param report
     * @param outStream
     * @throws Exception
     */
    @Override
    final void render(Report report, OutputStream outStream) throws Exception {
        // traitement commun avant le rendu
        report.baseURL = grailsApplication.config.getProperty("yousurf.server.localBaseURL")

        new BufferedOutputStream(outStream).withStream {
            renderImpl(report, it)
        }
    }


    /**
     * Rendu particulier dans le flux de la réponse HTTP
     * Le content type sera ajusté automatiquement ainsi que le nom de la ressource
     *
     * @param report
     * @param response
     * @throws Exception
     */
    @Override
    final void render(Report report, HttpServletResponse response) throws Exception {
        response.setContentType(DEFAULT_CONTENT_TYPE)
        response.setHeader("Content-Disposition", "attachment; filename=${ report.name() }.${ DEFAULT_EXTENSION }")
        render(report, response.getOutputStream())
    }

}