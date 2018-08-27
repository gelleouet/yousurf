import yousurf.UserPasswordEncoderListener


// Place your Spring DSL code here
beans = {
    xmlns context:"http://www.springframework.org/schema/context"

    context.'component-scan'('base-package': "yousurf.aspect")

    userPasswordEncoderListener(UserPasswordEncoderListener)

}
