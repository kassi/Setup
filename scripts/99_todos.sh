#!/usr/bin/env bash
SCRIPT_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

mdless -P $SCRIPT_PATH/../data
