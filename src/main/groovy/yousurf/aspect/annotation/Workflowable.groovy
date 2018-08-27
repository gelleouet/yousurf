package yousurf.aspect.annotation

import java.lang.annotation.Documented
import java.lang.annotation.ElementType
import java.lang.annotation.Retention
import java.lang.annotation.RetentionPolicy
import java.lang.annotation.Target


/**
 * Applique sur une méthode au niveau service pour déclencher l'exécution d'un workflow
 * Le workflow sera démarré une fois la transaction commitée avec succès
 *
 * Si le nom du workflow n'est pas renseigné, la valeur par défaut sera "serviceName.methodName"
 *
 */
@Target([ElementType.METHOD])
@Retention(RetentionPolicy.RUNTIME)
@Documented
@interface Workflowable {

    /**
     * Le nom du workflow à exécuter.
     * Si pas renseigné, il est calculé en fonction du service exécuté
     *
     * @return
     */
    String value() default ""


    /**
     * Force l'utilisation des paramètres de la méthode
     * Utile quand l'objet retour n'est pas suffisant
     *
     * @return
     */
    boolean includeArgs() default false
}