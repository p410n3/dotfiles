#!/bin/bash

while [ 1 ];  do
  # Battery
  _battery=`acpi | grep -o '...%'`

  # Time
  _time=`date | grep -o '..:..:..'`

  xsetroot -name "$_battery | $_time"
  sleep 0.1;
done
