package yousurf

class Niveau implements Serializable {
  String libelle

  
  static constraints = {
  }


  static mapping = {
      table schema: Constantes.DEFAULT_SCHEMA
  }
}
