---
layout: post
title: OpenWRT-pohjainen bittijarru
tags:
    - kotiverkko
    - skriptit
excerpt: Lyhennelmätesti
---

Kotona pyörittämäni Linux-palvelin suli jostain mystisestä syystä, jota en ole vieläkään jaksanut selvittää. Siirsin sen järjestelmän ajoon Vmwaren päälle iMacilleni. Huonona puolena en jaksanut alkaa kikkailemaan palomuuria vmwaren sisään kun vlan tagien kanssa oli jotain ongelmia.

Yhteytenä kotonani on tällä hetkellä Soneran 24/2 Mbit/s ADSL2+ Annex M-yhteys. Sen ongelma on ainakin kuluttajamodeemeilla, että jos ulospäin lähtee dataa, niin viive nousee kohtuuttoman suureksi irkkaamiseen. Ratkaisuna aiemmin käytin wondershaper-skriptistä liikkeelle lähtien lopulta kokonaan itse kirjoittamaani **wshaper++**\-skriptiä. Kun kotipalvelimeni pyörii nyt vmwaressa enkä käytä sitä reitittimenä, muodostuu ongelmaksi että käyttämäni NAT-purkki ei aja Linuxia ja ADSL-modeemiinkaan jarrua en saanut laitettua. Sinänsä Telewellin ADSL-modeemissa on Linux ja korkkasinkin sen asentamalla sarjaportin, mutta softa on jotenkin kohtuuttoman tympeää käyttää.

Keksinkin lopulta ongelmaan mitä parhaimman ratkaisun: läpinäkyvä jarruttava silta ADSL-modeemin ja muun verkon välille. Silta pitää huolta, että IPv4- ja IPv6-yhteydet saavat kaistan jaettua reilusti (= IPv6:lle vähintään puolet) ja pienet paketit menevät joka tapauksessa ensin. Ratkaisun toteutin OpenWRT:n päälle. Käytännössä wshaper++-skripti toimi suoraan kun latasin oikeat kernelimoduulit, jotka asensin opkg:llä. Säädin verkkoasetukset niin, että portissa 1 on management, WAN-portissa on Internet-yhteys ja portit 2-4 ovat sillattu siihen. 

## Pakettien asentelua ##

<pre>
# opkg install tcpdump # muutenkin hyödyllinen
# opkg install kmod-sched
# opkg install bash # vältetään uudelleenkirjoitus
# opkg install ip
# opkg install tc
# opkg install wget
# wget https://svn.derbian.fi/utilities/wshaper++
</pre>

## Verkkoasetukset ##

Verkkoasetukset saa hoidettua kivuttomasti OpenWRT:n asetustiedostoilla. Jaetaan "LAN"-portit kahteen ryhmään, jotta saadaan hallintaportti erilleen. WAN ei tarvitse IP:tä enää sen jälkeen, kun tarvittavat ohjelmat on asennettu. Näin purkki on entistä läpinäkyvämpi.

<pre>
config switch eth0
  option vlan0 "1 5*"
  option vlan1 "0 5"
  option vlan2 "2 3 4 5"
config interface lan
  option type bridge
  option ifname "eth0.0"
  option proto static
  option ipaddr 192.168.1.1
  option netmask 255.255.255.0
config interface wan
  option type bridge
  option ifname "eth0.1 eth0.2"
  option proto none
</pre>

## Kernelimoduulien lataus ##

Kernelimoduulitkin on syytä ladata buutissa, muuten skripti antaa ihmeellisiä virheitä. Moduulit voi ladata insmodilla tai voi buutata purkin seuraavan tiedoston lisäämisen jälkeen.

<pre>
# /etc/modules.d/45-qos
sch_esfq
sch_htb
cls_u32
</pre>

Editoin hieman wshaper++-skriptiä sopimaan paremmin tähän tarkoitukseen. Vaihdoin sfq:n skriptistä esfq:n, kun en aluksi hoksannut että vanha sfq-moduulikin olisi ollut tarjolla. 

Lähinnä korvasin sfq:n esfq:lla ja lisäsin alkuun pätkän

<pre>
if [[ -z $1 || -z $2 ]]; then
  echo "Usage: wshaper++ &lt;IF&gt; &lt;UPSTREAM-BW&gt;
  exit 1
fi
IFACE=$1
UPLINK=$2
</pre>

Jos en unohtanut dokumentoida jotain olennaista välivaihetta, jokseenkin näin pitäisi saada toistettua vastaava jarru. WLANia en käytä purkista ollenkaan. Kerrothan, jos tästä postauksesta oli sinulle hyötyä, siitä tulee minulle hyvä mieli. Jos huomaat, että unohdin jotain tärkeää, kerro toki siitäkin.

Jarru käyntiin!

<pre>
# ./wshaper++ eth0.1 512
# ./wshaper++ eth0.2 512
</pre>

