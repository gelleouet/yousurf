<g:applyLayout name="dialog">

    <content tag="dialogtitle">
        <span>Workflow</span>
    </content>

    <content tag="dialogcontent">
        <g:form name="modal-dialog-form" class="aui">
            <div class="field-group">
                <label for="libelle"><span class="aui-icon icon-required"></span> Libellé</label>
                <g:field name="libelle" value="${ command.libelle }" type="text" class="text long-field" required="true"/>
            </div>
        </g:form>
    </content>

</g:applyLayout>