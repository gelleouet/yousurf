<div class="field-group">
    <label for="nom"><span class="aui-icon icon-required"></span> Nom</label>
    <g:field name="nom" value="${ eleve?.nom }" type="text" class="text long-field" required="true"/>
</div>
<div class="field-group">
    <label for="prenom"><span class="aui-icon icon-required"></span> Prénom</label>
    <g:field name="prenom" value="${ eleve?.prenom }" type="text" class="text long-field" required="true"/>
</div>
<div class="field-group">
    <label for="adresse"><span class="aui-icon icon-required"></span> Adresse</label>
    <g:textArea name="adresse" value="${ eleve?.adresse }" class="textarea long-field" required="true"/>
</div>
<div class="field-group">
    <label for="codePostal"><span class="aui-icon icon-required"></span> Code postal</label>
    <g:field name="codePostal" value="${ eleve?.codePostal }" type="number" class="text short-field" required="true"/>
</div>
<div class="field-group">
    <label for="ville"><span class="aui-icon icon-required"></span> Ville</label>
    <g:field name="ville" value="${ eleve?.ville }" type="text" class="text long-field" required="true"/>
</div>
<div class="field-group">
    <label for="dateNaissance"><span class="aui-icon icon-required"></span> Date naissance</label>
    <g:field name="dateNaissance" value="${ app.formatDatePicker(date: eleve?.dateNaissance) }" type="date" class="text medium-field aui-date-picker"/>
</div>
<div class="field-group">
    <label for="telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
    <g:field name="telephone" value="${ eleve?.telephone }" type="tel" class="text" required="true"/>
</div>
<div class="field-group">
    <label for="email"><span class="aui-icon icon-required"></span> Email</label>
    <g:field name="email" value="${ eleve?.email }" type="email" class="text" required="true"/>
</div>
