package com.intelligrape.linksharing

class ForgotpasswordController {

   def changePassword(String passwrd,String CnfrmPsswrd ){

       if(sesion.user)
       {
           User user=User.get(session.user.id)
           if(passwrd==CnfrmPsswrd){
               user.confirmPassword=CnfrmPsswrd
               user.password=passwrd
               if(user.validate()) {
                   user.save(flush: true)
                   flash.messages="Password Save sucessfully"
                   render "sucess"
                  // redirect(controller:'user',action: 'profile' )
               }else{
                   flash.errors="Password not save Please try again"
                  // redirect(controller:'user',action: 'profile' )
                   render "fail"
               }
           }
       }

   }
}
