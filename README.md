# DevUtils

Any files that can come in handy while writing the project

===

To run client-server connection from virtual machines on multiple computers you need to forward port 6666(or other available port) in VirtualBox using for example 
this tutorial:
  https://www.howtogeek.com/122641/how-to-forward-ports-to-a-virtual-machine-and-use-it-as-a-server/
  
And then use outside system ip adress from machine that is running game server to establish connection.

===

demoScript - the bash executable script that will clone the repository specified in the file, copy any hooks that reside in the dev_utils directory and has an option to run the checkQuality script

To run the quality script pass the `-q` flag when running this script.
Maven 3.5.0 and Sonar required to succesfully pass quality check.

Start sonar with command `sh sonar.sh start &` <- this way it will run even after you close the terminal window
