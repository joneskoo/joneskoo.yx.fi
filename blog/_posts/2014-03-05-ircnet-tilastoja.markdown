---
layout: post
title: Tilastoja IRCnet-verkon käyttäjistä
tags:
    - irc
    - Suomi
excerpt: |-
  Tein pikaisen katsauksen IRCnet-verkon hetkellisiin käyttäjämääriin ja
  erityisesti verkon suomalaisten käyttäjien osuuteen. Tutkimukseni
  perusteella näyttäisi että jopa 45&nbsp;% IRCnetin käyttäjistä voisi
  olla suomalaisia. Irkin tulevaisuus herättää kysymyksiä.
---

Joku viikko sitten katson mielenkiinnosta paljonko IRCnetissä on tällä hetkellä
käyttäjiä. Selkeästi IRC:n suosio on kärsinyt uudempien sosiaalisen median
palveluiden myötä, mutta Suomessa on edelleen suuri joukko IRC:n vannoutuneita
käyttäjiä. Myös itselleni IRC on yksi tärkeimpiä henkireikiä viestiä kaverien
kanssa. Sosiaalisista verkoista en ole innostunut. Kuten näkyy, blogin
päivityskin on hieman jäänyt töiden ja muiden kiinnostuksenkohteiden taustalle.

![Irssi](/blog/img/irssi.png =500x "irssi. Irkissä on hiljaista.")

Onneksi IRCnet ei tee käyttäjämäärien tutkimisesta tarpeettoman vaikeaa.
Aloitan tutkimukseni listaamalla verkon rakenteen MAP-komennolla (/MAP):

<pre>
Server 
irc.nebula.fi 
 `- *.tut.fi 
     |- irc2.inet.fi 
     |- *.oamk.fi 
     |- *.no 
     |- irc.elisa.fi 
     |- irc.tdc.fi 
     |- irc.opoy.fi 
     |- *.nl 
     |   |- *.be 
     |   |- *.pl 
     |   |   |- *.tw 
     |   |   |- ircnet.eversible.com 
     |   |   |- ircnet.nerim.fr 
     |   |   |- *.ee 
     |   |   `- *.cz 
     |   |- *.it 
     |   |- *.is 
     |   |- *.irc6.net 
     |   |- *.at 
     |   |   |- hub.uk 
     |   |   |   |- *.jp 
     |   |   |   |- *.dotsrc.org 
     |   |   |   |- ircnet.blacklotus.net 
     |   |   |   |- *.DE 
     |   |   |   |- *.hu 
     |   |   |   |- irc.atw-inter.net 
     |   |   |   |- ircnet.optilian.net 
     |   |   |   `- *.si 
     |   |   `- *.se 
     |   `- *.il 
     |- *.lut.fi 
     `- *.hut.fi 
         |- *.oulu.fi 
         |- *.jyu.fi 
         `- irc1.inet.fi 
End of MAP 
</pre>

Kuten näkyy, tein reittikyselyn irc.nebula.fi:llä (irkkaan [Kapsin][kapsi]
shell-palvelimen kautta). Tästä johtuen verkon reittikartta on Nebulan
IRC-palvelimen näkemys maailmasta.

IRCnet-palvelinten välisissä yhteyksissä on käytössä tarkkojen reittien piilotus (mask); tästä johtuen esimerkiksi Alankomaiden (.nl) sisäiset palvelimet eivät näy kartassa vaan niistä näkyy ainoastaan *.nl. Tosiasiassa palvelimia on useampia.

Käyttäjätilastojen osalta parempia lukuja saisi jos seuraisi käyttäjämäärää eri
vuorokaudenaikoihin. Olen kuitenkin sivuttanut sen tällä kertaa, sillä palvelin
kertoo kuitenkin yhteyksien maksimimäärän. Koska nykyinen tilanne on lähellä
maksimia, teen oletuksen että tilanne ei eri vuorokaudenaikaan ole
ratkaisevasti eri. Tämän kirjoituksen tiedot hain 5.3.2014 klo 23:40
Tyynenmeren aikaa eli Suomessa 6.3.2014 klo 09:40.

Eri palvelinten käyttäjätilastot sain /LUSERS-käskyllä (esim. /LUSERS
irc.opoy.fi irc.opoy.fi). LUSERS-käskyn tulos näyttää seuraavalta:

<pre>
[irc.nebula.fi] I have 5434 users, 0 services and 1 servers
[irc.nebula.fi] 5434 5567 Current local users 5434, max 5567
[irc.nebula.fi] 48892 56017 Current global users 48892, max 56017
</pre>

Tässä vapaamuotoinen tiivistelmäni ja yhdistelmä MAP ja LUSERS-käskyjen
tuloksista:

<pre>
                      yhteyksiä  - palvelimia
  irc.nebula.fi             5431 - 1
   `- *.tut.fi             +5325 - 2
       |- irc2.inet.fi     +931  - 1
       |- *.oamk.fi        +35   - 1
       |- irc.elisa.fi     +2074 - 1
       |- irc.tdc.fi       +430  - 1
       |- irc.opoy.fi      +303  - 1
       |- *.lut.fi         +348  - 1
       |- *.hut.fi         +3914 - 1
       |   |- *.oulu.fi    +1378 - 1
       |   |- *.jyu.fi     +570  - 1
       |   `- irc1.inet.fi +1057  = yht. 21796
       |- *.no                                648   - 4
       `- *.nl                               +3971  - 7
           |- *.be                           +309   - 1
           |- *.pl                           +1126  - 3
           |   |- *.tw                       +73    - 2
           |   |- ircnet.eversible.com       +1969  - 1
           |   |- ircnet.nerim.fr            +265   - 1
           |   |- *.ee                       +749   - 4
           |   `- *.cz                       +612   - 3
           |- *.it                           +274   - 5
           |- *.is                           +80    - 3
           |- *.irc6.net                     +937   - 1
           |- *.at                           +131   - 2
           |   |- hub.uk                     +7     - 1
           |   |   |- *.jp                   +6416  - 4
           |   |   |- *.dotsrc.org           +87    - 1
           |   |   |- ircnet.blacklotus.net  +1329  - 1
           |   |   |- *.DE                   +3301  - 6
           |   |   |- *.hu                   +1112  - 4
           |   |   |- irc.atw-inter.net      +2280  - 1
           |   |   |- ircnet.optilian.net    +210   - 1
           |   |   `- *.si                   +140   - 1
           |   `- *.se                       +1032  - 4
           `- *.il                           +4     = (yht. 27062)
