package yousurf.report

import javax.servlet.http.HttpServletResponse


/**
 * Contrat de base pour le reporting
 */
interface ReportService {

    /**
     * Rendu dans un flux quelconque
     *
     * @param report
     * @param outStream
     * @throws Exception
     */
    void render(Report report, OutputStream outStream) throws Exception


    /**
     * Rendu particulier dans le flux de la réponse HTTP
     *
     * @param report
     * @param response
     * @throws Exception
     */
    void render(Report report, HttpServletResponse response) throws Exception
}