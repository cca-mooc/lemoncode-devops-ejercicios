#!/bin/bash

set -xue
# curl: curl -s https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# Página con patata: https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# ./ejercicio4.sh https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# Página sin patatas: https://www.univision.com/estilo-de-vida/asi-se-vive-mejor-hogar/como-barrer-el-piso-sin-dejar-mugre-revelamos-trucos-y-tecnicas-que-si-funcionan
# ./ejercicio4.sh https://www.univision.com/estilo-de-vida/asi-se-vive-mejor-hogar/como-barrer-el-piso-sin-dejar-mugre-revelamos-trucos-y-tecnicas-que-si-funcionan

if [[ $# -lt 1 ]]; then
  echo "Error: es necesario especificar el término a buscar"> /dev/stderr
  exit 2
fi

if [[ $# -gt 1 ]]; then
  echo "Warn: sólo se acepta un término de busca, ignorando los demás"
fi

PAGINA='https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP'

OCURRENCIAS=$(curl -s $PAGINA | grep -io $1 | wc -l)

if (($OCURRENCIAS>0))
then
  echo "Contiene \"$1\""
  exit 0
fi

echo "No contiene \"$1\""
