<h3>Prestation choisie</h3>

<div style="text-align:center;">
    <label for="dateDebut">Du</label>
    <g:field name="dateDebut" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateDebut) }" required="true"/>
    <label for="dateFin"> Au </label>
    <g:field name="dateFin" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateFin) }" required="true"/>
</div>

<h4>Formule</h4>

<table class="formule-table">
<tbody>
<tr>
    <g:each var="formule" in="${ formules }" status="status">
        <td>
            <h4><g:radio name="formule.id" value="${ formule.id }" id="formuleId${ formule.id }" checked="${ formule.id == inscription.formule?.id || status == 0 }"/>
            <br/>
            <label for="formuleId${ formule.id }" style="color:#172b4d">${ raw(formule.libelle.replace("/", "<br/>")) }</label></h4>

        </td>
    </g:each>
</tr>
<tr>
    <g:each var="formule" in="${ formules }">
        <td>
            <h5>${ raw(formule.commentaire.replace("/", "<br/>")) }</h5>
        </td>
    </g:each>
</tr>
<tr>
    <g:each var="formule" in="${ formules }" status="status">
        <td>
            <h4>${ formule.prix as Integer }€</h4>
        </td>
    </g:each>
</tr>
<tr>
    <g:each var="formule" in="${ formules }">
        <td>
            <g:if test="${ formule.arrhe }">
                <h6>Arrhes ${ formule.arrhe as Integer }€</h6>
            </g:if>
            <g:else>
                -
            </g:else>
        </td>
    </g:each>
</tr>
</tbody>
</table>

<div class="description">Prise en charge collective de 2h, séance d'encadrement d'1h30, équipement fourni en Surf et/ou Stand Up Paddle Balade.</div>

<h4>Créneau(x) souhaité(s)</h4>

<g:set var="creneauxIds" value="${ inscription.creneaux*.creneau.id }"/>

<table class="creneau-table">
<tbody>
<tr>
    <g:each var="creneau" in="${ creneaux }">
        <td>
            <h4><g:checkBox name="creneauxList" id="creneauxList${ creneau.id }" value="${ creneau.id }" checked="${ creneau.id in creneauxIds }"/>
                <br/><label for="creneauxList${ creneau.id }" style="color:#172b4d">${ creneau.libelle }</label>
            </h4>
        </td>
    </g:each>
</tr>
</tbody>
</table>

<div class="description">Vous pouvez sélectionner plusieurs créneaux en fonction de vos disponibilités.</div>

<h3>Niveau</h3>

<fieldset class="group">
<legend>Nager au moins 25m et mettre la tête sous l'eau</legend>
<div class="checkbox">
    <g:checkBox name="brevet25m" value="${ inscription.brevet25m }" class="checkbox"/>
    <label for="brevet25m">Oui</label>
</div>
</fieldset>

<div class="field-group">
<label for="niveau.id"><span class="aui-icon icon-required"></span> Niveau Surf/Paddle</label>
<g:select name="niveau.id" value="${ inscription.niveau?.id }" from="${ niveaux }" optionKey="id" optionValue="libelle" class="select" required="true"/>
</div>