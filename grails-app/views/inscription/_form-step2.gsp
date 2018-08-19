<h3>Personne à prévenir en cas d'accident</h3>

<g:if test="${ inscription.contact?.id }">
<g:hiddenField name="contact.id" value="${ inscription.contact.id }"/>
</g:if>

<div class="field-group">
<label for="contact.nom"><span class="aui-icon icon-required"></span> Nom</label>
<g:field name="contact.nom" value="${ inscription.contact?.nom }" type="text" class="text full-width-field" required="true" maxlength="128"/>
</div>
<div class="field-group">
<label for="contact.prenom"><span class="aui-icon icon-required"></span> Prénom</label>
<g:field name="contact.prenom" value="${ inscription.contact?.prenom }" type="text" class="text full-width-field" required="true" maxlength="128"/>
</div>
<div class="field-group">
<label for="contact.telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
<g:field name="contact.telephone" value="${ inscription.contact?.telephone }" type="tel" class="text" required="true" maxlength="16"/>
</div>
<div class="field-group">
<label for="contact.portable"><span class="aui-icon icon-required"></span> Portable</label>
<g:field name="contact.portable" value="${ inscription.contact?.portable }" type="tel" class="text" required="true" maxlength="16"/>
</div>