</pre>

Nebulan palvelimen yhteyksistä valtaosa luultavasti ovat Kapsin palvelimelta.
Julkisia tietoja ei ole, mutta yhdistyksen jäsenmäärä 5205 jäsentä on samaa
suuruusluokkaa ja siltä ajalta kun olin ylläpitäjä muistikuvan mukaan
IRC-yhteyksien määrä oli suunnilleen jäsenmäärän luokkaa tai kenties yhteensä
jopa vähän korkeampi.

On hyvä huomata että käyttäjän ja yhteyden välillä on pieni ero. Joillakin
käyttäjillä on useampia yhteyksiä, toisaalta osa käyttäjistä voi sulkea
yhteyden kun ei ole paikalla. Käytän termejä tässä hieman sekaisin. Oletan että
sama ilmiö on jokseenkin alueista riippumaton, mutta tämä voi aiheuttaa hieman
poikkeamaa käyttäjä- ja yhteysmäärien välillä.

Tämän selvitykseni perusteella näyttäisi että IRCnetissä on hieman vajaa
50&nbsp;000 yhtäaikaista käyttäjää (määrä vaihtelee vuorokaudenajan mukaan).
Näistä n. 22&nbsp;000 vaikuttaisi olevan suomalaisilla palvelimilla eli n.
45&nbsp;% kaikista IRCnet-käyttäjistä olisi suomalaisia. Jos kuvitellaan että
Kapsin jäsenistä kaikki irkkaisivat IRCnetissä ja jokaisella olisi täsmälleen
yksi yhteys, suurinpiirtein kolmasosa suomalaisista irkkaajista olisi Kapsin
jäseniä, eli noin 24&nbsp;% Suomen IRCnet-käyttäjistä ja 11&nbsp;% kaikista
IRCnet-käyttäjistä.

Minussa tulos herättää ristiriitaisia tunteita. Toisaalta tulos kertoo IRC:n
edelleen vahvasta asemassa Suomessa, mutta toisaalta hieman huolestuttavasti
yleisemmin kertoo IRCnetin hitaasta rappiosta. Kuinka kauan rakas IRC-verkkomme
vielä pyörii ja jatkuuko toiminta Suomessa kun muissa maissa käyttäjät ovat
kokonaan kadonneet? Mikä korvaa irkin? Minulle pikaviestimet eivät ikinä ole
korvanneet irkin omanlaista kulttuuriaan.

Irkkailemisiin. Kuulen mielelläni kommentteja irkissä tai sähköpostitse (osoite sivun ylänurkassa).

**Päivitys 1. Lisätty kommentti erosta yhteyksien ja käyttäjien välillä.**

**Päivitys 2. Vaihdettu LUSERS käskyn syntaksia; laskee oikein useiden hubin
kautta löytyvät yhteydet.**

-- Joonas Kuorilehto (joneskoo), Kaliforniassa 5.3.2014.

[kapsi]: http://www.kapsi.fi/ (Kapsi Internet-käyttäjät ry)