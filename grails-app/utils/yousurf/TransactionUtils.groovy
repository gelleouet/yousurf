package yousurf

import org.springframework.transaction.support.TransactionSynchronizationAdapter
import org.springframework.transaction.support.TransactionSynchronizationManager


/**
 * Utilitaires transaction
 *
 */
class TransactionUtils {

    /**
     * Exécution d'un code après commit de la transaction si elle existe
     * Sinon exécuté immédiatement
     *
     * @param closure
     */
    static void executeAfterCommit(Closure closure) {
        if (TransactionSynchronizationManager.isSynchronizationActive()) {
            // Ajout d'un listener fin de transaction commitée réussie
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
                @Override
                public void afterCommit() {
                    closure()
                }
            })
        } else {
            closure()
        }
    }


    /**
     * Détache un objet s'il est domain de la session
     *
     * @param object
     */
    static void detachObject(Object object) {
        if (object && object.respondsTo("isAttached")) {
            if (object.isAttached()) {
                object.discard()
            }
        }
    }
}
