#!/bin/bash

pid=$(ps ax --no-headers | grep -E "java -jar nogi-profile.jar$" | awk '{printf $1}')
kill $pid
