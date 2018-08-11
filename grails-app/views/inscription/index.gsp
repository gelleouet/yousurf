<!doctype html>
<html>
<head>
    <meta name="layout" content="minimal"/>
    <title>YouSurf Inscription</title>
</head>
<body pagelayout="aui-page-focused aui-page-size-large">
    <asset:image src="boutik-yousurf.jpg" style="width:100%; height:254px"/>

    <div style="text-align:center;">
        <h1 style="font-size:28pt">Formulaire d'inscription</h1>
    </div>


    <g:form class="aui">
        <div style="text-align:center;">
            <label for="dateDebut">Du</label>
            <g:field name="dateDebut" type="date" class="aui-date-picker"/>
            <label for="dateFin"> Au </label>
            <g:field name="dateFin" type="date" class="aui-date-picker"/>
        </div>

        <h3>Coordonnées de l'élève</h3>

        <div class="field-group">
            <label for="nom"><span class="aui-icon icon-required"></span> Nom</label>
            <g:field name="nom" type="text" class="text full-width-field"/>
        </div>
        <div class="field-group">
            <label for="prenom"><span class="aui-icon icon-required"></span> Prénom</label>
            <g:field name="prenom" type="text" class="text full-width-field"/>
        </div>
        <div class="field-group">
            <label for="adresse"><span class="aui-icon icon-required"></span> Adresse</label>
            <g:textArea name="adresse" class="textarea full-width-field"/>
        </div>
        <div class="field-group">
            <label for="codePostal"><span class="aui-icon icon-required"></span> Code postal</label>
            <g:field name="codePostal" type="number" class="text short-field"/>
        </div>
        <div class="field-group">
            <label for="ville"><span class="aui-icon icon-required"></span> Ville</label>
            <g:field name="ville" type="text" class="text full-width-field"/>
        </div>
        <div class="field-group">
            <label for="dateNaissance"><span class="aui-icon icon-required"></span> Date naissance</label>
            <g:field name="dateNaissance" type="date" class="aui-date-picker"/>
        </div>
        <div class="field-group">
            <label for="telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
            <g:field name="telephone" type="tel" class="text"/>
        </div>
        <div class="field-group">
            <label for="email"><span class="aui-icon icon-required"></span> Email</label>
            <g:field name="email" type="email" class="text"/>
        </div>

        <h3>Personne à prévenir en cas d'accident</h3>

        <div class="field-group">
            <label for="contact.nom"><span class="aui-icon icon-required"></span> Nom</label>
            <g:field name="contact.nom" type="text" class="text full-width-field"/>
        </div>
        <div class="field-group">
            <label for="contact.prenom"><span class="aui-icon icon-required"></span> Prénom</label>
            <g:field name="contact.prenom" type="text" class="text full-width-field"/>
        </div>
        <div class="field-group">
            <label for="contact.telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
            <g:field name="contact.telephone" type="tel" class="text"/>
        </div>
        <div class="field-group">
            <label for="contact.portable"><span class="aui-icon icon-required"></span> Portable</label>
            <g:field name="contact.portable" type="tel" class="text"/>
        </div>

        <h3>Problèmes médicaux à signaler (ex : allergies, traitements, etc.)</h3>

        <div class="field-group">
            <label for="problemeMedicaux[0].libelle"></label>
            <g:textArea name="problemeMedicaux[0].libelle" class="textarea full-width-field"/>
        </div>
    </g:form>
</body>
</html>
