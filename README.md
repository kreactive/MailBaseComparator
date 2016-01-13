#Mail base comparateur

##Intro 

L'objectif est de comparer 2 bases d'emails pour connaitre le nb de mail commun et le nb de mail spécifique à chaque base **SANS DIVULGUER SA BASE DE MAIL**.

Cela permet de payer en fonction du nb de mail que l'on acquière VRAIEMENT

## Garantie

Cet outil n'installe pas de librairie ou de logiciel sur la machine. Il n'utilise que des outils unix standards, garantissant ainsi qu'aucune information n'est transmisse "en douce"

## Principe de fonctionnement

On encode sa base de mail dans un format garantissant :
	
	- que chaque mail donne une chaine de caractère unique
	- que la chaine de caractère ne puisse pas permettre de retrouver le mail d'origine (en tout cas dans un coût prohibitif)
	
##Usage

###De notre coté :
on produit un fichier d'export contenant un mail par ligne 

ex: 

	f.masion@kreactive.com
	f.masion@digischool.com
	...etc
	
	
Bien entendu on ne veux pas fournir ce fichier au partenaire ;)

donc on va l'encoder avec le script `encode.sh` :

	./encode.sh monfichierDeMail.txt monFichierEncode
		
le fichier encodé doit ressembler à çà :

	8a525f7794733337c535c10559af0f81a05ec1ac
	11ff8269968c410595a5086f3e9e9fa0f43c3181
	...etc
	
Le fichier encodé peux être librement transmis au partenaire. **Il n'est pas possible de revenir au mails de départ**	

###De l'autre coté :

On fournit au partenaire 

- le script encode.sh
- le fichier encodé
- le script compareMail.sh

Le partenaire fait la même chose avec son fichier de mails pour obtenir `sonFichierEncode`

on applique la commande 

	./compareMail.sh monFichierEncode sonFichierEncode
	
On obtient un résultat qui ressemble à cela :

	monFichierEncode: 254 uniques
	sonFichierEncode: 178 uniques
	Common: 15432




