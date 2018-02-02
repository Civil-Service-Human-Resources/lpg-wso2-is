#!/usr/bin/env bash

REPO=${1}
SERVICE=${2}

#clone ansible repository and set application version
git clone https://github.com/Civil-Service-Human-Resources/${REPO}.git
cd ${REPO}
echo "$SERVICE: $TRAVIS_COMMIT" > group_vars/all/${SERVICE}

#run ansible
sudo pip install ansible || exit 2
chmod +x envVar.py || exit 2
echo ${mvp_test} | base64 -d | ./envVar.py > mvp_test || exit 2
chmod 600 mvp_test || exit 2
echo ${vaultpassword} | base64 -d | ./envVar.py > vault.yml || exit 2
cat ssh_test.conf > ~/.ssh/config || exit 2
ansible-playbook site.yml -i environments/test -t ${SERVICE} || exit 2
rm -f mvp_test
rm -f vault.yml


