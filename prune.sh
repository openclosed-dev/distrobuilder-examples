#!/bin/bash

lxc image list --format csv -c l | xargs lxc image delete
lxc list --format csv -c n | xargs lxc delete -f
