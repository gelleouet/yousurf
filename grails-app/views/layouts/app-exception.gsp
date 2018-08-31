<g:if test="${ request.appException }">
    <g:applyLayout name="message-error">
        ${ request.appException.message }
        <content tag="bodymessage">
            <g:if test="${ request.appException.params.errors }">
                <g:set var="fieldError" value="${ request.appException.params.errors.getFieldError() }"/>
                <g:message code="${ fieldError.code }" args="${ fieldError.arguments }"/>
            </g:if>
        </content>
    </g:applyLayout>
</g:if>
