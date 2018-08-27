package yousurf.aspect

import org.aspectj.lang.annotation.Aspect
import org.aspectj.lang.annotation.Pointcut
import org.springframework.stereotype.Component


/**
 * Définition des pointcuts de base
 *
 */
@Aspect
@Component
class AppAspect {
    @Pointcut("execution(* yousurf..*Service.*(..))")
    void servicePoincut() {}
}
