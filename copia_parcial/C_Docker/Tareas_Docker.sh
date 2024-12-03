#!/bin/bash


docker build -t 2p_2024_castillo_prueba .


docker login --username=morenacastillo --password=46207361More

docker tag 2p_2024_castillo_prueba morenacastillo/2p_2024_castillo_prueba


docker push morenacastillo/2p_2024_castillo_prueba:latest
