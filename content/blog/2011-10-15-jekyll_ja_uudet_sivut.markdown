---
date: 2011-10-15T00:00:00Z
excerpt: |-
  Taas on tullut aika kirjoittaa kotisivut uusiksi. Tekniikka kehittyy ja
  silleen. Lähdin taas tyhjästä suunnittelemaan kotisivuilleni asettelua ja
  miettimään sisällön esittämistä uusiksi. Edellisen sivun luomisen jälkeen
  olin ehtinyt muun muassa perustaa blogin ja valokuvien jakamista varten
  kuvafeedin. Vanhalla saitilla näihin oli vain linkki, mikä alkoi tuntua
  rajoittuneelta.
tags:
- skriptit
title: Jekyll ja uudet sivut
url: /2011/10/15/jekyll_ja_uudet_sivut/
---

Taas on tullut aika kirjoittaa kotisivut uusiksi. Tekniikka kehittyy ja silleen.
Lähdin taas tyhjästä suunnittelemaan kotisivuilleni asettelua ja miettimään
sisällön esittämistä uusiksi. Edellisen sivun luomisen jälkeen olin ehtinyt
muun muassa perustaa blogin ja valokuvien jakamista varten kuvafeedin. Vanhalla
saitilla näihin oli vain linkki, mikä alkoi tuntua rajoittuneelta.

<!--more-->

Uusi toteutus pohjautuu tyhjästä kirjoitettuun asetteluun ja
Jekyll-sivumoottoriin, jos sitä semmoiseksi voi kutsua. Asettelun suunnittelussa
mietin mitä ihmiset voivat haluta kotisivullani oikeasti löytää ja yritin
korostaa sitä. Tyyliksi valitsin melko karun, mutta kuitenkin modernin ulkoasun.

Olen pariin kertaan jo katsellut [Githubin][gh] tarjoamaa Github Pagesia.
Github Pages on rakennettu Git-versionhallinan ympärille niin että kaikki mitä
versionhallintaan lisää, näkyy periaatteessa suoraan käyttäjälle. Eli ihan
tavallista HTML:ää ja CSS:ää voi käyttää. Kuitenkin Pages tukee myös sivupohjia
ja erityisesti blogimallista käyttöä.

Käytännössä homma toimii siis niin että versionhallintaan (ei välttämättä git)
lisätään HTML, Markdown tai Textile-muotoisia sivuja. Sivun alussa voi olla
otsake, joka kertoo että sisältö tulee sijoittaa sivupohjaan. Jos otsaketta
ei ole, oletetaan että sivu on raakaa HTML:ää.

Blogipostaukset toimivat niin, että \_posts-hakemistoon tallennetaan kirjoitus
ja tiedostonnimen avulla asetetaan kirjoituksen päivämäärä.

![Jekyll-hakemistorakenne](/blog/img/2011-10-15-jekyll-hakemistorakenne.png)

Parasta tietysti on, että koska www-palvelimelle ei tarvita mitään dynaamista
käsittelyä, sivujen tietoturvasta ei tarvitse erikseen huolehtia kun ohjelmia
ei ole pakko päivittää. Siis toisin kuin esimerkiksi Wordpressin kanssa.

Toin uudelle sivustolle joitain tärkeimmiksi katsomiani kirjoituksia vanhasta
blogista. Saatan tuoda vielä joitain lisää. Nähtäväksi jää miten aktiivisesti
alan kirjoittamaan uuteen blogiin. Ainakin uusista sivuista tuli paljon paremmin
mobiililaitteilla toimivat ja paljon hienomman näköiset kuin vanhoista.

Tavoitteena on integroida kuvafeedi samaan sivurakenteeseen, saa nähdä miten
iso projekti siitä tulee. Kuvafeedistä varmaan myöhemmin vielä lisää.

[gh]: https://github.com/ "Github"