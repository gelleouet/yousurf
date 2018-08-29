package yousurf

import com.budjb.rabbitmq.publisher.RabbitMessagePublisher
import grails.async.Promises
import grails.converters.JSON
import grails.gorm.transactions.NotTransactional
import grails.gorm.transactions.Transactional
import org.springframework.transaction.annotation.Propagation


@Transactional(readOnly = true)
abstract class AbstractService<T> {

    /**
     * Enregistrement domain avec validation
     *
     * @param domain
     * @return
     * @throws AppException
     */
    @Transactional(readOnly = false, rollbackFor = [AppException])
    T save(T domain) throws AppException {
        if (!domain.save()) {
            throw new AppException("Erreur enregistrement", [errors: domain.errors])
        }

        return domain
    }

}