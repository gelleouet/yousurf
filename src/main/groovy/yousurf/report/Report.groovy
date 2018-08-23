package yousurf.report

import org.apache.commons.lang.StringUtils
import yousurf.AppException

abstract class Report {
    String baseURL


    /**
     * Nom par défaut du report
     *
     * @return
     */
    final String name() {
        return StringUtils.uncapitalise(this.class.simpleName)
    }

    /**
     * Le modèle des datas
     *
     * @return
     * @throws AppException
     */
    final Map model() throws AppException {
        Map model = [report: this]
        modelImpl(model)
        return model
    }

    /**
     * Le modèle à impléménter
     *
     * @throws AppException
     */
    protected abstract void modelImpl(Map model) throws AppException
}
