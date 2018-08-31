package yousurf.core

class Email implements Serializable {
    String from
    List<String> to = []
    List<String> cc = []
    List<String> bcc = []
    String subject
    List<Map> attachments = [] // Map de type [name(required), [url|link](required), contentType]
                                // link est une map utilisée pour le generator link de grails
    // soit le body, soit la paire view/model
    String body
    String view
    Map model = [:]
}
