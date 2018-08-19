<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
<table class="aui">
    <thead>
    <th>Prénom / Nom</th>
    <th>Téléphone</th>
    <th>Email</th>
    <th>Ville</th>
    <th></th>
    </thead>
    <tbody>
    <g:each var="eleve" in="${ eleveList }">
        <tr>
            <td><g:link action="edit" id="${ eleve.id }">${ eleve.prenom } ${ eleve.nom }</g:link></td>
            <td>${ eleve.telephone }</td>
            <td>${ eleve.email }</td>
            <td>${ eleve.codePostal } ${ eleve.ville }</td>
            <td><g:link controller="inscription" action="createForEleve" id="${ eleve.id }" title="Nouvelle inscription" class="aui-button aui-button-subtle"><span class="aui-icon aui-icon-small aui-iconfont-add-circle"></span></g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:paginate total="${ eleveList.totalCount }" max="${ params.max }"/>
</body>


<content tag="headermain">
    <h1>Elèves</h1>
    <g:form class="aui">
        <g:textField name="prenom" class="text medium-field" value="${ command.prenom }" placeholder="Prénom"/>
        <g:textField name="nom" class="text medium-field" value="${ command.nom }" placeholder="Nom"/>
        <g:textField name="email" class="text medium-field" value="${ command.email }" placeholder="Email"/>
        <button class="aui-button"><span class="aui-icon aui-icon-small aui-iconfont-search"></span></button>
    </g:form>
</content>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
