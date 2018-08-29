package yousurf

/**
 * Utilitaires date
 *
 */
class DateUtils {
    static String FORMAT_DATE_PICKER = "yyyy-MM-dd"


    /**
     * Formatte une date avec le format "Il y a ...."
     * Ex: "il y a 1 minute, il y a 1 jour, etc.
     *
     * @param date
     * @return
     */
    static String formatTimeAgo(Date date) {
        Date now = new Date()
        String timeAgo = "Il y a "

        if (date) {
            use(groovy.time.TimeCategory) {
                def duration = now - date

                if (duration.years > 0) {
                    timeAgo += "${duration.years}an${duration.years > 1 ? 's' : ''}"

                    if (duration.months > 0) {
                        timeAgo += " ${duration.months}mois"
                    }
                } else if (duration.months > 0) {
                    timeAgo += "${duration.months}mois"

                    if (duration.days > 0) {
                        timeAgo += " ${duration.days}j"
                    }
                } else if (duration.days > 0) {
                    timeAgo += "${duration.days}j"

                    if (duration.hours > 0) {
                        timeAgo += " ${duration.hours}h"
                    }
                } else if (duration.hours > 0) {
                    timeAgo += "${duration.hours}h"

                    if (duration.minutes > 0) {
                        timeAgo += " ${duration.minutes}m"
                    }
                } else if (duration.minutes > 0) {
                    timeAgo += "${duration.minutes}m"
                } else {
                    timeAgo = "A l'instant"
                }
            }

            return timeAgo
        } else {
            return null
        }
    }
}