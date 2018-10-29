#!/bin/bash

#choix du mode
echo "Script de controle des canaux de communications Shell (By AGI Vincent)"
echo "Choix du mode (serveur/client) : "
read choix
if [ $choix == "client" ]
then
# mode client
	if [ $# == 2 ] # test si il y a bien deux parametres (l'ip et le port)
	then
	echo "l'ip de connexion est : $1"
	echo "le port est : $2"
	echo "êtes vous sûr des informations fournient ? (yes/no): "
	read reponseModeClient
		if [ $reponseModeClient == "yes" ] # les informations sont validées
		then
		clear
		echo "connexion en mode client établie"
		nc $1 $2 # connexion avec les informations
		else
			echo "annulation de la connexion" # les informations ne sont pas validées
		fi
	else
		echo "il doit y avoir 2 parametres : l'adresse IP et le numero de port" # nombres de parametres incorrects
	fi	
fi
if [ $choix == "serveur" ]
then
# mode serveur
	if [ $# == 2 ] # test si il y a bien deux parametres (l'ip et le port)
	then
	echo "l'ip de connexion est : $1"
	echo "le port d'écoute est : $2"
	echo "êtes vous sûr des informations fournient ? (yes/no): "
	read reponseModeServeur
		if [ $reponseModeServeur == "yes" ] # les informations sont validées
		then
		clear
		echo "connexion en mode écoute établie"
		nc -l -p $2 # connexion avec les informations
		else
			echo "annulation de la connexion" # les informations ne sont pas validées
		fi
	else
		echo "il doit y avoir 2 parametres : l'adresse IP et le numero de port" # nombres de parametres incorrects
	fi
fi
#else
#	echo "erreur de choix. Deux options client ou serveur"