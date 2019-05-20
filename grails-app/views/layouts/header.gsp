<header id="header" role="banner">
    <nav class="aui-header aui-dropdown2-trigger-group" role="navigation">
        <div class="aui-header-inner">
            <div class="aui-header-primary">
                <h1 id="logo" class="aui-header-logo aui-header-logo-aui"><g:link uri="/"><asset:image src="yousurf-logo.png"/></g:link></h1>
                <ul class="aui-nav">
                    <sec:ifLoggedIn>
                        <li><g:link controller="inscription" action="create" class="aui-button aui-button-primary">Inscription</g:link></li>
                    </sec:ifLoggedIn>
                </ul>
            </div>
            <div class="aui-header-secondary">
                <ul class="aui-nav">
                    <sec:ifLoggedIn>
                        <li>
                            <a href="#dropdown2-user" aria-owns="dropdown2-user" aria-haspopup="true" class="aui-dropdown2-trigger" ><span class="aui-icon aui-icon-small aui-iconfont-person-circle"></span><span class="aui-icon-dropdown"></span></a>
                            <div class="aui-dropdown2 aui-style-default aui-dropdown2-in-header" id="dropdown2-user" aria-hidden="true">
                                <div class="aui-dropdown2-section">
                                    <div class="aui-dropdown2-heading">
                                        <sec:username/>
                                    </div>
                                    <ul>
                                        <li><g:link controller="inscription">Paramètres</g:link></li>
                                    </ul>
                                </div>
                                <div class="aui-dropdown2-section">
                                    <ul>
                                        <li><g:link uri="/logoff">Déconnexion</g:link></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </sec:ifLoggedIn>
                    <li>
                        <a href="#dropdown2-aide" aria-owns="dropdown2-aide" aria-haspopup="true" class="aui-dropdown2-trigger" ><span class="aui-icon aui-icon-small aui-iconfont-help">Help</span><span class="aui-icon-dropdown"></span></a>
                        <div class="aui-dropdown2 aui-style-default aui-dropdown2-in-header" id="dropdown2-aide" aria-hidden="true">
                            <div class="aui-dropdown2-section">
                                <div class="aui-dropdown2-heading">
                                    Yousurf v<g:meta name="info.app.version"/>
                                </div>
                                <ul>
                                    <li><a href="https://www.facebook.com/surfshoplastageguidelxyousurf.fr/" target="facebook">Facebook</a></li>
                                    <li><g:link controller="inscription" action="reglement" target="reglement">Conditions &amp; Règlements</g:link></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>