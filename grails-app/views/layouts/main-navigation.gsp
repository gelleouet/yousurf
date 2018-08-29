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

        <header class="aui-page-header" style="border-bottom:1px solid #dfe1e6;">
            <div class="aui-page-header-inner">
                <div class="aui-page-header-image">
                    <div class="aui-avatar aui-avatar-medium">
                        <div class="aui-avatar-inner">
                            <span class="aui-icon aui-icon-large aui-iconfont-configure"></span>
                        </div>
                    </div>
                </div>
                <div class="aui-page-header-main">
                    <h2>Paramètres</h2>
                </div>
            </div>
        </header>


        <div class="aui-sidebar">
            <div class="aui-sidebar-wrapper" style="border-right:1px solid #dfe1e6;">
                <div class="aui-sidebar-body" >
                    <nav class="aui-navgroup aui-navgroup-vertical">
                        <div class="aui-navgroup-inner">
                            <g:pageProperty name="page.navbar"/>
                        </div>
                    </nav>
                </div>
                <!--<div class="aui-sidebar-footer">
                    <a class="aui-button aui-button-subtle aui-sidebar-toggle aui-sidebar-footer-tipsy">
                        <span class="aui-icon aui-icon-small"></span>
                    </a>
                </div>-->
            </div>
        </div>

        <div class="aui-page-panel">
            <div class="aui-page-panel-inner">
                <section class="aui-page-panel-content">
                    <g:if test="${ request.appException }">
                        <g:applyLayout name="message-error">
                            ${ request.appException.message }
                            <content tag="bodymessage">
                                <g:if test="${ request.appException.params.errors }">
                                    <g:set var="fieldError" value="${ request.appException.params.errors.getFieldError() }"/>
                                    <g:message code="${ fieldError.code }" args="${ fieldError.arguments }"/>
                                </g:if>
                            </content>
                        </g:applyLayout>
                    </g:if>

                    <g:layoutBody/>
                </section>
            </div>
        </div>
    </section>

    <div id="ajaxDialog"></div>

    <g:applyLayout name="footer"/>
</div>

<asset:javascript src="application.js"/>
</body>
</html>
