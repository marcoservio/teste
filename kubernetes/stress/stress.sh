#!/bin/bash
for i in {1..10000}; do
  curl --silent http://localhost/WeatherForecast
  sleep 0.1
done
