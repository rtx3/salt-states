#!/usr/bin/env bash
#-------------------------------------------------------------------------------
devs=( $( ls -1d /dev/{s,{u,x,}v}d{b..z}1 2>/dev/null ) )
#-------------------------------------------------------------------------------
if ! vgdisplay nova-volumes &>/dev/null
then
    pvcreate              ${devs[*]}
    vgcreate nova-volumes ${devs[*]}
fi
#-------------------------------------------------------------------------------
