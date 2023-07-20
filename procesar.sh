#!/bin/bash

IMAGENES=$(ls | grep -E "^[A-Z][a-z]+\\.jpg$")
for imagen in $IMAGENES; do
  convert "$imagen" -resize 512x512 "$imagen"
done