---
date: 2011-12-20T00:00:00Z
excerpt: |-
  Saunalahden mobiilidatan IP-osoitteiden loppumisen vuoksi Saunalahti
  lopettaa julkisten IPv4-osoitteiden jakamisen. Huonon ohjeistuksen vuoksi
  tiedotteesta sai kuvan, että julkisia osoitteita ei enää saisi. Kuitenkin
  tosiasiassa tarjolle tuotiin uusi APN "internet4", jonka saa erikseen
  tilaamalla käyttöön (ilmaiseksi). Eli ongelma olikin lopulta
  tiedottamisessa.
tags:
- saunalahti
- ipv6
- angst
- mobiili
title: Saunalahden mobiiliyhteyksien NAT
slug: saunalahti-nat
aliases:
 - /blog/2011/12/20/saunalahti-nat.html
---

Saunalahdella on ollut muutaman kuukauden ajan ongelmia IP-osoitteiden
loppumisen kanssa. Ilmeisesti eivät ole saaneet tarvitsemaansa määrää uusia
osoitteita mobiiliyhteyksille Euroopan IP-osoitteita myöntävältä RIPE:ltä,
tuskin tahallaan kiusaisivat asiakkaitaan.

<!--more-->

Jotkin palvelut, kuten eräät VPN-yhteysratkaisut, ääni- tai
videoneuvottelusovellukset tai verkkopelit eivät toimi osoitteenmuunnoksen (NAT)
kanssa. Koska Saunalahden osoitteet eivät ole riittäneet, Saunalahti on
pakottanut osan käyttäjistä osoitteenmuunnoksen taakse. Kun asiakkaat ovat
valittaneet toimimattomista palveluista, Saunalahden ohje on ollut yhdistää
uudestaan kunnes arpa antaa sellaisen osoitteen joka ei ole osoitteenmuunnoksen
takana. Hirveän kätevää?

Uusin Saunalahden tiedote asiasta oli hyvin synkkä:

> Kaikissa Saunalahden mobiili- ja mobiililaajakaistaliittymissä siirrytään
> ip-osoitteiden riittävyyden turvaamiseksi ns. osoitemuunnoksen käyttöön.
> Lokakuussa alkanut muutos laajenee 23.1.2012 alkaen koskemaan kaikkia mobiili-
> ja mobiililaajakaistaliittymiä lukuunottamatta prepaid-liittymiä, ja se on
> voimassa kaikkina vuorokaudenaikoina.
>
> IP-osoitteiden myöntämiskäytännön muuttaminen ei vaadi toimenpiteitä
> asiakkaalta eikä vaikuta normaaliin internet-käyttöön.
>
> Lue lisätiedot ja ohjeet erityistilanteisiin: saunalahti.fi/asiakaspalvelu > Ohjeet tuotteittain > Mobiililaajakaista > Mobiililaajakaistan käyttäminen > Osoitteenmuunnos (NAT)

Ehkä en vain tajua mutta tiedote antaa ymmärtää että osoitteenmuutos tulee
jatkossa kaikkiin yhteyksiin. Piste. IPv4 on loppu. IPv6:sta ei puhuta.

Ensimmäinen reaktio oli heittää tiedoteurli irkkiin parille kanavalle keskusteltavaksi. MIKSI IHMEESSÄ SAUNALAHTI RIKKOO MINUN INTERNETTINI?!

Sitten luin linkitetyn [Osoitteenmuunnos (NAT)][saunalahti-nat] -ohjesivun.
Siellä on kerrottu, että jos jokin palvelu ei toimi muutoksen jälkeen, on
mahdollista käyttää lisämaksutonta vaihtoehtoista APN:ää mobiiliyhteyttä
yhdistäessä, jolloin entiseen tapaan saa julkisen IPv4-osoitteen. Aha.

Ohjeet kiireisimmille:

* GSM-Liittymät ja Mobiililaajakaista > Liittymät > Palvelut > Ilmaiset > Muokkaa asetuksia
* Julkinen (vaihtuva) ip-osoite: ruksi paikalleen => tallenna
* Vaihda päätelaitteeseen APN-osoitteeksi "internet4" "internet.saunalahti" tilalle

Jos tiedotteessa olisi sanottu että tämä tarjotaan edelleen vaihtoehtona, olisi
tilanne ollut aivan toinen. Minkä ihmeen takia tiedotteessa ei voitu mainita,
että itse asiassa tässä ollaan PARANTAMASSA palvelua. Sen sijaan että NAT
arvotaan käyttäjille, se tulee oletukseksi mutta ne, jotka tekevät yhteydellä
muutakin kuin surffailevat webbisivuja, saavat edelleen suorat yhteydet.

Ihmeellistä tiedotusta. Mutta lopulta mitään mullistavaa ei sattunut.

P.S. Laitoin Saunalahdelle kyselyn milloin IPv6:n saa käyttöön. En pidättäisi
hengitystä. Edellisellä kerralla kun kysyin useammilta operaattoreilta, yksikään
ei kertonut sanallakaan aikataulusta. Joku sanoi että on sisäisesti kokeiltu,
toinen sanoi että ei olla harkittukaan.

[saunalahti-nat]: http://www.elisa.fi/saunalahti/asiakaspalvelu/570/osoitteenmuunnos-nat/ (Osoitteenmuunnos (NAT))
