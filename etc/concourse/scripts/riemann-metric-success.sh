#!/bin/bash

if [ "$SEND_TO_RIEMANN" = true ]
then
  testresult=100 #test ok, will be shown as 100% uptime in Grafana
  testmetric="$CF_DEPLOYMENT_NAME.abacus.uptime $testresult $(date +%s)"

  echo "Reporting metric: $testmetric to $RIEMANN_ADDRESS"
  timeout_in_sec=30
  echo $testmetric | nc -q $timeout_in_sec $RIEMANN_ADDRESS $RIEMANN_PORT
  exit 0 
fi