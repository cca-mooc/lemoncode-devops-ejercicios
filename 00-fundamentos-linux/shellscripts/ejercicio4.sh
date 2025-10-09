#!/bin/bash

set -xue
# curl: curl -s https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# Página con patata: https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# ./ejercicio4.sh https://www.cocopot.es/blog/como-se-cultiva/guia-del-cultivo-de-la-patata?srsltid=AfmBOorJQ9bm2225jQi_Z-RHa9elntxmn528WqFv9LoQPNVYeue1chyP
# Página sin patatas: https://www.univision.com/estilo-de-vida/asi-se-vive-mejor-hogar/como-barrer-el-piso-sin-dejar-mugre-revelamos-trucos-y-tecnicas-que-si-funcionan
# ./ejercicio4.sh https://www.univision.com/estilo-de-vida/asi-se-vive-mejor-hogar/como-barrer-el-piso-sin-dejar-mugre-revelamos-trucos-y-tecnicas-que-si-funcionan

HAY_PATATAS=$(curl -s $1 | grep -io "patatas" | wc -l)

if (($HAY_PATATAS>0))
then
  echo "tiene patatas"
  exit 0
fi

echo "No tiene patatas"
