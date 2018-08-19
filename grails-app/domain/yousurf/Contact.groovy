package yousurf

class Contact implements Serializable {
	String prenom
	String nom
	String telephone
	String portable

	
	static constraints = {

	}
  
	
	static mapping = {
		table schema: Constantes.DEFAULT_SCHEMA
		prenom index: 'Contact_Prenom_Idx', length: 128
		nom index: 'Contact_Nom_Idx', length: 128
		portable length: 16
		telephone length: 16
	}
}
