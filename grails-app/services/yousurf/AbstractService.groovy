package yousurf

import grails.gorm.transactions.Transactional


@Transactional(readOnly = true)
abstract class AbstractService {

}