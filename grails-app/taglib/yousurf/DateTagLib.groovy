package yousurf

/**
 * Date taglib
 */
class DateTagLib {
    static namespace = 'app'
    static defaultEncodeAs = [taglib:'html']
    // les tags renvoyant directement une valeur pouvant être utilisé comme fonction
    static returnObjectForTags = ['formatDatePicker']

    /**
     * formattage date pour composant picker
     *
     * @attr date REQUIRED la date à formatter
     * @body body
     */
    def formatDatePicker = {attrs, body ->
        g.formatDate(date: attrs.date, format: DateUtils.FORMAT_DATE_PICKER)
    }
}