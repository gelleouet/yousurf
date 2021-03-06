<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body pagelayout="aui-page-focused aui-page-size-large" onload="onLoadInscriptionCreate()">
    <div>
        <asset:image src="boutik-yousurf.jpg" class="header-banniere-img"/>
    </div>

    <div style="text-align:center;">
        <h1 class="header-banniere-text">Formulaire d'inscription</h1>
    </div>

    <g:form class="aui" name="inscription-form">
        <g:hiddenField name="currentStep" value="${ inscription.currentStep }"/>
        <g:hiddenField name="id" value="${ inscription.id }"/>

        <g:render template="progress-step"/>

        <g:applyLayout name="app-exception"/>

        <g:render template="form-step${ inscription.currentStep }"/>

        <div class="buttons-container">
            <div class="buttons">
                <g:if test="${ inscription.currentStep > 1 }">
                    <button class="aui-button aui-button-primary" name="_action_createPrevStep">Précédent</button>
                </g:if>
                <g:if test="${ inscription.currentStep < steps.size() }">
                    <button class="aui-button aui-button-primary" name="_action_createNextStep">Suivant</button>
                </g:if>
                <g:if test="${ inscription.currentStep == steps.size() }">
                    <button class="aui-button aui-button-primary" name="_action_confirm">Valider</button>
                </g:if>
                <g:link action="reglement" target="reglement" class="aui-button">
                    <span class="aui-icon aui-icon-small aui-iconfont-info"></span> Lire les conditions et règlements
                </g:link>
            </div>
        </div>
    </g:form>
</body>
</html>
