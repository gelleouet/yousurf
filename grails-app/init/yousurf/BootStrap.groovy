package yousurf

class BootStrap {

    def init = { servletContext ->
        println new File(".").getAbsolutePath()
    }
    def destroy = {
    }
}
