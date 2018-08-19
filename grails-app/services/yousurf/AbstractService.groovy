package yousurf

import grails.gorm.transactions.Transactional


@Transactional(readOnly = true, rollbackFor = [AppException])
abstract class AbstractService {

}