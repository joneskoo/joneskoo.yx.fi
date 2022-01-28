#!/bin/sh

set -e

# After github actions has built the site...

echo "Deploying github.com/joneskoo/joneskoo.yx.fi branch public to caddy-01.hez.yx.fi:/www/joneskoo.yx.fi"
ssh caddy-01.joneskoo.github.beta.tailscale.net bash -c "'
    set -e
    rm -rf /tmp/joneskoo.yx.fi
    mkdir -p /tmp/joneskoo.yx.fi
    curl -L -s https://github.com/joneskoo/joneskoo.yx.fi/archive/public.tar.gz \
        | tar zx -C /tmp/joneskoo.yx.fi -zx --strip-components=1
    rsync -a --delete /tmp/joneskoo.yx.fi/ /www/joneskoo.yx.fi/
    '"
