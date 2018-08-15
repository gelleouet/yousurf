package yousurf

class Eleve implements Serializable {
	String prenom
	String nom
	String adresse
	Integer codePostal
	String ville
	Date dateNaissance
	String telephone
	String email


	static constraints = {
		email email: true
	}


	static mapping = { 
		table schema: Constantes.DEFAULT_SCHEMA
		prenom index: 'Eleve_Prenom_Idx'
		nom index: 'Eleve_Nom_Idx'
	}
}
