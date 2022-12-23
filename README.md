# Readme - Erklärung der Inbetriebnahme von Wordpress

## Anforderungen

- Das Skript wird auf einer Linux-Konsole(Ubuntu) ausgeführt.
- Das Git-Repository ist **direkt** im **Home-Ordner**(~) geklont.
- Es besteht eine aktive und gültige Verbindung zu AWS 





## Installation des AWS-Servers

1. Führen Sie folgenden Befehl in der Shell aus:

   ```shell
   . ~/awscmslux/shell-skript/aws.sh
   ```

   ​	Nun wird eine Ubuntu-Server Instanz erstellt. Zusätzlich wird auch eine Security-Group erstellt. Mit solch einer Gruppe lassen sich Ports blockieren, 	beziehungsweise filtern. Dieser Vorgang dauert mehrere Minuten.

2. Ihre IP können Sie in der [Instanzen-Übersicht ](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Instances:) überprüfen. Der Namen der Instanz ist **Webserver**. 

   ![2022-12-23 16_32_34-Instances _ EC2 Management Console und 7 weitere Seiten - Geschäftlich – Microso](C:\LokaleDaten\2022-12-23 16_32_34-Instances _ EC2 Management Console und 7 weitere Seiten - Geschäftlich – Microso.png)





