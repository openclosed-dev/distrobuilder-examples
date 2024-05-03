#!/bin/bash

lxc list --format csv -c n | xargs -I {} lxc delete -f {}
lxc image list --format csv -c l | xargs -I {} lxc image delete {}
