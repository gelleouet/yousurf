<!doctype html>
<html lang="fr" class="aui-responsive">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="YouSurf"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=0.75"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<g:set var="onDefaultLoad" value="onDefaultLoad('${controllerName}_${actionName}')"/>

<body class="${ !mobileAgent ? pageProperty(name: 'body.pagelayout') : '' }" onload="${ pageProperty(name: 'body.onload', default: onDefaultLoad) }">
    <div id="page">
        <g:applyLayout name="header"/>

        <section id="content" role="main">

            <div class="aui-page-panel">
                <div class="aui-page-panel-inner">

                    <div class="aui-page-panel-nav">
                        <g:applyLayout name="navgroup-vertical">
                            <g:pageProperty name="page.navbar"/>
                        </g:applyLayout>
                    </div>

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
