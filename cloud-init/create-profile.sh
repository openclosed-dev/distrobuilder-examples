#!/bin/bash

lxc profile create cloud
lxc profile edit cloud < profile.yaml
lxc profile show cloud
