#!/bin/bash
source <(curl -sLo- "https://git.io/Je0t7")

CURRENT_OS_VERSION=$(lsb_release -r -s)
REQUIRED_OS_VERSION='20.04'

NULL='/dev/null'
