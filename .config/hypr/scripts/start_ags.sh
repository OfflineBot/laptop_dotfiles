#!/bin/bash

WAITER=0.025

echo "0"
ags &
sleep $WAITER
echo "1"
ags -t "bar-0" &
sleep $WAITER
echo "2"
ags -t "bar-1" &
sleep $WAITER
echo "3"
ags -t "bar-2" &
sleep $WAITER
echo "4"


