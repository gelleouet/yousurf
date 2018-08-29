<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
    <h3>${ command.id ? 'Workflow : ' + command.libelle : 'Nouveau workflow' }</h3>

    <g:uploadForm class="aui" action="save">
        <g:hiddenField name="id" value="${ command.id }"/>

        <g:render template="form"/>

        <div class="buttons-container">
            <div class="buttons">
                <button class="aui-button aui-button-primary">${ command.id ? 'Modifier' : 'Créer' }</button>
                <g:link class="aui-button aui-button-link">Annuler</g:link>
            </div>
        </div>
    </g:uploadForm>
</body>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>


</html>
