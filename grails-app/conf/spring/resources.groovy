// Place your Spring DSL code here
beans = {
    myBean(com.intelligrhape.linksharing.CustomBean){bean->
       bean.scope="prototype"
    firstName="amit"
    }
    myBeanConstr(com.intelligrape.linksharing.CustomBean,'abhishek')
}