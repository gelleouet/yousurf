<div class="field-group">
    <label for="libelle"><span class="aui-icon icon-required"></span> Libellé</label>
    <g:field name="libelle" value="${ command?.libelle }" type="text" class="text long-field" required="true"/>
</div>

<div class="field-group">
    <label for="dataFile">
        Diagramme BPMN 2.0
        <span class="aui-icon icon-required">*</span>
    </label>
    <label class="ffi" data-ffi-button-text="Parcourir">
        <input type="file" id="dataFile" name="dataFile"/>
    </label>
</div>
