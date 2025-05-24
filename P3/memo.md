# P3 Notions

## BGP-EVPN

BGP-EVPN, ou Ethernet VPN avec BGP, est une extension de BGP permettant de transporter non seulement des routes IP (comme le BGP classique), mais aussi des informations de réseau Ethernet, comme les adresses MAC
Il est utilisé pour connecter plusieurs réseaux locaux virtuels (VLAN) à travers un grand réseau IP (souvent via VXLAN)

## Road reflection

Le route reflection permet à un routeur BGP de redistribuer les routes iBGP à d'autres routeurs iBGP, ce qui évite d’avoir une connexion directe entre tous les routeurs

## VTEP

Un VTEP, ou VXLAN Tunnel Endpoint, est un point de passage qui transforme les paquets Ethernet locaux en paquets VXLAN sur IP, et inversement
Il permet de connecter des machines virtuelles à travers un réseau IP, comme si elles étaient sur le même switch

## VNI

Un VNI, ou VXLAN Network Identifier, est un numéro qui identifie chaque réseau virtuel dans un VXLAN

## Type 2 & type 3 roads

La difference entre les deux concerne les informations que BGP transporte pour VXLAN, la route de type 2 est utilisée pour dire où se trouve une machine dans le réseau tandis que la route de type 3 est utilisée pour indiquer quels VTEP participent à un réseau VXLAN donné et comment leur envoyer du trafic

## But de la topologie du sujet

Faire communiquer une multitude de machines via BGP-EVPN & VXLAN

---

# P3 Pratique

