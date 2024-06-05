#!/bin/bash
#
# Versão 1.0 ping.remote.sh
#
# Descrição:
#
# Autor: Marcos Lima

#testando subir tudo pro github

#IP utilizado para teste do ping
ipdestino="192.168.15.1"
#total de pacotes enviados para o teste de ping
pacotes=4

latencia_minima=0
latencia_media=0
latencia_maxima=0

 [ $# -ne 3 ]  && {

	 echo "Você precisa passar pelo menos 3 parâmetros
 		ex: ./ping.remote.sh -min 4 192.168.15.101
		"
	exit 0;

}

	case "$1" in

		-min) latencia_minima=1 ;;

		-med) latencia_media=1 ;;

		-max) latencia_maxima=1 ;;

		*) 
		   if test -n "$1"
                    then
			    echo "Opção inválida: $1"
			    exit 1
		     fi 

	esac

	# Executa o comando ping para o destino
	ping=$(ping -c$2 $3)

	#Latência mínima
	test "$latencia_minima" = 1 && echo "$ping"| tail -n1|cut -d\/ -f4| cut -d" " -f3
	test "$latencia_media" = 1 && echo "$ping"| tail -n1|cut -d\/ -f5
	test "$latencia_maxima" = 1 && echo "$ping"| tail -n1|cut -d\/ -f6

	# Imprime na tela as informações da latência	
	#echo "Latência Mínima: $min"
	#echo "Latência Médiaa: $med"
	#echo "Latência Máxima: $max"


