<div class="aui-sidebar-group aui-sidebar-group-actions">
    <div class="aui-nav-heading" title="Général">
        <strong>Général</strong>
    </div>
    <ul class="aui-nav">
        <li class="${ controllerName == 'inscription' ? 'aui-nav-selected' : '' }"><g:link controller="inscription">Inscriptions</g:link></li>
        <li class="${ controllerName == 'eleve' ? 'aui-nav-selected' : '' }"><g:link controller="eleve">Elèves</g:link></li>
        <li class="${ controllerName == 'contact' ? 'aui-nav-selected' : '' }"><g:link controller="contact">Contacts</g:link></li>
    </ul>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN_SYS">
    <div class="aui-sidebar-group aui-sidebar-group-actions">

        <div class="aui-nav-heading" title="Système">
            <strong>Système</strong>
        </div>
        <ul class="aui-nav">
            <li class="${ controllerName == 'workflow' ? 'aui-nav-selected' : '' }"><g:link controller="workflow">Workflows</g:link></li>
        </ul>
    </div>
</sec:ifAnyGranted>