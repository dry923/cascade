#!/usr/bin/env bash
set -x

echo "Running stockpile and uploading to ES"

backpack_name=`kubectl -n backpack get pods -l name=backpack -o name | awk -F '/' '{print $2}'`

echo "Backpack pod name is: "$backpack_name

`kubectl -n backpack cp cascade/my_config $backpack_name:/tmp/kubeconfig`

`kubectl -n backpack -it exec $backpack_name -- python3 stockpile-wrapper-always.py -s marquez.perf.lab.eng.rdu2.redhat.com -p 9200 -u No`

