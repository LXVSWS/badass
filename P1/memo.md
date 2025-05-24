# Global notions

## GNS3

GNS3, ou Graphical Network Simulator-3, est un simulateur de réseaux qui permet de créer et tester des réseaux sans utiliser de matériel physique
Il fonctionne selon un modèle client-serveur : le client est l'interface graphique avec laquelle l'utilisateur envoie les commandes au serveur, qui exécute la simulation et renvoie les résultats au client

## BGP

BGP, ou Border Gateway Protocol, est un protocole de routage externe utilisé pour échanger des informations entre les grands réseaux qui composent Internet, appelés systèmes autonomes (ou AS pour Autonomous Systems)
L'objectif de BGP est de choisir le meilleur chemin pour acheminer les données à travers différents réseaux

## Layer 2 & layer 3

Ils font partie du modèle OSI (qui décrit comment les données circulent sur un réseau)
Layer 2 = Communication sur un même réseau (adresses MAC)
Layer 3 = Communication entre réseaux différents (adresses IP)

---

# P1 Notions

## Packet routing software

C'est un ensemble de programmes (ex : FRRouting) qui gère la façon dont les données circulent sur un réseau
Il utilise une table de routage pour déterminer les meilleurs chemins pour le routage des paquets de données

## BGPD service

BGPD, ou Border Gateway Protocole Daemon, est un processus qui implemente le protocole BGP sur un routeur ou un serveur
Il recoit et envoie les routes et met a jour la table de routage

## OSPFD service

OSPFD, ou Open Shortest Path First Daemon, est un processus qui implemente le protocole OSPF sur un routeur ou un serveur
OSPF est un protocole de routage interne, utilisé pour trouver automatiquement le chemin le plus court entre les routeurs a l'interieur d'un réseau local

## Routing engine service (IS-IS)

IS-IS, ou Intermediate System to Intermediate System, est un protocole de routage interne qui permet aux routeurs de trouver automatiquement le meilleur chemin pour envoyer les données dans un grand réseau
Il est moins courant que OSPF, mais très utilisé dans les grands réseaux

## Busybox

Busybox est un programme tout-en-un qui implémente un grand nombre de commandes UNIX dans le meme executable, ce qui le rend léger et parfait pour les environnements avec peu de mémoire ou d’espace disque

---

# P1 Pratique

Nous pouvons voir les services actifs demandés via un simple `ps` dans chaque routeur concerné.