This is a template using cbsecurity with the default cbauth module used for auth

The example users to log in with are  -  

 - joe_student (has view permission)

 - sally_prof (has view, update and create permissions)
 
 - billy_tech (has admin permission)
 
 - jane_admin (has all permissions  - view, create, update, and admin). 
 
 All users have password of "test".


To run app follow these steps - 

Create a test folder.

Unzip this project in folder

Using commandbox in cmd prompt in folder you unzipped project run "install"  (no additional params required since you have a box.json file)

Once installed run  - "server start"

First time running give it a few seconds to spin up

To see the cbsecurity visualizer in your browser browse to {your app}/cbsecurity subfolder or click "cbsecurity" under Installed Modules from homepage


In this app there is a folder called "alternates" that has a different version of the userservice.  This behaves exactly the same as the hard-wired version 
but gets the user info from a database (MS SQL Server).  There is a script in the "database" folder that will create this database along with the test users 
as exist in the hard-wired version.  You'll need to figure out your own connection string but it's not hard and there is an example in the userdata.cfc 
that is downloaded as part of this.  Using the database version makes it a lot easier to play around with different users/roles/permissions. 




