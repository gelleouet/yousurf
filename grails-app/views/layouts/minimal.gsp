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
<body class="${pageProperty(name: 'body.pagelayout')}">
    <div id="page">
        <g:applyLayout name="header"/>

        <div class="aui-page-panel">
            <div class="aui-page-panel-inner">
                <section class="aui-page-panel-content">
                    <g:layoutBody/>
                </section>
            </div>
        </div>

        <g:applyLayout name="footer"/>
    </div>

    <asset:javascript src="application.js"/>
</body>
</html>
