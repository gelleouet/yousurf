<h3>Dates</h3>

<div class="field-group">
    <label for="dateDebut"><span class="aui-icon icon-required"></span> Du</label>
    <g:field name="dateDebut" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateDebut) }" required="true"/>
</div>
<div class="field-group">
    <label for="dateFin"><span class="aui-icon icon-required"></span> Au </label>
    <g:field name="dateFin" type="date" class="text medium-field aui-date-picker" value="${ app.formatDatePicker(date: inscription.dateFin) }" required="true"/>
</div>