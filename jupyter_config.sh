HOMEPATH=$HOME
INSTALLPATH=$HOME
JUPYTER_CFG=${HOMEPATH}/.jupyter/
JUPYTER_CERT=${JUPYTER_CFG}/cert.pem
JUPYTER_KEY=${JUPYTER_CFG}/key.key

PASSWORD=$(python jupyter_passwd.py)

mkdir ${JUPYTER_CFG}
openssl req -x509 -nodes -days 365 -newkey rsa:1024 \
        -keyout ${JUPYTER_KEY} -out ${JUPYTER_CERT}

sed -e"s:_HOMEPATH_:${HOMEPATH}:g" \
    -e"s:_INSTALLPATH_:${INSTALLPATH}:g" \
    -e "s/_PASSWORD_/${PASSWORD}/g" \
     jupyter_notebook_config.in > ${JUPYTER_CFG}/jupyter_notebook_config.py

mkdir ${HOME}/workspace
