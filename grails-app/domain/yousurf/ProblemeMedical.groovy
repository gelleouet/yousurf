package yousurf

class ProblemeMedical implements Serializable {
  String libelle
  Inscription inscription


  static belongsTo = [inscription: Inscription]


  static constraints = {
  }


  static mapping = {
      table schema: Constantes.DEFAULT_SCHEMA
      inscription index: 'ProblemeMedical_Idx'
      libelle type: 'text'
  }
  
}
