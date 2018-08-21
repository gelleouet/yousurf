<div class="aui-group">
    <div class="aui-item aui-item-signature">
        <canvas id="canvas-signature" class="canvas-signature" width="350" height="125">
        </canvas>
    </div>
    <div class="aui-item">
        <button id="undo-signature-button" class="aui-button" title="Annuler"><span class="aui-icon aui-icon-small aui-iconfont-undo"></span></button>

        <br/>

        <g:if test="${ signatureData }">
            <g:hiddenField name="signatureData" value="${ new String(signatureData) }"/>
            <h6>Signature en cours</h6>
            <img src="${ new String(signatureData) }" class="img-signature"/>
        </g:if>
        <g:else>
            <g:hiddenField name="signatureData" value=""/>
        </g:else>

        <canvas id="canvas-empty-signature" class="canvas-signature" width="350" height="125" style="display:none;">
    </div>
</div>