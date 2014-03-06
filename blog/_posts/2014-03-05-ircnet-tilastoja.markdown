---
layout: post
title: Tilastoja IRCnet-verkon käyttäjistä
tags:
    - irc
    - Suomi
excerpt: |-
  Tein pikaisen katsauksen IRCnet-verkon hetkellisiin käyttäjämääriin ja
  erityisesti verkon suomalaisten käyttäjien osuuteen. Tutkimukseni
  perusteella näyttäisi että jopa 39&nbsp;% IRCnetin käyttäjistä voisi
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

IRCnet-palvelinten välisissä yhteyksissä on käytössä tarkkojen reittien piilotus (mask); tästä johtuen esimerkiksi Alankomaiden (.nl) sisäiset palvelimet eivät näy kartassa vaan niistä näkyy ainoastaan *.nl. Tosiasiassa palvelimia on luultavasti useampia.

Käyttäjätilastojen osalta parempia lukuja saisi jos seuraisi käyttäjämäärää eri
vuorokaudenaikoihin. Olen kuitenkin sivuttanut sen tällä kertaa, sillä palvelin
kertoo kuitenkin yhteyksien maksimimäärän. Koska nykyinen tilanne on lähellä
maksimia, teen oletuksen että tilanne ei eri vuorokaudenaikaan ole
ratkaisevasti eri. Tämän kirjoituksen tiedot hain 5.3.2014 klo 22:00
Tyynenmeren aikaa eli Suomessa 6.3.2014 klo 08:00.

Eri palvelinten käyttäjätilastot sain /LUSERS-käskyllä (esim. /LUSERS
irc.opoy.fi). Kaikilta palvelimilta tietoja ei saa, joten joudun tyytymään
osatulokseen. LUSERS-käskyn tulos näyttää seuraavalta:

<pre>
[irc.nebula.fi] I have 5424 users, 0 services and 1 servers
[irc.nebula.fi] 5424 5567 Current local users 5424, max 5567
[irc.nebula.fi] 48332 56017 Current global users 48332, max 56017
</pre>

Tässä vapaamuotoinen tiivistelmäni ja yhdistelmä MAP ja LUSERS-käskyjen
tuloksista:

<pre>
  irc.nebula.fi             5424
   `- *.tut.fi             +2524
       |- irc2.inet.fi     +910
       |- *.oamk.fi        +35
       |- irc.elisa.fi     +2028
       |- irc.tdc.fi       +429
       |- irc.opoy.fi      +299
       |- *.lut.fi         +345
       |- *.hut.fi         +3868
       |   |- *.oulu.fi    +1378
       |   |- *.jyu.fi     +562
       |   `- irc1.inet.fi +1051  = yht. 18853
       |- *.no                                499
       `- *.nl                               +0
           |- *.be                           +308
           |- *.pl                           +0
           |   |- *.tw                       +1
           |   |- ircnet.eversible.com       +1914
           |   |- ircnet.nerim.fr            +267
           |   |- *.ee                       +1
           |   `- *.cz                       +264
           |- *.it                           +7
           |- *.is                           +0
           |- *.irc6.net                     +935
           |- *.at                           +1
           |   |- hub.uk                     +7
           |   |   |- *.jp                   +15
           |   |   |- *.dotsrc.org           +84
           |   |   |- ircnet.blacklotus.net  +1303
           |   |   |- *.DE                   +298
           |   |   |- *.hu                   +825
           |   |   |- irc.atw-inter.net      +2287
           |   |   |- ircnet.optilian.net    +209
           |   |   `- *.si                   +138
           |   `- *.se                       +3
           `- *.il                           +5 = yht. 9371
(28 224 yhteyden palvelin tuntematon)
</pre>

Selvästikin hubeilta saadut yhteysmäärät eivät ole kaikkien hubin taakse
jäävien palvelimien yhteyksien määrä, sillä ei ole uskottavaa että Alankomaissa
ei olisi esimerkiksi yhtään käyttäjää. Vastaavasti Puolan 0 käyttäjää ei ole
uskottava luku. Yhteensä menetelmälläni löytyi siis 28&nbsp;224 yhteyttä eli 58&nbsp;% todellisesta yhteysmäärästä.

Tästä huolimatta uskoisin että suomalaisten palvelinten osalta tulos voisi olla
uskottava. Nebulan palvelimen yhteyksistä valtaosa luultavasti ovat Kapsin
palvelimelta. Julkisia tietoja ei ole, mutta yhdistyksen jäsenmäärä 5205
jäsentä on samaa suuruusluokkaa ja siltä ajalta kun olin ylläpitäjä muistikuvan mukaan IRC-yhteyksien määrä oli suunnilleen jäsenmäärän luokkaa tai kenties yhteensä jopa vähän korkeampi.

Luultavasti epätarkan ja epätieteellisen selvitykseni perusteella näyttäisi
että IRCnetissä on hieman vajaa 50&nbsp;000 yhtäaikaista käyttäjää (määrä
vaihtelee vuorokaudenajan mukaan). Näistä n. 19&nbsp;000 vaikuttaisi olevan
suomalaisilla palvelimilla eli n. 39&nbsp;% kaikista IRCnet-käyttäjistä olisi
suomalaisia. Edelleen suurinpiirtein kolmasosa suomalaisista käyttäjistä olisi
Kapsin jäseniä, eli noin 27&nbsp;% Suomen IRCnet-käyttäjistä ja 11&nbsp;%
kaikista IRCnet-käyttäjistä. 42&nbsp;% yhteyksistä jäi tuntemattomiksi, mutta
todennäköisesti näihin ei jää kovin monta suomalaista käyttäjää. Jos
menetelmässäni ei ole periaatteellista virhettä, arvio suomalaisten osuudesta
pitäisi olla pessimistinen.

Minussa tulos herättää ristiriitaisia tunteita. Toisaalta tulos kertoo IRC:n
edelleen vahvasta asemassa Suomessa, mutta toisaalta hieman huolestuttavasti
yleisemmin kertoo IRCnetin hitaasta rappiosta. Kuinka kauan rakas IRC-verkkomme
vielä pyörii ja jatkuuko toiminta Suomessa kun muissa maissa käyttäjät ovat
kokonaan kadonneet? Mikä korvaa irkin? Minulle pikaviestimet eivät ikinä ole
korvanneet irkin omanlaista kulttuuriaan.

Irkkailemisiin. Kuulen mielelläni kommentteja irkissä tai sähköpostitse (osoite sivun ylänurkassa).

-- Joonas Kuorilehto (joneskoo), Kaliforniassa 5.3.2014.

[kapsi]: http://www.kapsi.fi/ (Kapsi Internet-käyttäjät ry)