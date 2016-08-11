ANACONDA_FILE=Anaconda3-4.1.1-Linux-x86_64.sh
ANACONDA_PATH=http://repo.continuum.io/archive/${ANACONDA_FILE}
ANACONDA_SHA=4f5c95feb0e7efeadd3d348dcef117d7787c799f24b0429e45017008f3534e55

if [ ! -f ${ANACONDA_FILE} ]; then
    wget ${ANACONDA_PATH}
fi

CURR_SHA=$( sha256sum ${ANACONDA_FILE} | cut -d' ' -f1 )

if [ "${CURR_SHA}" != "${ANACONDA_SHA}" ]; then
    echo "Checksum don't match. Removing file."
    rm ${ANACONDA_FILE}
    exit 1
fi

chmod u+x ${ANACONDA_FILE}
./${ANACONDA_FILE} -b #-p${INSTALL_PATH} default to $HOME
