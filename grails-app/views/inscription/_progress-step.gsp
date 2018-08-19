<g:set var="pourcentWidth" value="${ (100 / steps.size()) as Integer }%"/>

<div class="inscription-step-tracker">
    <ol class="aui-progress-tracker" style="width:100%;">
        <g:each var="step" in="${ steps }" status="status">
            <li class="aui-progress-tracker-step ${ inscription.currentStep == status+1 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
                <g:link action="create" params="[step: status+1]" id="${ inscription.id }">${ step }</g:link>
            </li>
        </g:each>
    </ol>
</div>