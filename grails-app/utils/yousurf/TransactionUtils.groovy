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
        // Exécution immédiate si pas de transaction (ou en lecture seule)
        if (!TransactionSynchronizationManager.isSynchronizationActive()) {
            closure()
        } else {
            // Ajout d'un listener fin de transaction commitée réussie
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() {
                @Override
                public void afterCommit() {
                    closure()
                }
            })
        }
    }
}
