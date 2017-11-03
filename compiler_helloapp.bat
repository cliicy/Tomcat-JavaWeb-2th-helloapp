@rem create cmd shortcut on the desktop named start_tomcat6 which starts from D:\Cliicy\Java\apache-tomcat-6.0.20\bin named 
@rem create cmd shortcut on the desktop named jar-war_helloapp which starts from D:\Cliicy\Java\war_helloapp
@rem create cmd shortcut on the desktop named compile-jar-helloapp which starts from D:\Cliicy\Java\helloapp

@set TOMCAT_DIR_PATH=D:\Cliicy\Java\apache-tomcat-6.0.20
@set TOMCAT_LIB_PATH=%TOMCAT_DIR_PATH%\lib
@set TOMCAT_WEBAPP_PATH=%TOMCAT_DIR_PATH%\webapps
@set HELLOAPP_DIR=D:\Cliicy\Java\helloapp
@set WAR_HELLOAPPDIR=D:\cliicy\java\war_helloapp
pushd %HELLOAPP_DIR%
@rem if there are some multi-code chars, please use javac -encoding UTF-8 xxxxx other than javac xxxxx
@rem javac -encoding UTF-8 -classpath %TOMCAT_LIB_PATH%\servlet-api.jar -sourcepath src -d WEB-INF\classes src\mypack\ContextTesterServlet.java
javac -classpath %TOMCAT_LIB_PATH%\servlet-api.jar -sourcepath src -d WEB-INF\classes src\mypack\DispatcherServlet.java
@rem only copy those will-be-used files and folders to zip to war file
robocopy . d:\cliicy\java\war_helloapp *.* /MIR /XD .git .metadata RemoteSystemsTempFiles /XF .gitignore
pushd %WAR_HELLOAPPDIR%
jar cvf %TOMCAT_WEBAPP_PATH%\helloapp.war *.*
pushd %TOMCAT_WEBAPP_PATH%
rename helloapp helloapp.bk
pushd %TOMCAT_DIR_PATH%\bin
startup.bat



