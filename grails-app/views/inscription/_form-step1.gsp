<h3>Coordonnées de l'élève</h3>


<g:if test="${ inscription.eleve?.id }">
<g:hiddenField name="eleve.id" value="${ inscription.eleve.id }"/>
</g:if>

<div class="field-group">
<label for="eleve.email"><span class="aui-icon icon-required"></span> Email</label>
<g:field name="eleve.email" value="${ inscription.eleve?.email }" type="email" class="text" required="true" maxlength="255"/>
</div>
<div class="field-group">
<label for="eleve.nom"><span class="aui-icon icon-required"></span> Nom</label>
<g:field name="eleve.nom" value="${ inscription.eleve?.nom }" type="text" class="text full-width-field" required="true" maxlength="128"/>
</div>
<div class="field-group">
<label for="eleve.prenom"><span class="aui-icon icon-required"></span> Prénom</label>
<g:field name="eleve.prenom" value="${ inscription.eleve?.prenom }" type="text" class="text full-width-field" required="true" maxlength="128"/>
</div>
<div class="field-group">
<label for="eleve.adresse"><span class="aui-icon icon-required"></span> Adresse</label>
<g:textArea name="eleve.adresse" value="${ inscription.eleve?.adresse }" class="textarea full-width-field" required="true" maxlength="255"/>
</div>
<div class="field-group">
<label for="eleve.codePostal"><span class="aui-icon icon-required"></span> Code postal</label>
<g:field name="eleve.codePostal" value="${ inscription.eleve?.codePostal }" type="number" class="text short-field" required="true"/>
</div>
<div class="field-group">
<label for="eleve.ville"><span class="aui-icon icon-required"></span> Ville</label>
<g:field name="eleve.ville" value="${ inscription.eleve?.ville }" type="text" class="text full-width-field" required="true" maxlength="128"/>
</div>
<div class="field-group">
<label for="eleve.dateNaissance"><span class="aui-icon icon-required"></span> Date naissance</label>
<g:field name="eleve.dateNaissance" value="${ app.formatDatePicker(date:inscription.eleve?.dateNaissance) }" type="date" class="text medium-field aui-date-picker" required="true"/>
</div>
<div class="field-group">
<label for="eleve.telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
<g:field name="eleve.telephone" value="${ inscription.eleve?.telephone }" type="tel" class="text" required="true" maxlength="16"/>
</div>

