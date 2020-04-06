#!/bin/sh


cd ServiceApp/server/


# Start environment
docker-compose -f docker-compose.yml -f docker-compose-sim.yml -f docker-compose-tools.yml up


