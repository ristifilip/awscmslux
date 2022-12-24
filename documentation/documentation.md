# Dokumentation - Installation des CMS Wordpress auf AWS



## Projektbeschreibung

Dieses Projekt beschreibt, wie man Wordpress mit Skripts auf einer AWS EC2-Instanz erstellt.  

Die Installation mit allen dazugehörigen Dateien befinden sich auf Github unter *ristifilip/awscmslux*. Das Projekt wird auf einem Ubuntu-Betriebssystem ausgeführt und ist auf anderen Betriebssystemen vollständig funktionstüchtig. Das Git-Repository soll direkt im Home-Pfad(~) geklont werden.

Die Anleitung in der **Readme.md** Datei beschreibt schrittweise das Vorgehen für die Installation.
Beim Ausführen des Skriptes werden mit der AWS-CLI verschiedene Befehle ausgeführt.

## Beschreibung Shell Datei  shell-skript/aws.sh

1. Zuerst wird ein Schlüsselpaar erstellt. Dieses trägt den Namen WP-Projekt und wird unter dem Pfad *~/.ssh/wp-projekt.pem* gespeichert.

2. Es werden Security-Groups erstellt. Solche Gruppen beschreiben, welche eingehenden und ausgehenden Ports erlaubt sind. 

3. Der **Port** **80**(HTTP) für den Webzugriff wird von allen eingehenden IP's erlaubt. 

4. Der **Port 22**(SSH) für den Webzugriff wird von allen eingehenden IP's erlaubt. 

5. Es wird eine EC2-Instanz erstellt. Diese basiert auf einem Abbild, welche in der AWS-Cloud mit ID's angegeben werden. Diese EC2-Instanz wird der Sicherheitsgruppe zugewiesen, welche in den letzten Schritten erstellt und konfiguriert wurde. 

6. Im gleichen Befehl wird eine Cloud-Init Datei vogerufen, welche die Initialkonfiguration für den Webserver beschreibt. 

   Die Cloud-Init Datei befindet sich unter dem Pfad:*~/awscmslux/cloud-init/cloud-init.yml*. Der Autor der Cloud-Init Datei ist im Quellenverzeichnis(1) beschrieben. 

## Beschreibung Cloud Init-Datei cloud-init/cloud-init.yml

Die Cloud-Init Datei wird beim Erstellen des Servers geladen. In dieser wird definiert, welche Pakete heruntergeladen werden sollen. Unter anderem wären dies die Pakete:

- wget
- curl
- apache2
- alle nötigen PHP-Pakete
- mariadb

Es werden ebenfalls verschiedene Befehle ausgeführt. Wordpress wird heruntergeladen und konfiguriert. Dazugehörig wird auch eine Datenbank erstellt. Diese Datenbank hat den Namen **Wordpress**.

## Testfälle der Dokumentation

### Apache2 - Service

