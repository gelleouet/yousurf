package yousurf.edi

import com.google.gson.Gson
import grails.gorm.transactions.Transactional
import org.apache.http.HttpResponse
import org.apache.http.client.fluent.Form
import org.apache.http.client.fluent.Request
import org.apache.http.client.utils.URIBuilder
import org.springframework.beans.factory.annotation.Value
import yousurf.AppException
import yousurf.Eleve

import javax.validation.constraints.NotNull
import java.nio.charset.Charset


/**
 * Echange de données avec l'application Hiboutik via son API REST
 *
 * @see https://www.hiboutik.com/
 */
@Transactional
class HiboutikService {

    @NotNull
    @Value('${edi.hiboutik.url}')
    String hiboutikApiURL

    @NotNull
    @Value('${edi.hiboutik.username}')
    String hiboutikApiUsername

    @NotNull
    @Value('${edi.hiboutik.key}')
    String hiboutikApiKey


    /**
     * Synchronise un éléve vers la base client Hiboutik
     * Vérifie d'abord si le client existe déjà avec son adresse email
     * Si oui déclenche un update, sinon un insert
     *
     * @param eleve
     * @throws AppException
     */
    void syncEleve(Eleve eleve) throws AppException {
        Map jsonEleve = searchEleve(eleve)

        if (!jsonEleve) {
            createEleve(eleve)
        } else {
            throw new AppException("email ${eleve.email} already exist !")
        }
    }

    /**
     * Recherche de l'élève et renvoit le JSON associé si trouvé
     *
     * @param eleve
     * @return
     */
    private Map searchEleve(Eleve eleve) throws AppException {
        // recherche de l'élève avec son email
        URI uriSearchCustomer = new URIBuilder("$hiboutikApiURL/search/customers")
                .addParameter("email", eleve.email)
                .build()

        HttpResponse response = Request.Get(uriSearchCustomer)
                .addHeader("Authorization", "Basic ${apiAuthorization()}")
                .execute()
                .returnResponse()

        Map result

        switch (response.statusLine.statusCode) {
            case 200:
                result = new Gson().fromJson(response.getEntity().getContent().getText(), Map)
                break
            case 401:
                throw new AppException("Hiboutik API Unauthorized action")
            case 404: // email not found
                break
        }

        return result
    }


    /**
     * Création d"un élève
     *
     * @param eleve
     * @throws AppException
     */
    private void createEleve(Eleve eleve) throws AppException {
        URI uriCreateCustomer = new URIBuilder("$hiboutikApiURL/customers")
                .build()

        HttpResponse response = Request.Post(uriCreateCustomer)
                .addHeader("Authorization", "Basic ${apiAuthorization()}")
                .addHeader("Accept", "application/json")
                .bodyForm(Form.form().add("customers_first_name", eleve.prenom)
                                     .add("customers_last_name", eleve.nom)
                                     .add("customers_email", eleve.email)
                                     .add("customers_phone_number", eleve.telephone)
                                     .add("customers_birth_date", eleve.dateNaissance.format("yyyy-MM-dd"))
                                     .build(), Charset.forName("utf-8"))
                .execute()
                .returnResponse()

        switch (response.statusLine.statusCode) {
            case 401:
                throw new AppException("Hiboutik API Unauthorized action")
            case 500:
                throw new AppException("Hiboutik API Server Error")
            case 200:
                break
        }

        // le customer est créé et la requête a renvoyé son ID
        // on va créé son adresse associée
        Map customer = new Gson().fromJson(response.getEntity().getContent().getText(), Map)

        URI uriCreateAddress = new URIBuilder("$hiboutikApiURL/customers_addresses")
                .build()

        response = Request.Post(uriCreateAddress)
                .addHeader("Authorization", "Basic ${apiAuthorization()}")
                .addHeader("Accept", "application/json")
                .bodyForm(Form.form().add("customers_id", customer.customers_id)
                                     .build(), Charset.forName("utf-8"))
                .execute()
                .returnResponse()

        switch (response.statusLine.statusCode) {
            case 401:
                throw new AppException("Hiboutik API Unauthorized action")
            case 500:
                throw new AppException("Hiboutik API Server Error")
            case 200:
                break
        }

        // l'adresse est créée mais vide
        // il faut renvoyer les attributs 1 à 1 (pas commode comme api ...)
        Map address = new Gson().fromJson(response.getEntity().getContent().getText(), Map)

        URI uriUpdateAddress = new URIBuilder("$hiboutikApiURL/customers_addresses/${address.address_id}")
                .build()

        Map attributes = ["first_name": eleve.prenom, "last_name": eleve.nom, "email": eleve.email,
                          "phone": eleve.telephone, "address": eleve.adresse, "zip_code": eleve.codePostal,
                          "city": eleve.ville]

        attributes.each { key, value ->
            response = Request.Put(uriUpdateAddress)
                    .addHeader("Authorization", "Basic ${apiAuthorization()}")
                    .addHeader("Accept", "application/json")
                    .bodyForm(Form.form().add("address_attribute", key)
                                        .add("new_value", value as String)
                                        .build(), Charset.forName("utf-8"))
                    .execute()
                    .returnResponse()

            switch (response.statusLine.statusCode) {
                case 401:
                    throw new AppException("Hiboutik API Unauthorized action")
                case 500:

                    throw new AppException("Hiboutik API Server Error : ${ response.getEntity().getContent().getText() }")
                case 200:
                    break
            }
        }
    }


    /**
     * La clé d'authentification de l'API
     *
     * @return
     */
    private String apiAuthorization() {
        return "$hiboutikApiUsername:$hiboutikApiKey".bytes.encodeBase64().toString()
    }
}
