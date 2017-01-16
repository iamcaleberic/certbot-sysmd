#!/bin/bash
LE=/opt/letsencrypt
cd $LE && ./certbot-auto renew --dry-run