![apache2_service](https://i.ibb.co/d4SCmC8/apache2-service.png)

Mit der Cloud-Init Datei wird de Apache2-Dienst installiert. Das obige Bild wurde direkt nach der Installation des Server erstellt. Das praktische Testen über den Browser wird in den folgenden Testbildern noch genauer gezeigt. Damit dieser Prozess jedoch funktioniert, muss dringend der Port 80 freigegeben werden, da sonst der Webzugriff per HTTP nicht möglich ist.
*Das Testen der Dienstes wurde von Elzan Ajdari durchgeführt.* 



### Web-Zugriff per IP-Adresse mit Wordpress als Landingpage

![Wordpress-Webzugriff](https://i.ibb.co/1RZBSst/Webzugriff-Direkte-Landingpage.png)

Sobald Wordpress konfiguriert wurde, wird eine Beispiels-Landingpage generiert. Zu diesem Zeitpunkt wurde die Initialkonfiguration von Wordpress bereits bearbeitet. Wordpress ist somit direkt mit der IP-Adresse erreichbar. In der URL muss man nicht die Applikation angeben, sondern kann direkt mit der IP zugreifen.
*Das Testen und Initialisieren der Funktionalität von Wordpress wurde von Filip Ristic durchgeführt.*



### Private Key 

![PrivateKey](https://i.ibb.co/85NfyGk/Private-Key.png)

Im Shell-Skript wird als erstes im Ordner *~.ssh* ein Private Key mit dem Namen **WP-Projekt** erstellt. Dass das Erstellen des Private erstellt wird, ist hier ersichtlich. Das Überprüfen des Vorhandenseins des Private Key's wurde eine halbe Stunde nach dem Ausführen des Skripts durchgeführt.
Falls dies nicht der Fall ist, muss dringend ein neuer Schlüssel generiert werden, da sonst der SSH-Zugriff nicht möglich ist.
*Das Überprüfen des Private Key's wurde von David Meglaj durchgeführt.*



### MySQL - Zugriff mit Root-Passwort aus Mysql_access.txt

![mysql-connection](https://i.ibb.co/6ZCMV0F/mysql-connection.png)

Das **Root-Passwort** wird mit dem **Cloud-Init Skript generiert** und in */home/mysql_access.txt* abgelegt. Hier wurde der Zugriff auf den MySQL-Server getestet, welches mit dem Cloud-Init Skript installiert wird.
Dies ist eine umständige, jedoch sehr sichere Methode, da das Passwort nicht in der Cloud-Init Datei vorkommt und nur von Benutzern mit Zugriff auf den Server gelesen werden kann.
*Das Testen der Verfügbarkeit des Datenbank-Servers wurde von Filip Ristic durchgeführt.*



## Reflexion

### Elzan

In dieser Projektarbeit übernahm ich die Dokumentation. Eines der Kriterien, das für mich wichtig war, war die Vollständig der Dokumentation und Github konnte mich mit Markdown sehr überzeugen. Mit Markdown konnte ich an Wissen gewinnen, da ich damit sonst noch nie gearbeitet habe. Die Plattform bietet viele Sicherheitsfunktionen und ich hatte keine Probleme damit, unsere Daten sicher zu halten. Mit Github hatte ich grosse Einstiegsschwierigkeiten. Leider habe ich jedoch auch sehr viel unnötige Zeit damit verbracht, mich in Markdown hineinzuarbeiten. 

### Filip

Mein Aufgabenbereich bestand darin, das Git zu verwalten und die verschiedenen Skripte zu schreiben. Ein Punkt welcher mich sehr überraschen hat, war die Einfach der AWS-Kommandozeile. Ich hatte keine direkten Probleme damit, Ressourcen bereitzustellen, zu verwalten und zu überwachen. Dagegen ist mir jedoch das Schreiben der Cloud-Init-Datei sehr schwierig gefallen. Die Fehlersuche war ebenfalls ein grosse Herausforderung für mich. Beispielsweise wusste ich nicht, warum jetzt Wordpress nicht installiert wird. Dies hat mir beispielsweise auch sehr viel Zeit gekostet. Ebenfalls habe im Anfang den Auftrag völlig falsch verstanden, was die Gruppe sehr viel verlorene Zeit gekostet hat, da die Dokumentation auf den praktischen Teil basiert. Jedoch konnte ich bei diesem Projekt sehr viel lernen, da ich sonst noch nie mit AWS gearbeitet habe, obwohl es wenig Themen gibt, welche so direkt IT-bezogen sind, wie dieses. Github konnte unsere Gruppe sehr von sich überzeugen. Die Versionsverwaltung fand ich sehr hilfreich aber auch nützlich. Unsere Gruppe konnte somit die Skripts jederzeit lokal bearbeiten und diese auch testen. Leider erlaubte mein Ego nicht, andere nach Hilfe zu fragen, weswegen wir leider auch unnötig Zeit verloren haben. Schlussendlich bekam ich selbst hin, jedoch ist somit auch Zeit verloren gegangen. Das nächste Mal lasse ich mein Ego lieber bei Seite und frage andere Mitglieder nach Hilfe, da wir ja alle da sind, um etwas zu lernen.

### David

Ich war während des Projekts mit der Implementierung von AWS beschäftigt und muss sagen, dass ich von den Möglichkeiten und der Benutzerfreundlichkeit der Plattform beeindruckt war. Eines der Kriterien, das für mich besonders wichtig war, war die Skalierbarkeit und Verfügbarkeit von Ressourcen. AWS hat diese Kriterien vollständig erfüllt und ich hatte keine Probleme damit, Ressourcen bereitzustellen oder zu skalieren, wenn sie benötigt wurden. Ein weiterer positiver Aspekt von AWS war die grosse Auswahl an Diensten und Tools, die zur Verfügung standen. Es gab immer eine Lösung für jedes Problem, das wir hatten, und die Dokumentation und das Support-Team waren auch sehr hilfreich.

## Autoren

**Filip Ristic** Zuständig für die Skripts 

**David Meglaj** Zuständig für die direkte AWS-Verwaltung, Befehle 

**Elzan Ajdari** Zuständig für die MD-Dokumentation

## Quellenverzeichnis

Contabo.com (2022), abgerufen am 23.12.2022
https://contabo.com/blog/setting-up-wordpress-with-cloud-init/

Gbssg.Gitlab.io(2022), abgerufen am 22.12.2022
https://gbssg.gitlab.io/m346/

Docs.aws.amazon.com(2022), abgerufen am 23.12.2022
https://docs.aws.amazon.com/

raw.githubusercontent.com/wp-cli/(2022), abgerufen am 23.12.2022
https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


