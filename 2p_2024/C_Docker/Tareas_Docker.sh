#!/bin/bash

docker build -t 2p_2024_castillo .

docker login --username=morenacastillo --password=46207361More

docker tag 2p_2024_castillo morenacastillo/2p_2024_castillo


docker push morenacastillo/2p_2024_castillo:latest


