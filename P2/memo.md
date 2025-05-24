# P2 Notions

## VXLAN

VXLAN, ou Virtual eXtensible LAN, est une technologie qui permet de connecter des machines situées sur plusieurs réseaux différents comme si elles étaient dans un seul réseau local virtuel
À l’inverse, le VLAN sert uniquement à diviser un réseau local physique en plusieurs réseaux logiques séparés

## Switch

Un switch est un appareil utilise pour connecter plusieurs appareils dans un meme reseau local (LAN) et faire circuler les données

## Bridge

Un bridge est un logiciel qui permet de relier deux interfaces réseau virtuelles ou physiques

## Broadcast & multicast

Le broadcast envoie un message a tous les appareils du reseau local, tandis que le multicast envoie le message a un groupe specifique d'appareils et seulement ceux inscrits au groupe recoivent le message

## But de la topologie du sujet

Faire communiquer deux machines connectees a deux routeurs differents grace a la technologie VXLAN

---

# P2 Pratique

Les interfaces de chaque routeur seront configurés via le fichier `frr.conf`, le champ `ip pim` sera omis dans la configuration statique car le service ne sera pas actif dans le daemons.

Nous pouvons entrer directement les commandes `sh` associées à chaque interface dans ce fichier de configuration.

## Static

- **Pas de protocole de gestion dynamique :** 

Aucun échange de messages PIM ou IGMP entre routeurs.

Tout le trafic envoyé à l’adresse multicast (ex : 239.1.1.1) est diffusé à tous les membres du groupe, qu’ils en aient besoin ou non.

- **Pas d’optimisation :** 

Tous les routeurs/noeuds reçoivent le trafic multicast, même s’ils n’ont pas de clients intéressés.

*Lancer un wireshark pour voir le traffic IPv4/ICMP sur le lien.*

- **VxLAN ID (VNI)**

Visible sur le groupe Virtual eXtensible LAN du sniffer ***VXLAN Network Identifier (VNI): 10***.

## Dynamic

- **Gestion dynamique** via le Protocole PIM actif : 

Les routeurs échangent des paquets PIMv2 (Hello World, ...) pour construire dynamiquement l’arbre de distribution multicast.

*Un routeur est inscrit avec `ìp pim`, nous avons fait cela sur les interfaces `vxlan10` et `eth0` de chaque routeur.*

- **Optimisation du trafic** : 

Seuls les routeurs/noeuds ayant des membres IGMP inscrits reçoivent le trafic multicast.

*Ils sont visible ici sous wireshark via le filtre `igmp` sous le protocole `IGMPv3`.*

- **Gestion dynamique des membres** : 

L’arbre multicast s’adapte automatiquement selon la présence ou l’absence de membres, visibles sous `vtysh`

``` vtysh
    show ip pim interface
    show ip pim neighbor
```

*Pour voir les paquets avec le VxLAN on peut utiliser le filtre `vxlan` et utiliser un ping entre les voisins pour vérifier leur bonne connexion.*

