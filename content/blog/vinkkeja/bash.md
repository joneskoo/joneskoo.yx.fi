---
date: 2010-05-12T00:00:00Z
title: Hyödyllisiä vinkkejä, osa bash
slug: bash
tags:
 - vinkkejä
 - shell
aliases:
 - /blog/2010/05/12/bash.html
---

Jatkan tällä vinkkisarjaa, tällä kertaa vuorossa bash. Samoja ideoita voi koittaa soveltaa muihinkin shelleihin.

<!--more-->

Ehkä tärkeimpiä shellin asetuksia on EDITOR-muuttuja:

    export EDITOR='mate -w'

EDITOR-asetusta käyttävät muun muassa subversion ja git odottaessaan commit-viestiä tms.

<pre>
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend cdspell cmdhist histverify hostcomplete
bind Space:magic-space
</pre>

Asetus **erasedups** kertoo bashille, että komentohistoriasta tulee säilyttää kutakin käskyä vain yksi kopio tallennetussa komentohistoriatiedostossa. Ainakaan itse en tule kaipaamaan tietoa montako kertaa ajoin ls joskus kauan sitten.

**HISTSIZE** kasvattaa historian koon oletuksesta 500 riviä 10 000 riviin. Levytila on halpaa ja jopa 10 000 rivillä tiedosto on tuskin juuri suurempi kuin 500 kt.

* **histappend** ohjaa bashin LISÄÄMÄÄN käskyt historiaan sen sijaan että historiatiedosto ylikirjoitettaisiin.
* **cdspell** korjaa pienet kirjoitusvirheet hakemistojen nimissä cd-käskyä käytettäessä (ei kuitenkaan skripteissä, ei huolta).
* **cmdhist** pyrkii säilyttämään moniriviset käskyt yhdessä historiarivissä, jotta monirivistäkin käskyä voi editoida helposti.
* **histverify** estää käskyn suorituksen historiasta haettaessa heti (esim. !wget) ja lataa rivin vain komentoriville vahvistettavaksi.
* **hostcomplete** yrittää täydentää DNS-nimiä @-merkin jälkeen tabulaattoritäydennyksenä.
* **magic-space** avaa huutomerkillä haetut (!wget) käskyt välilyöntiä painamalla.

GNU readlinen käyttämään .inputrc-tiedostoon kannattaa lisätä seuraavat rivit:

<pre>
"\e[B": history-search-forward
"\e[A": history-search-backward
</pre>

Niiden avulla voi hakea komentohistoriasta kirjoittamalla käskyn alun ja
painamalla nuolta ylöspäin tai alaspäin. Haku käyttää kirjoitettua alkua
etuliitteenä.

Nämä [Textmate-editorin blogikirjoituksen kommenteista][tmblog] apinoidut rivit tuovat käyttöön ylöspäin ja alaspäin nuolinäppäimille historiahaun. Näiden kanssa on mahdollista hakea komentohistoriasta kirjoittamalla käskyn alku ja käyttämällä ylös ja alas nuolinäppäimiä. Erittäin kätevä! Suosittelen erittäin lämpimästi.

Historian järkevät hakutoiminnot hyötyvät suunnattomasti, jos historiaa tallennetaan oletusta pidemmästi ja säilytetään paremmin (lisääminen ylikirjoituksen sijaan, duplikaattirivien poistaminen).

Kaikki esimerkkirivit voi kopioida shellin suorittamiin käynnistystiedostoihin. OS X:ssä olen käyttänyt tiedostoa *.profile*, Linuxeissa olen käyttänyt *.bashrc*\-tiedostoa. Kommentoikaa viisaammat, mikä on oikea paikka asetuksille ja millä perusteella? En jaksanut tutkia kun nämäkin toimivat :)


[tmblog]: http://blog.macromates.com/2008/working-with-history-in-bash/ "Allan Odgaard / Macromates - Working With History in Bash"
