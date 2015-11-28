#!/usr/bin/env python
# encoding: utf-8
# Joonas Kortesalmi 2006-2009
# This program is in the public domain.

import sys
import httplib
import string

charset = "UTF-8"

class Kaenkkyla:
    def __init__(self, id, nimi, lyhyesti, aliakset, yhteystiedot,
    puhelinnumero, kategoria, aukioloajat, hintataso, visaelectron, kantapassi,
    lounassetelit, panoulu, avoinna, kuva1, kuva2, kotiinkuljetus):
        self.id = int(id)
        self.nimi = nimi
        self.lyhyesti = lyhyesti
        self.aliakset = aliakset
        self.yhteystiedot = yhteystiedot
        self.puhelinnumero = puhelinnumero
        self.kategoria = kategoria
        self.aukioloajat = aukioloajat
        self.hintataso = hintataso
        self.visaelectron = visaelectron
        self.kantapassi = kantapassi
        self.lounassetelit = lounassetelit
        self.panoulu = panoulu
        self.avoinna = int(avoinna)
        self.kuva1 = kuva1
        self.kuva2 = kuva2
        self.kotiinkuljetus = kotiinkuljetus

    def __unicode__(k):
        avoinna = k.aukioloajat
        if k.avoinna == 1:
            avoinna = avoinna + " AVOINNA"
        else:
            avoinna = avoinna + " SULJETTU"

        return u'''%s\n  %s\n  %s''' % (
                k.nimi.ljust(40) + avoinna.ljust(25),
                k.yhteystiedot.ljust(38) + k.puhelinnumero.ljust(25),
                k.lyhyesti
                )
        
def main():
    argv = sys.argv
    if len(argv) < 2:
        print u'''kaenkky <hakusana> [avoinna]
        Skripti hakee kaenkky.comin tekstipalveluiden avulla känkkylöitä
        annetulla hakusanalla. Avoinna-avainsana rajaa tulokset avoinna
        oleviin.
        
        http://www.kaenkky.com/'''
    else:
        vain_avoinna = False
        if string.lower(argv[-1]) == 'avoinna':
            vain_avoinna = True
            argv.pop()
            
        hakusana = "+".join(argv[1:]).decode(charset)
        kaenkkylat = by_name(hakusana.encode("ISO-8859-1"))
        
        tuloksia = 0
        for kaenkkyla in kaenkkylat:
                if kaenkkyla.avoinna or not vain_avoinna:
                    print unicode(kaenkkyla).encode(charset)
                    tuloksia += 1
        if tuloksia == 0:
            print "Ei tulitikkua (12765)."

def by_name(name):
    conn = httplib.HTTPConnection("www.kaenkky.com")
    conn.request("GET", "/txt/?s=%s" % name)
    r = conn.getresponse()
    response_text = r.read().decode("ISO-8859-1")
    conn.close()
    
    if not r.status == 200:
        print u"Odottamaton HTTP-virhekoodi %d" % r.status
        return None
    else:
        kaenkkylat = []
        for row in response_text.split("\n"):
            s = row.split(';')
            if not len(row) == 0:
                s.pop()
                kaenkkylat.append(Kaenkkyla(*s))
        return kaenkkylat


if __name__ == '__main__':
    main()
