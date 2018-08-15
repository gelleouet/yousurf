<g:set var="pourcentWidth" value="${ (100 / maxStep) as Integer }%"/>

<div class="inscription-step-tracker">
    <ol class="aui-progress-tracker" style="width:100%;">
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 1 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 1]">Dates</g:link>
        </li>
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 2 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 2]">Coordonnées</g:link>
        </li>
        <li class="aui-progress-tracker-step  ${ inscription.currentStep == 3 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 3]">Contact</g:link>
        </li>
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 4 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 4]">Médical</g:link>
        </li>
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 5 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 5]">Prestation</g:link>
        </li>
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 6 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 6]">Autorisation</g:link>
        </li>
        <li class="aui-progress-tracker-step ${ inscription.currentStep == 7 ? 'aui-progress-tracker-step-current' : '' }" style="width:${ pourcentWidth }">
            <g:link action="create" params="[step: 7]">Attestation</g:link>
        </li>
    </ol>
</div>