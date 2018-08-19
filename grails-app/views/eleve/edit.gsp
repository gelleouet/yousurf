<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
<g:form class="aui" action="saveEdit">
    <g:hiddenField name="id" value="${ eleve.id }"/>

    <g:render template="form"/>

    <div class="buttons-container">
        <div class="buttons">
            <button class="aui-button aui-button-primary">Modifier</button>
        </div>
    </div>
</g:form>
</body>


<content tag="headermain">
    <h1>Elève ${ eleve.prenom } ${ eleve.nom }</h1>
</content>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
