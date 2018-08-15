<g:if test="${ inscription.id }">
    <g:hiddenField name="id" value="${ inscription.id }"/>
</g:if>

<div style="text-align:center;">
    <label for="dateDebut">Du</label>
    <g:field name="dateDebut" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateDebut) }" required="true"/>
    <label for="dateFin"> Au </label>
    <g:field name="dateFin" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateFin) }" required="true"/>
</div>

<h3>Coordonnées de l'élève</h3>

<g:if test="${ inscription.eleve?.id }">
    <g:hiddenField name="eleve.id" value="${ inscription.eleve.id }"/>
</g:if>

<div class="field-group">
    <label for="eleve.nom"><span class="aui-icon icon-required"></span> Nom</label>
    <g:field name="eleve.nom" value="${ inscription.eleve?.nom }" type="text" class="text full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.prenom"><span class="aui-icon icon-required"></span> Prénom</label>
    <g:field name="eleve.prenom" value="${ inscription.eleve?.prenom }" type="text" class="text full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.adresse"><span class="aui-icon icon-required"></span> Adresse</label>
    <g:textArea name="eleve.adresse" value="${ inscription.eleve?.adresse }" class="textarea full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.codePostal"><span class="aui-icon icon-required"></span> Code postal</label>
    <g:field name="eleve.codePostal" value="${ inscription.eleve?.codePostal }" type="number" class="text short-field" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.ville"><span class="aui-icon icon-required"></span> Ville</label>
    <g:field name="eleve.ville" value="${ inscription.eleve?.ville }" type="text" class="text full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.dateNaissance"><span class="aui-icon icon-required"></span> Date naissance</label>
    <g:field name="eleve.dateNaissance" value="${ app.formatDatePicker(date:inscription.eleve?.dateNaissance) }" type="date" class="text medium-field aui-date-picker"/>
</div>
<div class="field-group">
    <label for="eleve.telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
    <g:field name="eleve.telephone" value="${ inscription.eleve?.telephone }" type="tel" class="text" required="true"/>
</div>
<div class="field-group">
    <label for="eleve.email"><span class="aui-icon icon-required"></span> Email</label>
    <g:field name="eleve.email" value="${ inscription.eleve?.email }" type="email" class="text" required="true"/>
</div>
<div class="field-group">
    <label for="niveau.id"><span class="aui-icon icon-required"></span> Niveau</label>
    <g:select name="niveau.id" value="${ inscription.niveau?.id }" from="${ niveaux }" optionKey="id" optionValue="libelle" class="select" required="true"/>
</div>

<h3>Personne à prévenir en cas d'accident</h3>

<g:if test="${ inscription.contact?.id }">
    <g:hiddenField name="contact.id" value="${ inscription.contact.id }"/>
</g:if>

<div class="field-group">
    <label for="contact.nom"><span class="aui-icon icon-required"></span> Nom</label>
    <g:field name="contact.nom" value="${ inscription.contact?.nom }" type="text" class="text full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="contact.prenom"><span class="aui-icon icon-required"></span> Prénom</label>
    <g:field name="contact.prenom" value="${ inscription.contact?.prenom }" type="text" class="text full-width-field" required="true"/>
</div>
<div class="field-group">
    <label for="contact.telephone"><span class="aui-icon icon-required"></span> Téléphone</label>
    <g:field name="contact.telephone" value="${ inscription.contact?.telephone }" type="tel" class="text" required="true"/>
</div>
<div class="field-group">
    <label for="contact.portable"><span class="aui-icon icon-required"></span> Portable</label>
    <g:field name="contact.portable" value="${ inscription.contact?.portable }" type="tel" class="text" required="true"/>
</div>

<h3>Problèmes médicaux à signaler</h3>

<div class="field-group">
    <label for="problemeMedical">Ex : allergies, traitements, etc.</label>
    <g:textArea name="problemeMedical" value="${ inscription.problemeMedicaux ? inscription.problemeMedicaux[0].libelle : '' }" class="textarea full-width-field"/>
</div>

<h3>Prestation choisie</h3>

<h4>Formule</h4>

<table class="formule-table">
    <tbody>
        <tr>
            <g:each var="formule" in="${ formules }" status="status">
                <td>
                    <h4><g:radio name="formule.id" value="${ formule.id }" checked="${ formule.id == inscription.formule?.id || status == 0 }"/><br/>${ raw(formule.libelle.replace("/", "<br/>")) }</h4>
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
                        <br/><label for="creneauxList${ creneau.id }">${ creneau.libelle }</label>
                    </h4>
                </td>
            </g:each>
        </tr>
    </tbody>
</table>

<div class="description">Vous pouvez sélectionner plusieurs créneaux en fonction de vos disponibilités.</div>

<h3>Capacité à nager</h3>

<fieldset class="group">
    <legend>Nager au moins 25m et mettre la tête sous l'eau</legend>
    <div class="checkbox">
        <g:checkBox name="brevet25m" value="${ inscription.brevet25m }" class="checkbox"/>
        <label for="brevet25m">Oui</label>
    </div>
</fieldset>

<h3>Autorisation parentale</h3>
<h6>(Pour les mineurs uniquement)</h6>


<table style="width:100%;">
    <tbody>
        <tr>
            <td>Je soussigné Mr, Mme</td>
            <td><g:textField name="autorisationParentale" value="${ inscription.autorisationParentale }" class="text long-field"/></td>
        </tr>
        <tr>
            <td>autorise mon enfant</td>
            <td><g:textField name="autorisationParentaleEnfant" value="${ inscription.autorisationParentale && inscription.eleve ? inscription.eleve.prenom + ' ' + inscription.eleve.nom : '' }" class="text long-field" readonly="true"/></td>
        </tr>
    </tbody>
</table>
<br/>
<p class="text-justify">A suivre les cours d’enseignement SURF-Stand Up Paddle organisés par YouSurf. <br/>Les parents ou
    tuteurs légaux des enfants inscrits dans la structure déclarent que ces derniers ne présentent aucune
    contre indication à la pratique du Surf et de ses dérivés et n'ont pas d'antécédents médicaux
    susceptibles de créer une incapacité de pratique ; Et d'avoir pris connaissance des conditions et
        règlement ci-jointes et de les accepter.
</p>

<h3>Attestation</h3>

<p class="text-justify">
    J’atteste être en possession d'un certificat médical de non contre indication à la pratique du Surf et
    de n'avoir aucun antécédents médicaux susceptibles de créer une incapacité de pratique.<br/>
    Je reconnais avoir pris connaissance des conditions d'assurance et notamment de la possibilité de
    souscrire une assurance complémentaire de personne.
</p>

<div style="margin-top:15px;">
    <label>Fait à </label> <g:textField name="lieuSignature" value="${ inscription.lieuSignature }" class="text medium-field"/>
    <label>, le </label> <g:field name="dateSignature" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateSignature) }"/>
</div>



