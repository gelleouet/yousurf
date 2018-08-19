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
		email email: true, unique: true
	}


	static mapping = { 
		table schema: Constantes.DEFAULT_SCHEMA
		prenom index: 'Eleve_Prenom_Idx', length: 128
		nom index: 'Eleve_Nom_Idx', length: 128
		email index: 'Eleve_Email_Idx', length: 128
		telephone length: 16
		ville length: 128
	}
}
