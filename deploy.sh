#!/bin/sh

GREEN='\033[0;32m'  # green colour text
NC='\033[0m'        # no colour text

echo ${GREEN}Pushing and deploying latest code...${NC}
git push heroku master -f

echo ${GREEN}Restarting server...${NC}
heroku restart
