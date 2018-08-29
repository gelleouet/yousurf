<section role="dialog" id="modal-dialog" class="aui-layer aui-dialog2 ${ dialogSize ?: 'aui-dialog2-medium' }"
         aria-hidden="true" data-aui-modal="true" data-aui-remove-on-hide="true">

    <header class="aui-dialog2-header">
        <h2 class="aui-dialog2-header-main">
            <g:pageProperty name="page.dialogtitle"/>
        </h2>

        <div class="aui-dialog2-header-secondary">
            <fieldset>
                <div class="buttons">
                </div>
            </fieldset>
        </div>
    </header>

    <div class="aui-dialog2-content">
        <g:pageProperty name="page.dialogcontent"/>
    </div>

    <footer class="aui-dialog2-footer">
        <div class="aui-dialog2-footer-actions">
            <div class="buttons">
                <button id="dialog-ok-button" class="aui-button aui-button-primary">OK</button>
                <a id="dialog-cancel-button" class="aui-button aui-button-link cancel">Annuler</a>
            </div>
        </div>
    </footer>

</section>