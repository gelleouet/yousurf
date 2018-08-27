package yousurf

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class MobileInterceptorSpec extends Specification implements InterceptorUnitTest<MobileInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test mobile interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"mobile")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
