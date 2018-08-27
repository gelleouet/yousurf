package yousurf


class MobileInterceptor {


    MobileInterceptor() {
        matchAll()
    }


    boolean before() {
        true
    }


    boolean after() {
        String agentHeader = request.getHeader('User-Agent')?.toLowerCase()

        if (agentHeader) {
            // https://webmasters.googleblog.com/2011/03/mo-better-to-also-detect-mobile-user.html
            if (model != null) {
                model.mobileAgent = agentHeader.contains('mobile')
            }
        }

        return true
    }


    void afterView() {
        // no-op
    }
}
