---
date: 2010-05-12T00:00:00Z
title: Hyödyllisiä vinkkejä, osa ssh
slug: ssh
tags:
 - vinkkejä
 - skriptit
 - shell
aliases:
 - /blog/2010/05/12/ssh.html
---

Haluaisin kertoa muutamista liian vähän tunnetuista näppäristä asetuksista eri ohjelmissa. Kerron niistä lyhyesti ja annan kullekin copypastetettavat rivit, joilla pääsee eteenpäin. Aloitan sarjan kertomalla hieman OpenSSH:n asetustiedostosta ja siinä käyttämistäni asetuksista.

<!--more-->

### SSH ja *~/.ssh/config* ###

Erittäin näppärä ominaisuus ssh:ssa on *.ssh/config*-tiedosto, johon voi laittaa kaikenlaisia näppäriä asetuksia. Tiedoston formaatti on kuvattu man-sivulla (*man ssh_config*). Tiedosto sijaitsee kotihakemiston alla piilotetussa *.ssh*-hakemistossa. Jos tiedosto puuttuu, luo se.

<pre>
Host st
    Hostname st-cn0001.oulu.fi
    HostKeyAlias st-cn0001.oulu.fi
</pre>

Tämä pätkä *.ssh/config*-tiedostossa määrittelisi uuden nimen st, johon voi yhdistää käskyllä *ssh st*. Koneen oikea nimi on st-cn0001.oulu.fi, joka on aivan järjetön kirjoittaa joka kerta uudestaan. Määrittelemällä alias näin yhdistämisestä tulee taas helppoa. HostKeyAlias-rivi tarkoittaa sitä nimeä, jota ssh käyttää osoitteen ssh-sormenjäljen muistamiseen. Jos vaikka samalla IP-osoitteella olisi monta eri ssh-palvelinta eri porteissa, ssh valittaisi normaalisti sormenjäljen muuttumisesta. Asetuksella ongelma voitaisiin kiertää vaikkapa näin:

<pre>
Host kone1
    Hostname koti.dyndns.org
    Port 2222
    HostKeyAlias kone1.koti
Host kone2
    Hostname koti.dyndns.org
    Port 2223
    HostKeyAlias kone2.koti
</pre>

HostKeyAlias-nimen ei tarvitse olla todellinen DNS-nimi.

SSH:lle komentoriviltä annetut liput, kuten porttiohjaukset voi myös määritellä asetustiedostoon, jotta niitä ei tarvitse kirjoittaa käsin joka kerta uudestaan:

<pre>
Host hansu
    HostKeyAlias hansu
    HostName hansu.m5.yx.fi
    DynamicForward 8888
    LocalForward 8080 127.0.0.1:8080
    LocalForward 5901 adam:5900
</pre>

Näin saadaan samalla kertaa alias ja yleisesti käytetyt porttiohjaukset. DynamicForward lisää SOCKS-proxyn yhteyteen (sama kuin *ssh -D 8888*). SOCKS:ia voi käyttää esim. välittämään selaimen liikenne ssh-putken läpi. Suosittelen, jos on pääsy yliopiston koneelle ja sitä kautta yliopiston oikeuksilla esim. IEEE:n tai vastaaviin kirjastoihin.

<pre>
Host *.oulu.fi
    User kortesjo
</pre>
Edellisestä puolestaan saattaisi olla hyötyä, jos yliopisto on pakottanut käyttämään nimestä johdettua käyttäjätunnusta.

<pre>
Host *
    Compression yes
    TCPKeepAlive yes
    ServerAliveCountMax 3
    ServerAliveInterval 10
</pre>

Yllä oleva pätkä tarkoittaisi, että kaikkiin osoitteisiin yhdistäessä käytetään pakkausta ja keepalive-toiminnallisuutta, joka katkaisee yhteyden jos liikenne ei kulje 3·10&nbsp;=&nbsp;30 sekunnin aikana. Ensimmäinen on erittäin näppärä GPRS-yhteyksiä käytettäessä eikä omien kokemusteni perusteella ole koskaan haitaksi. Jälkimmäisestä on hyötyä, jos käyttää ssh-porttiohjauksia. Kun keepalive katkaisee ssh-yhteyden, ssh kuolee ja sen voi yhdistää uudestaan. Muuten portti voi jäädä varatuksi ja käyttökelvottomaksi kun ssh-yhteys ei ole vielä katkennut mutta yhteys ei myöskään toimi.

Ensimmäisenä tiedostossa löytynyt asetus jää voimaan, eli yleiset oletukset kannattaa laittaa loppuun, jotta tarkemmat osoitekohtaiset asetukset ohittavat ne.

Toivottavasti vinkeistä on iloa.
