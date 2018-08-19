<h3>Attestation</h3>

<p class="text-justify">
J’atteste être en possession d'un certificat médical de non contre indication à la pratique du Surf et
de n'avoir aucun antécédents médicaux susceptibles de créer une incapacité de pratique.<br/>
Je reconnais avoir pris connaissance des conditions d'assurance et notamment de la possibilité de
souscrire une assurance complémentaire de personne.
</p>

<br/>

<div class="field-group">
    <label for="lieuSignature"><span class="aui-icon icon-required"></span> Fait à</label>
    <g:textField name="lieuSignature" value="${ inscription.lieuSignature }" class="text medium-field" required="true" maxlength="128"/>
</div>

<div class="field-group">
<label for="dateSignature"><span class="aui-icon icon-required"></span> Le</label>
<g:field name="dateSignature" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateCreated) }" required="true" readonly="true"/>
</div>

<div class="field-group">
<label for="signature"><span class="aui-icon icon-required"></span> Signature</label>
<span/>
</div>