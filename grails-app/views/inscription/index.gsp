<!doctype html>
<html>
<head>
    <meta name="layout" content="main-navigation"/>
</head>
<body>
    <h1>Inscriptions</h1>
    <g:form class="aui">
        <g:field name="dateDebut" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: command.dateDebut) }" required="true"/>
        <g:field name="dateFin" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: command.dateFin) }"/>
        <g:textField name="prenomEleve" class="text medium-field" value="${ command.prenomEleve }" placeholder="Prénom élève"/>
        <g:textField name="nomEleve" class="text medium-field" value="${ command.nomEleve }" placeholder="Nom élève"/>
        <g:textField name="emailEleve" class="text medium-field" value="${ command.emailEleve }" placeholder="Email élève"/>
        <g:checkBox name="confirm" value="${ command.confirm }" class="checkbox"/><label for="confirm">Confirmé</label>
        <button class="aui-button"><span class="aui-icon aui-icon-small aui-iconfont-search"></span></button>
    </g:form>

    <br/>

    <table class="aui">
        <thead>
            <th>Création</th>
            <th>Elève</th>
            <th>Formule</th>
            <th>Niveau</th>
            <th class="actions-column-size-2">Actions</th>
        </thead>
        <tbody>
            <g:each var="inscription" in="${ inscriptions }">
                <tr>
                    <td><g:link action="create" id="${ inscription.id }" title="Inscription"><g:formatDate date="${ inscription.dateCreated }" type="datetime"/></g:link></td>
                    <td>${ inscription.eleve?.prenom } ${ inscription.eleve?.nom }</td>
                    <td>
                        <g:if test="${ inscription.formule }">
                            ${ inscription.formule.libelle } du <g:formatDate date="${ inscription.dateDebut }" type="date"/>
                            au <g:formatDate date="${ inscription.dateFin }" type="date"/>
                        </g:if>
                    </td>
                    <td>${ inscription.niveau?.libelle }</td>
                    <td class="actions-column actions-column-size-2">
                        <div class="aui-buttons">
                            <g:link class="aui-button aui-button-subtle confirm-button" title="Supprimer"><span class="aui-icon aui-icon-small aui-iconfont-trash"></span></g:link>
                            <g:link action="print" id="${ inscription.id }" class="aui-button aui-button-subtle" title="Imprimer"><span class="aui-icon aui-icon-small aui-iconfont-export"></span></g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${ inscriptions.totalCount }" max="${ params.max }"/>
    </div>
</body>


<content tag="navbar">
    <g:render template="/templates/navigationParametres"/>
</content>

</html>
