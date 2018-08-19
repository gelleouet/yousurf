<h3>Problèmes médicaux à signaler</h3>

<div class="field-group">
<label for="problemeMedical">Ex : allergies, traitements, etc.</label>
<g:textArea name="problemeMedical" value="${ inscription.medicaux ? inscription.medicaux[0].libelle : '' }" class="textarea full-width-field" maxlength="255"/>
</div>