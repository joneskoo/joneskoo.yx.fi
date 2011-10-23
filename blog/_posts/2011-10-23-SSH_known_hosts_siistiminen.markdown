---
layout: post
title: SSH known\_hosts-tiedoston siistiminen
tags:
    - skriptit
excerpt: |-
    Kyllästyin viimein ssh known\_hosts-tiedoston sotkuisuuteen ja koodasin
    yksinkertaisen skriptin, joka yhdistää saman palvelimen rivit yhdeksi.
---

Kyllästyin viimein ssh known\_hosts-tiedoston sotkuisuuteen ja koodasin
yksinkertaisen skriptin, joka yhdistää saman palvelimen rivit yhdeksi.
Omassa known\_hosts-tiedostossani alkaa rivejä olla lähemmäs sata, joten
siistiminen on oikeasti tarpeen.

Kätevin tapa muistaa mille kaikille koneille salasana tai ssh-avain täytyy
vaihtaa on katsoa known\_hosts-tiedostosta mihin kaikkialle on tullut
kirjauduttua. Aika nopeasti listasta saa käytyä läpi tarpeelliset.

Tässäpä koodit, jos lukijoilla sattuisi olemaan sama ongelma. Pitäisi toimia
Pythonin sekä uusilla 2.x että 3.x versioilla.

<script src="https://gist.github.com/1306614.js?file=ssh-knownhosts-cleanup.py"></script>
