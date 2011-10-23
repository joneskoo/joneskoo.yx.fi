---
layout: post
title: SSH known_hosts-tiedoston siistiminen
tags:
    - skriptit
excerpt: |-
    Kyllästyin viimein ssh known_hosts-tiedoston sotkuisuuteen ja koodasin
    yksinkertaisen skriptin, joka yhdistää saman palvelimen rivit yhdeksi.
---

Kyllästyin viimein ssh known\_hosts-tiedoston sotkuisuuteen ja koodasin
yksinkertaisen skriptin, joka yhdistää saman palvelimen rivit yhdeksi.
Omassa known\_hosts-tiedostossani alkaa rivejä olla lähemmäs sata, joten
siistiminen on oikeasti tarpeen.

Kätevin tapa muistaa mille kaikille koneille salasana tai ssh-avain täytyy
vaihtaa on katsoa known\_hosts-tiedostosta mihin kaikkialle on tullut
kirjauduttua. Aika nopeasti listasta saa käytyä läpi tarpeelliset.

Tässäpä <a href="https://gist.github.com/1306614">koodit</a>, jos lukijoilla sattuisi olemaan sama ongelma. Pitäisi toimia
Pythonin sekä uusilla 2.x että 3.x versioilla.

{% highlight python %}
import re
import sys
import os
import shutil

HOME = os.environ['HOME']
DOTSSH = os.path.join(HOME, '.ssh', 'known_hosts')

# Backup known hosts file
shutil.copyfile(KNOWN_HOSTS, KNOWN_HOSTS+".old")

# Read known hosts to memory
with open(KNOWN_HOSTS) as f:
    knownhosts = dict()
    oldlines = 0
    for line in f:
        if line.strip() == "" or line.strip().startswith("#"):
            continue
        oldlines += 1
        hosts, keytype, fingerprint = line.strip().split(" ")
        dictkey = keytype + fingerprint
        hosts = hosts.split(",")
        if knownhosts.get(dictkey) == None:
            knownhosts[dictkey] = dict(hosts=set(), keytype=keytype,
                                       fingerprint=fingerprint)
        knownhosts[dictkey]['hosts'].update(hosts)

# Replace known hosts with a cleaned version
with open(KNOWN_HOSTS, 'w') as f:
    for key, host in knownhosts.items():
        host['hosts_joined'] = ",".join(host['hosts'])
        f.write("%(hosts_joined)s %(keytype)s %(fingerprint)s\n" % host)

print("OK. Cleaned up", KNOWN_HOSTS)
print("Change: from %d lines to %d lines." % (oldlines, len(knownhosts)))
{% endhighlight %}
