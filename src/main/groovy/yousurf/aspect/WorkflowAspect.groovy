package yousurf.aspect

import org.apache.commons.lang.StringUtils
import org.aspectj.lang.JoinPoint
import org.aspectj.lang.ProceedingJoinPoint
import org.aspectj.lang.annotation.AfterReturning
import org.aspectj.lang.annotation.Aspect
import org.aspectj.lang.annotation.Pointcut
import org.aspectj.lang.reflect.MethodSignature
import org.springframework.stereotype.Component
import yousurf.Constantes
import yousurf.TransactionUtils
import yousurf.aspect.annotation.Workflowable


@Aspect
@Component
class WorkflowAspect {

    @Pointcut("@annotation(workflowable)")
    void workflowablePoincut(Workflowable workflowable) {}


    @Pointcut("workflowablePoincut(workflowable) && yousurf.aspect.AppAspect.servicePoincut()")
    void workflowableServicePoincut(Workflowable workflowable) {}


    @AfterReturning(value = "workflowableServicePoincut(workflowable)", returning = "result")
    void afterWorkflowableService(JoinPoint jp, Workflowable workflowable, Object result) {
        String workflowName = workflowable.value()
        ProceedingJoinPoint joinPoint = (ProceedingJoinPoint) jp
        MethodSignature signature = (MethodSignature) joinPoint.signature

        if (!workflowName) {
            workflowName = StringUtils.uncapitalize(joinPoint.target.class.simpleName) + '.' + joinPoint.signature.name
        }

        Map message = [result: result, workflowName: workflowName]

        if (workflowable.includeArgs()) {
            message.args = joinPoint.args
        }

        TransactionUtils.executeAfterCommit {
            joinPoint.target.sendAsyncMessage(Constantes.DIRECT_EXCHANGE, Constantes.WORKFLOW_QUEUE, message)
        }
    }
}
