---
date: 2009-03-25T00:00:00Z
tags:
- shorturl
title: yx.fi lyhytosoitepalvelun uudelleenkirjoitus
slug: yxfi-lyhyturlipalvelun-uudelleenkirjoitus
---


Muutaman kerran oli jo aiemmin käynyt mielessä. Nyt sain sen viimein tehtyä. Kirjoitin alusta asti uudestaan yx.fi lyhytosoitepalvelun. Aioin aluksi käyttää Kapsi Internet-käyttäjät ry:n Sikteeri-projektista tuttua TurboGears-frameworkkiä, tai ainakin sen osia. Hetken pidempään tutkittuani huomasin, että Kid-template-kirjastoa ei ole kehitetty muutamaan vuoteen. Sen tilalle on noussut Genshi, joka uppoaa kohtuullisen pienin muutoksin Kidin tilalle.

Genshi, kuten Kid:kin, vaatii että templatet ovat validia XML:ää. Niissä voi käyttää Python-koodia melko vapaasti. Sain melko nopeasti luotua yhden rungon, johon eri sivujen sisältö sijoitetaan. Käytin vanhasta koodista suoraan CSS-tyylimäärittelyjä. Tämän vuoksi uutta lyhyturlipalvelua voi hädintuskin erottaa alkuperäisestä ulkoisesti.

{{< highlight html >}}
<div py:if="errors" class="error">
 <p>Creating the short URL failed:</p>
  <ul>
   <li py:for="error in errors">${error}</li>
  </ul>
</div>
{{< / highlight >}}

Esimerkki Genshi-templatesta

Kun olin saanut rungon kasaan, tarvitsi selvittää miten sisällön saa näkymään. Aiemmin minulla oli staattinen HTML-etusivu ja kaksi erillistä skriptiä, lyhyturlin lisäämiseen ja uudelleenohjausta varten. Suoraan sanoen vanha koodi oli läjä purkkaa liimattuna kasaan. Hyi kauhistus.

Googlettamalla löysin hyvän suosituksen sivuston rungoksi. Werkzeug on kotisivunsa mukaan kokoelma WSGI-työkaluja ja apuohjelmia. Siihen kuuluu debuggeri, erinäisiä webbisovelluksissa tarvittuja kirjastotoimintoja ja URL-reititys. Viimeinen on tärkeimpiä syitä, miksi tarvitsin Werkzeugin.

Uusi koodini on organisoitu jokseenkin model-view-controller (tai oikeammin model-template-controller) arkkitehtuurin mukaisesti. Siinä on selkeästi erotettavissa erillisinä osina sivurungot (templatet) ja näkymät (view), tietokantamalli (model) ja kontrolleri. Tietokantamalli on vain muutama rivi koodia, sillä tietokanta on todella yksinkertainen. Kontrolleri päättää pyynnön perusteella mitä sisältöä selaimelle tarjotaan ja valitsee oikean sivurungon. Näet hakemistorakenteen alla olevasta kuvasta.

![yx.fi lähdekoodit](/blog/img/2009-03-12-yxfi-main.png)

Tietokantamalli todellakin on yksinkertainen. Siinä on peräti neljä riviä koodia:

{{< highlight python >}}
class Shorturl(SQLObject):
    url = StringCol()
    host = StringCol(length=42)
    ts = DateTimeCol()
{{< / highlight >}}


Kuten näkyy, käytän SQLObject objektirelaatiomapperia (ORM) tietokannan käyttämiseen. Näin minun ei tarvitse huolehtia tietokannan käsittelystä, ei tarvitse kirjoittaa SQL-lausekkeita eikä huolehtia siitä että koodivirheeni vuoksi koko tietokanta voitaisiin tyhjentää (SQL injection).

Tosin myös SQLObject taitaa olla nykyään hylätty projekti. Hyvä idea voisi olla siirtyä käyttämään SQLAlchemyä, jota kehitetään yhä. Muutenkin SQLAlchemy on käsittääkseni monipuolisempi ja kun tietokanta on näin yksinkertainen, muutokset muuhun koodiin jäisivät luultavasti erittäin vähäisiksi.

Kaikenkaikkiaan olen erittäin tyytyväinen uusittuun yx.fi lyhyturlipalveluun. Nyt pystyin toteuttamaan skriptejä varten tarvittavan RPC-rajapinnan helposti (pyytäkää speksit jos haluatte käyttää, annan ne kyllä mielelläni). Lisäksi lisäsin esikatselumahdollisuuden, esimerkiksi jos haluaa nähdä mihin yx.fi/1 ohjaa, voi surffata osoitteeseen http://yx.fi/p/1.

Oikeilla työkaluilla harrastekoodausprojektit ovat ihan kivoja. Ihan kuin ohjelmointi alkaisi taas kiinnostaa minua muutaman vuoden tauon jälkeen, jota ennen kirjoitin melko paljon Perliä. Nykyään olen siirtynyt Applen koneisiin ja OS X:n ja Python istuu huomattavasti paremmin päähäni, vaikka aiemmin olin Perlin kannalla. Myös hieman Emacs-henkinen editori TextMate tuntuu sopivan äärimmäisen hyvin ajattelumalleihini, vaikka ennen olinkin vahvasti tykästynyt vi:n.

Toisaalta enpä vielä 3 vuotta sitten uskonut seurustelevani saati harkitsevani avioliittoa…
