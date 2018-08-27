<div class="aui-sidebar-group">
    <div class="aui-nav-heading" title="Général">
        <strong>Général</strong>
    </div>
    <ul class="aui-nav">
        <li class="${ controllerName == 'inscription' ? 'aui-nav-selected' : '' }"><g:link controller="inscription">Inscriptions</g:link></li>
        <li class="${ controllerName == 'eleve' ? 'aui-nav-selected' : '' }"><g:link controller="eleve">Elèves</g:link></li>
        <li class="${ controllerName == 'contact' ? 'aui-nav-selected' : '' }"><g:link controller="contact">Contacts</g:link></li>
    </ul>
</div>