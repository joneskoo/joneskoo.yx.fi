---
date: 2011-02-23T00:00:00Z
title: Hyödyllisiä vinkkejä, osa less
slug: less
tags:
 - vinkkejä
 - skriptit
 - shell
aliases:
 - /blog/2011/02/23/less.html
---

Olen käyttänyt, kuten varmasti lähes kaikki \*nix-käyttäjät, lessiä niin kauan kuin muistan. Tässä joku aika sitten tuli vastaan pari asiaa, joita en ollut hoksannut. Kenties ovat menneet muiltakin ohi?

Olennaisimpana olen käyttänyt lokien seuraamiseen käskyä

    tail -f loki | less

Tässä ei nyt ajateltuna ole mitään järkeä, koska less osaa seurata kasvavaa tiedostoa itsekin. Käsky **F** kun tiedosto on avattu lessillä alkaa seurata kasvavan tiedoston loppua. [Lista käskyistä][1] löytyy esimerkiksi Wikipediasta.

Muita hyödyllisiä ovat esimerkiksi vimistä tuttu m**X** ja vastaava '**X**, joista ensimmäinen laittaa nykyisen sijainnin tiedostossa muistiin paikkaan **X** (missä X on esimerkiksi jokin kirjain) ja vastaavasti jälkimmäinen siirtyy tallennettuun sijaintiin.

Toinen mitä olen aiemmin käyttänyt on:

    zcat tiedosto.gz | less

Paljon kätevämpi on käyttää lesspipe-suodatinta, joka osaa purkaa gzipin. Vaihtoehtoisesti voi tietysti käyttää myös zlessiä, mutta lesspipe on monipuolisempi. Se osaa näyttää tiedostolistaukset esim. .tar.gz-tiedostoista. Lesspipen käyttö on helpointa LESSOPEN-ympäristömuuttujan avulla, jolloin less käyttää sitä automaattisesti pakattujen tiedostojen kanssa (tarkemmin kokeilee sitä aina, mutta lesspipe ei tee mitään jos tiedosto ei ole pakattu, jolloin less toimii kuten tavallisesti).

Seuraava rivi shellin profiilili- tai rc-skriptissä ottaa käyttöön lesspipe-suodattimen:

    export LESSOPEN='| /usr/bin/lesspipe %s'

Lesspipe ei sentään yritä näyttää HTML:ää w3m:llä, kuten muistaakseni Gentoon oletusasetuksilla toimiva less. Uskoakseni lesspipen käyttö on kuitenkin ihan ok. Ubuntu käyttää lesspipeä oletuksena.

Hauskoja hetkiä lessin kanssa. Less is more.

[1]: http://en.wikipedia.org/wiki/Less_(Unix)#Frequently_used_commands "Lista less-komennon usein käytetyistä käskyistä"
