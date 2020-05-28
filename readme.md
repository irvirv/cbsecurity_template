This is a template using cbsecurity with the default cbauth module used for auth

The example users to log in with are  -  

 - joe_student (has view permission)

 - sally_prof (has view, update and create permissions)
 
 - billy_tech (has admin permission)
 
 - jane_admin (has all permissions  - view, create, update, and admin). 
 
 All users have password of "test".


To run app follow these steps - 

Create a test folder.

In folder created using commandBox run - coldbox create app skeleton=https://github.com/irvirv/cbsecurity_template/archive/master.zip --installColdBox   

change directory in commandbox to subfolder created by above  - cd securecbauth

in commandbox run  - server start

first time running give it a few seconds to spin up

to see the cbsecurity visualizer in your browser run {your app}/cbsecurity 




