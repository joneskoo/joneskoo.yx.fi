---
date: 2014-11-27T00:00:00Z
tags:
- skriptit
- kvm
- ubuntu
title: Ubuntu ja cloud-init kotipalvelimella
slug: kvm-ubuntu-cloud-init
aliases:
 - /blog/2014/11/27/kvm-ubuntu-cloud-init.html
---

Virtuaalikoneen asennuksen ei tarvitse olla vaikeaa. Ubuntu julkaisee
viralliset levykuvat pilvipalveluita varten, joita voi käyttää yhtä
hyvin myös kotona. Itse asiassa se ei ole edes vaikeaa, mutta ohjeita
saa hieman kaivaa.

<!--more-->

Jos olet ikinä käynnistänyt virtuaalikoneen pilveen esimerkiksi
[Amazonin EC2:n][ec2] tai [Digital Oceaniin][digitalocean],
tiedät että se on aika helppoa ja nopeaa.
Jos olet puolestaan asentanut Linux-virtuaalikoneita perinteisin menetelmin,
eli esim. lataamalla CD-kuvan ja käynnistämällä siitä asennuksen, tiedät
että siinä menee vähintään 5-15 minuuttia. Pilvipalveluiden käyttö maksaa
kuitenkin rahaa (vaikkakaan ei paljon).

Minä olen useamman kerran halunnut tehdä jotain kikkailua, joka on luonteeltaan
sellaista että haluan eristää sen käyttöläppäristäni ja palvelimestani.
Tällöin virtuaalikone tulee kysymykseen. Samaan aikaan jos alkaisin asentamaan
käyttöjärjestelmän perinteisin keinoin, monissa tilanteissa ehtisin unohtaa
mitä olin tekemässä tuon 15 minuutin aikana, ja pahimmillaan asennus vaatisi
välikysymyksiä ja jopa salasanan valintaa tai muuta vastaavaa. Kaikenlaiset
kysymykset katkaisevat ajatuksen. Täytyi siis löytää ratkaisu miten saadaan
kestävästi luotua uusia virtuaalikoneita nopeasti, kotona ilman
pilvipalveluita, ja ilman että käytetään jo lähtökohtaisesti vanhentunutta
asennusta tai sen kopiota.

Aloin tutkimaan pilvipalveuissa viime aikoina yleistynyttä *cloud-init*
teknologiaa. Jos se ei ole tuttu entuudestaan, kyseessä on yksinkertainen
tekstimuotoinen määrittely asioista, joita uudelle virtuaalikoneelle sovelletaan
sen ensimmäisellä käynnistyskerralla.

<strong>Esimerkki cloud-config tiedostosta</strong>

{{< highlight yaml >}}
#cloud-config
hostname: fuzz01

ssh_pwauth: False
package_upgrade: true

password: ubuntu

packages:
- vim-tiny

ssh_authorized_keys:
- ssh-rsa AAAAB...

runcmd:
- update-alternatives --set editor /usr/bin/vim.tiny
{{< / highlight >}}

Löysinkin hetken selailulla [ohjeen cloud-initin käyttöön kvm:ssä][ci-kvm].
Loppuviimein cloud-initin käyttäminen paikallisesti on itse asiassa hyvin
helppoa.

Ubuntu tarjoaa [viralliset virtuaalikonekuvat pilvipalveluita
varten][ubuntu-cloud]. Ne muodostetaan säännöllisesti ja automaattisesti ja
ovat pohjalla useimpien pilvipalveluiden tarjoamiin Ubuntu-asennuksiin.
Vastaavia löytyy varmastikin muillekin jakeluille, mutta en ole perehtynyt
niihin. Ainakin [Red Hat vaikuttaisi ottaneen käyttöön][rh] cloud-initin.

Vaiheet ovat:

 1. Luodaan user-data määrittely
 2. Tehdään user-datasta levykuva
 3. Käynnistetään Ubuntu Cloud -virtuaalikone ja annetaan sille edellinen

 <iframe width="600" height="405" src="//www.youtube-nocookie.com/embed/kPY_eSqJuZA?rel=0" frameborder="0" allowfullscreen></iframe>

Tästä eteenpäin homma olikin vain naputtelua kun värkkäsin miten asiat tehdään
skriptillä niin että käyttäminen on helppoa ja että skripti toimii helposti
vielä puolen vuoden päästäkin kun Cloud image on päivittynyt.

Lopputuloksena syntyi [kasa skriptejä, joilla Ubuntu Cloud-imagen käyttäminen
on helppoa][ubuntu-cloud-init]. Koodit löytyvät Githubista. Saa käyttäää
vapaasti ja jos herää ajatuksia niin kuulen mielelläni palautetta esim.
sähköpostitse.
Skriptien avulla riittää kun määrittelee cloud-config kuvauksen ja antaa
käskyn luoda virtuaalikoneen. Noin minuuttia myöhemmin virtuaalikone on
valmis käyttöön.

<strong>PÄIVITYS 29.11.2014: Lisäsin tuen Fedora 20:lle.</strong>


[ec2]: http://aws.amazon.com/ec2/ "Amazon Web Services - EC2 (Elastic Compute Cloud)"
[digitalocean]: https://m.do.co/c/51f6517e0d88 "Digital Ocean"
[ci]: http://cloudinit.readthedocs.org/en/latest/topics/examples.html "Cloud-init esimerkkejä"
[ubuntu-cloud]: https://cloud-images.ubuntu.com/ "Ubuntu Cloud Images: Ubuntu Cloud Images are pre-installed disk images that have been customized by Ubuntu engineering to run on cloud-platforms such as Amazon EC2, Openstack, Windows and LXC."
[ci-kvm]: http://serverascode.com/2014/03/17/trusty-libvirt.html "Boot Ubuntu Trusty Tahr 14.04 with libvirt"
[ubuntu-cloud-init]: https://github.com/joneskoo/cloud-init-start "Quickly bring up Cloud instances in local KVM with virsh using cloud-config"
[rh]: https://rhn.redhat.com/errata/RHEA-2013-0535.html "RHEA-2013:0535-1 Product Enhancement Advisory, new package: cloud-init"
