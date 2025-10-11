#!/bin/bash

set -ue

if [[ $# -lt 2 ]]; then
  echo "Error: es necesario especificar la URL y el término a buscar"> /dev/stderr
  exit 2
fi

if [[ $# -gt 2 ]]; then
  echo "Warn: sólo se acepta un término de busca y la URL, ignorando los demás"
fi

PAGINA=$1
BUSQUEDA=$2
FICHERO_TEMPORAL=./.ejercicio5.tmp

curl -s -o $FICHERO_TEMPORAL $PAGINA

# Envuelto en paréntesis para tenerlo como un número y no una cadena con espacios al principio
OCURRENCIAS=($(cat $FICHERO_TEMPORAL | grep -io $BUSQUEDA | wc -l))

if (($OCURRENCIAS==0))
then
  echo "No contiene \"$BUSQUEDA\""
  exit 0
fi

echo "Contiene \"$BUSQUEDA\""

if (($OCURRENCIAS == 1)); then
  echo "Aparece una vez"
else
  echo "Aparece $OCURRENCIAS veces"
fi

PRIMERA_OCURRENCIA=$(cat $FICHERO_TEMPORAL | grep -nio $BUSQUEDA | head -n1)
echo "Primera aparición en la línea: ${PRIMERA_OCURRENCIA%%:*}"

rm $FICHERO_TEMPORAL
