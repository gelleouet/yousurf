<html>
<head>
    <meta name="layout" content="main"/>
    <title>YouSurf Connexion</title>
</head>

<body pagelayout="aui-page-focused aui-page-size-large">
    <asset:image src="surf-guidel.jpg" class="header-banniere-img"/>

    <div style="text-align:center;">
        <h1 class="header-banniere-text">Identification</h1>
    </div>

    <h2>Connectez-vous à l'aide de vos identifiants</h2>

    <g:if test='${flash.message}'>
        <g:applyLayout name="message-warning">
            ${flash.message}
        </g:applyLayout>
    </g:if>

    <g:form controller="login" action="authenticate" class="aui" autocomplete="off">
        <div class="field-group">
            <label for="username"><span class="aui-icon icon-required"></span> <g:message code='springSecurity.login.username.label'/></label>
            <g:field name="username" type="email" class="text" required="true"/>
        </div>

        <div class="field-group">
            <label for="password"><span class="aui-icon icon-required"></span> <g:message code='springSecurity.login.password.label'/></label>
            <g:passwordField name="password" class="text" required="true"/>
        </div>

        <fieldset class="group">
            <legend></legend>
            <div class="checkbox">
                <g:checkBox id="remember_me" name="${rememberMeParameter ?: 'remember-me'}" checked="${hasCookie}" class="checkbox"/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </div>
        </fieldset>


        <div class="buttons-container">
            <div class="buttons">
                <button class="aui-button aui-button-primary">${message(code: 'springSecurity.login.button')}</button>
            </div>
        </div>
    </g:form>
</body>
</html>