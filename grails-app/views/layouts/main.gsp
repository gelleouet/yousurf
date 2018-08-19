<!doctype html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="YouSurf"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<g:set var="onDefaultLoad" value="onDefaultLoad('${controllerName}_${actionName}')"/>

<body class="${ pageProperty(name: 'body.pagelayout') }" onload="${ pageProperty(name: 'body.onload') ?: onDefaultLoad }">
    <div id="page">
        <g:applyLayout name="header"/>

        <section id="content" role="main">
            <header class="aui-page-header">
                <div class="aui-page-header-inner">
                    <div class="aui-page-header-main">
                        <g:pageProperty name="page.headermain"/>
                    </div>
                    <div class="aui-page-header-actions">
                        <g:pageProperty name="page.headeractions"/>
                    </div>
                </div>
            </header>


            <div class="aui-page-panel">
                <div class="aui-page-panel-inner">
                    <section class="aui-page-panel-content">
                        <g:layoutBody/>
                    </section>
                </div>
            </div>
        </section>

        <g:applyLayout name="footer"/>
    </div>

    <asset:javascript src="application.js"/>
</body>
</html>
