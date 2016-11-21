#!/bin/bash

echo 'Downloading NS2 source'
curl -L https://raw.githubusercontent.com/poz1/NS2/master/ns-allinone-2.35.tar.gz -o ns-allinone-2.35.tar.gz
echo 'Downloading NS2 patch'
curl -L https://raw.githubusercontent.com/poz1/NS2/master/ns-allinone-2.35-patch.zip -o ns-allinone-2.35-patch.zip

echo 'Unzipping...'
tar xvzf ns-allinone-2.35.tar.gz
tar xvzf ns-allinone-2.35-patch.zip -C ns-allinone-2.35

cd ns-allinone-2.35

chmod +x install64

echo "Unzipping complete"

echo "Starting installation..."
./install64
echo "Installation complete"

echo "Installing paths"

echo "export PATH=$PATH:`pwd`/ns-2.35:`pwd`/nam-1.15" >> ~/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/otcl-1.14:`pwd`/lib" >> ~/.bash_profile
echo "export TCL_LIBRARY=$TCL_LIBRARY:`pwd`/tcl8.5.10/" >> ~/.bash_profile
source ~/.bash_profile

echo 'Path installation complete. Run ns or nam'

echo 'cleaning up...'

cd ..
rm ns-allinone-2.35.tar.gz
rm ns-allinone-2.35-patch.zip

echo 'Installation complete'
