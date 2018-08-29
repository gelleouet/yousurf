<g:applyLayout name="dialog">

    <content tag="dialogtitle">
        <span>Diagramme BPMN</span>
    </content>

    <content tag="dialogcontent">
        <div style="overflow:auto;">
            <img src="${ g.createLink(action: 'imgDiagram', id: deploymentId) }" width="550px"/>
        </div>
    </content>

</g:applyLayout>