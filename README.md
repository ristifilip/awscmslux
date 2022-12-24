# Readme - Erklärung der Inbetriebnahme von Wordpress

## Anforderungen

- Das Skript wird auf einer Linux-Konsole(Ubuntu) ausgeführt.

- Es besteht eine aktive und gültige Verbindung zu den AWS-Diensten. ([Anleitung](https://gbssg.gitlab.io/m346/lab-awscli/)) 

- Das Git-Repository ist **direkt** im **Home-Ordner**(~) geklont. ( Führen Sie dazu folgenden Befehl aus)

  ```shell
  cd ~
  ```

  

## Installation des AWS-Servers

1. Führen Sie folgenden Befehl in der Shell aus:

   ```shell
   . ~/awscmslux/shell-skript/aws.sh
   ```

   ​	Nun wird eine Ubuntu-Server Instanz erstellt. Zusätzlich wird auch eine Security-Group erstellt. Mit solch einer Gruppe lassen sich Ports blockieren, 	beziehungsweise filtern. Dieser Vorgang dauert mehrere Minuten.

2. Ihre IP können Sie in der [Instanzen-Übersicht ](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Instances:) überprüfen. Der Namen der Instanz ist **Webserver**. Notieren Sie sich die IP-Adresse , da Sie diese für den Zugriff auf Ihren Webserver brauchen.

   ![](https://i.ibb.co/yPWVscC/2022-12-23-16-32-34-Instances-EC2-Management-Console-und-7-weitere-Seiten-Gesch-ftlich-Microso.png)

3. Sie können sich nun mit der **IP-Adresse** per **Browser** mit dem **Webserver** verbinden. Der Link ist: http://< IP >

   Nun sollen Sie auf der Seite von Wordpress landen.

4. Hier verbinden Sie nun den Dienst mit Ihrer Datenbank, welche auf dem gleichen Server läuft. Geben Sie hier nun folgende Informationen ein:

   

   | Schlüssel    | Wert                                                         |
   | ------------ | ------------------------------------------------------------ |
   | Datenbank    | Wordpress                                                    |
   | Benutzername | root                                                         |
   | Passwort     | Auf Ihrem Webserver in der Datei<br /<br />  */home/mysql_access.txt*. |
   |              |                                                              |

   







