#!/bin/bash

docker exec -it Telegraf /bin/sh -c "apk update && apk add speedtest-cli"
