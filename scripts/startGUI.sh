#! /bin/bash
BASEDIR=$(dirname $0)

FORGE_SERVER=$HOME/forge-1.12.2-14.23.5.2768-universal.jar
cd $SNAP_USER_DATA
EULA=$(<eula.txt)

if [ "$#" -ne 1 ]; then
    echo "HELP"
    echo "Use: ic2 command"
    echo "Commnads list:"
    echo "start - run the industrial craft 2 server"
    echo "eula - show eula license"
    echo "accept - accept eula license"
fi

if [ ! -f $FORGE_SERVER ]; then
    cp -r $SNAP/serverImage/* $HOME/
fi

if [ "$1" == "start" ]; then 
    echo "try start the industrial craft 2 server"
    
    if [[ $EULA == *"=false"* ]]; then
        echo "it is first run. you nead to run 'ic2 accept' for accept eula license or 'ic2 eula' for show license"
        exit 1
    fi
    
    java -Xms128m -Xmx3500m -jar "$FORGE_SERVER"
    
fi

if [ "$1" == "eula" ]; then 
    echo $EULA
fi 

if [ "$1" == "accept" ]; then 
    sed -ie s/false/true/g eula.txt
fi 


