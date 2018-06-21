#!/bin/bash
# Created 21.06.2018 by sanoma.com

set -x

aws cloudformation delete-stack \
    --stack-name eks-experimental-ilya-tfstate-dev
