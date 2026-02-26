#!/bin/bash

while [ 1 ];  do
  # Battery
  _battery=`acpi | grep -o '...%'`

  # Time
  _time=`date +'%R'`

  xsetroot -name "$_battery | $_time"
  sleep 1m;
done
