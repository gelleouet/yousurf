<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
    <g:applyLayout name="toolbar">
        <content tag="toolbarprimary">
            <h3>Workflows</h3>
        </content>

        <content tag="toolbarsecondary">
            <g:link class="aui-button" action="view">Ajouter</g:link>
        </content>
    </g:applyLayout>


    <g:form class="aui" name="workflow-form">
        <g:textField name="libelle" class="text" value="${ command.libelle }" placeholder="Libellé"/>
        <button class="aui-button"><span class="aui-icon aui-icon-small aui-iconfont-search"></span></button>
    </g:form>

    <br/>

    <app:table paginateForm="workflow-form" totalCount="${ totalCount }">
        <thead>
        <th>Libellé</th>
        <th>Déploiement</th>
        <th class="actions-column-size-2">Actions</th>
        </thead>
        <tbody>
        <g:each var="deploiement" in="${ deploiementList }">
            <tr>
                <td><g:link action="view" id="${ deploiement.id }">${ deploiement.name }</g:link></td>
                <td><app:formatTimeAgo date="${ deploiement.deploymentTime }"/></td>
                <td class="actions-column actions-column-size-2">
                    <div class="aui-buttons">
                        <g:link class="aui-button aui-button-subtle confirm-button" title="Supprimer" action="delete" id="${ deploiement.id }">
                            <span class="aui-icon aui-icon-small aui-iconfont-trash"></span>
                        </g:link>

                        <button id="diagram-button" class="aui-button aui-button-subtle" title="Diagramme" data-dialog-url="${ g.createLink(action: 'dialogDiagram', id: deploiement.id) }">
                            <span class="aui-icon aui-icon-small aui-iconfont-workflow"></span>
                        </button>
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </app:table>
</body>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
