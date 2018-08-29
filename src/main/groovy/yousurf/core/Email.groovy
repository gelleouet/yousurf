package yousurf.core

class Email implements Serializable {
    String from
    List<String> to = []
    List<String> cc = []
    List<String> bcc = []
    String subject
    List<String> attachments = []

    String title
    String body

}
