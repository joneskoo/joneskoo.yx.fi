---
date: 2017-05-26
tags:
- spotify
- skriptit
- systemd
title: Spotify palvelimella ilman näyttöä
---

Spotify on varmasti kaikille tuttu musiikkipalvelu. Spotifyn
ongelma kännykällä on kännykän äänentoisto. Musiikin pitää kuulua
kunnollisista kaiuttimista. Halusin Spotifyn soivan kaiuttimista,
mutta en halua piuhoja tai kuluttaa akkua loppuun Airplayllä.
Ratkaisu: Spotify kotipalvelimelle ja ohjaus langattomasti.

<!--more-->

![Spotify Connect](spotify.jpg "Spotify läppärillä ohjaa palvelinta")

Spotifyn [asentaminen Linuxiin on varsin helppoa](https://www.spotify.com/us/download/linux/)
ja Spotify tarjoaa jopa virallisen Linux-version.
Seuraava ongelma onkin, että Spotify vaatii näytön, mitä palvelimellani ei ole.

Aluksi Spotify vaatii kirjautumisen, ja koska komentoriviparametrejä
ei löytynyt, käynnistin Spotifyn ensin käsin.
Ensin kirjauduin ssh:lla kautta ja käytin X-edelleenohjausta, kirjauduin
Spotify:n, ja sammutin ohjelman.

<strong>Asennetaan Spotify palveluksi</strong>

{{< highlight bash >}}
# Luodaan erillinen käyttäjä palvelulle
useradd -m -c "Spotify" -s /bin/bash spotify
# Kopioidaan asetukset (ml. valmiiksi kirjautunut sessio)
mkdir /home/spotify/.config
mv /home/joneskoo/.config/spotify /home/spotify/.config/
{{< / highlight >}}

Seuraavaksi systemd-palvelumäärittely:

{{< highlight ini >}}
# /etc/systemd/system/spotify.service
[Unit]
Description=Spotify connect
After=network-online.target
ConditionPathExists=/home/spotify/.config/spotify

[Service]
ExecStart=/usr/bin/xvfb-run /usr/bin/spotify
Restart=always
User=spotify
Group=spotify

[Install]
WantedBy=multi-user.target
{{< / highlight >}}

xvfb on X virtual frame buffer. Se tarjoaa Spotifylle "näytön"
jolle se voi piirtää ikkunansa, mutta se ei varsinaisesti näy kuitenkaan
missään. Onneksi Spotify käynnistyy vaatimatta klikkauksia, kunhan
käyttöönotto on kerran tehty.
Jätän tässä kuvaamatta yksityiskohdat miten ylipäätään äänet saa toimimaan
Linux-koneella ilman työpöytäympäristöä, se kun on tietynlainen initiaatioriitti
Linux-säätämisessä. Pulse Audio, ALSA… Puhumattakaan jos haluaa äänen
optisesta lähdöstä. Mutta toimii kun on kerran tehty!

Viimeistellään täräyttämällä palvelu käyntiin.

{{< highlight bash >}}
# Lisätään palvelu käynnistymään automaattisesti
systemctl enable spotify.service
# Käynnistetään palvelu
systemctl start spotify.service
# Luetaan lokit
journalctl --unit=spotify --follow
-- Logs begin at Mon 2017-05-22 02:00:46 EEST. --
May 26 21:11:13 hansu systemd[1]: Started Spotify connect.
May 26 21:11:13 hansu xvfb-run[2291]: [0526/211113:ERROR:main_delegate.cc(752)] Could not load cef_extensions.pak
{{< / highlight >}}



Nyt Spotify pyörii palvelimella ja päivittyy muiden ohjelmien mukana,
käynnistyy automaattisesti uudelleenkäynnistyksen jälkeen. Spotify Connectin
avulla pystyn vaihtamaan kappaletta ja säätämään äänenvoimakkuutta kännykällä
tai läppärillä, myöskin kun en ole kotona sillä Spotify Connect toimii
Internetin kautta, ei paikallisverkossa.

ROCK!
