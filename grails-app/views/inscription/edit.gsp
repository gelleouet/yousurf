<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
    <title>YouSurf Inscription</title>
</head>
<body>
    <g:form class="aui" action="saveEdit">
        <g:render template="form"/>

        <div class="buttons-container">
            <div class="buttons">
                <button class="aui-button aui-button-primary">Modifier</button>
            </div>
        </div>
    </g:form>
</body>


<content tag="headermain">
    <h1>Inscription ${ inscription.eleve.prenom } ${ inscription.eleve.nom }</h1>
</content>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
