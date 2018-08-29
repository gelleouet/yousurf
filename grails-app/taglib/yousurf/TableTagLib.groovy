package yousurf

class TableTagLib {
	static namespace = "app"


	/**
	 * Render une table avec sa pagination associée
	 * 
	 * @attr totalCount REQUIRED le nombre total d'items
	 * @attr cssClass
	 * @attr cssStyle
	 * @attr noPaginate true désactive la pagination
	 * @attr paginateForm
	 */
	def table = { attrs, body ->
		// le body contient déjà la structure de la table sauf la balise <table>
		StringBuilder builder = new StringBuilder()
		builder << "<table "
		builder << """class="aui ${ attrs.cssClass ?: '' }" """
		if (attrs.cssStyle) {
			builder << """style="${ attrs.cssStyle }" """
		}
		builder << ">"
		out << builder
		out << body()
		out << "</table>"

		if (attrs.totalCount > 0) {
			int offset =  params.int('offset')
			int max = params.int('max')

			int paginateDebut = offset + 1
			int paginateFin = Math.min(attrs.totalCount, offset + max)

			out << """<h6 class="pagination-info">${paginateDebut} à ${paginateFin} sur ${attrs.totalCount}<h6>"""
		}

		// rajout du template pagination si demandé
		if (! (attrs.noPaginate == 'true')) {
			out << render(template: '/templates/pagination', model: [paginateForm: attrs.paginateForm,
				totalCount: attrs.totalCount,
				max: params.max ?: 25])
		}
	}
}
