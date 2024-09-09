#!/bin/bash

df -h / | grep -v 'Filesystem' | awk '{ print $5 }'

