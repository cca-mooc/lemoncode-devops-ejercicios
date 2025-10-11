#!/bin/bash

set -ue

if [[ $# -lt 1 ]]; then
  echo "Error: es necesario especificar el término a buscar"> /dev/stderr
  exit 2
fi

if [[ $# -gt 1 ]]; then
  echo "Warn: sólo se acepta un término de busca, ignorando los demás"
fi

PAGINA='https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP'
FICHERO_TEMPORAL=./.ejercicio4.tmp

curl -s -o $FICHERO_TEMPORAL $PAGINA

# Envuelto en paréntesis para tenerlo como un número y no una cadena con espacios al principio
OCURRENCIAS=($(cat $FICHERO_TEMPORAL | grep -io $1 | wc -l))

if (($OCURRENCIAS==0))
then
  echo "No contiene \"$1\""
  exit 0
fi

echo "Contiene \"$1\""

if (($OCURRENCIAS == 1)); then
  echo "Aparece una vez"
else
  echo "Aparece $OCURRENCIAS veces"
fi

PRIMERA_OCURRENCIA=$(cat $FICHERO_TEMPORAL | grep -nio $1 | head -n1)
echo "Primera aparición en la línea: ${PRIMERA_OCURRENCIA%%:*}"

rm $FICHERO_TEMPORAL
