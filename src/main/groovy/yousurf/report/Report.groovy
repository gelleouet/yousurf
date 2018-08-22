package yousurf.report

import org.apache.commons.lang.StringUtils
import yousurf.AppException

abstract class Report<T extends Report> {
    /**
     * Nom par défaut du report
     *
     * @return
     */
    final String name() {
        return StringUtils.uncapitalise(this.class.simpleName)
    }

    /**
     * Init du report avec le rendu
     *
     * @return
     * @throws AppException
     */
    final T build() throws AppException {
        buildImpl()
        return this
    }

    /**
     * Le init à impléménter
     *
     * @throws AppException
     */
    protected abstract void buildImpl() throws AppException
}
