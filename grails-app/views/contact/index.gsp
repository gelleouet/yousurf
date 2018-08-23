<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
    <div style="overflow-x:auto;">
        <table class="aui">
            <thead>
            <th>Prénom / Nom</th>
            <th>Téléphone</th>
            <th>Portable</th>
            <th class="actions-column-size-1">Actions</th>
            </thead>
            <tbody>
            <g:each var="contact" in="${ contactList }">
                <tr>
                    <td><g:link action="edit" id="${ contact.id }">${ contact.prenom } ${ contact.nom }</g:link></td>
                    <td>${ contact.telephone }</td>
                    <td>${ contact.portable }</td>
                    <td class="actions-column actions-column-size-1">

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <g:paginate total="${ contactList.totalCount }" max="${ params.max }"/>
</body>


<content tag="headermain">
    <h1>Contacts</h1>
    <g:form class="aui">
        <g:textField name="prenom" class="text medium-field" value="${ command.prenom }" placeholder="Prénom"/>
        <g:textField name="nom" class="text medium-field" value="${ command.nom }" placeholder="Nom"/>
        <g:textField name="telephone" class="text medium-field" value="${ command.telephone }" placeholder="Téléphone / portable"/>
        <button class="aui-button"><span class="aui-icon aui-icon-small aui-iconfont-search"></span></button>
    </g:form>
</content>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
