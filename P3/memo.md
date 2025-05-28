# P3 Notions

## BGP-EVPN (RFC 7432)

BGP-EVPN, ou Ethernet VPN avec BGP, est une extension de BGP permettant de transporter non seulement des routes IP (comme le BGP classique), mais aussi des informations de réseau Ethernet, comme les adresses MAC
Il est utilisé pour connecter plusieurs réseaux locaux virtuels (VLAN) à travers un grand réseau IP (souvent via VXLAN)

## Route/Road reflection (=RR)

Le route reflection permet à un routeur BGP de redistribuer les routes iBGP à d'autres routeurs iBGP, ce qui évite d’avoir une connexion directe entre tous les routeurs

## VTEP (Leafs)

Un VTEP, ou VXLAN Tunnel Endpoint, est un point de passage qui transforme les paquets Ethernet locaux en paquets VXLAN sur IP, et inversement
Il permet de connecter des machines virtuelles à travers un réseau IP, comme si elles étaient sur le même switch

## VNI (VxLAN Network Identifier)

Un VNI, ou VXLAN Network Identifier, est un numéro qui identifie chaque réseau virtuel dans un VXLAN

## Type 2 & type 3 roads

La difference entre les deux concerne les informations que BGP transporte pour VXLAN, la route de type 2 est utilisée pour dire où se trouve une machine dans le réseau tandis que la route de type 3 est utilisée pour indiquer quels VTEP participent à un réseau VXLAN donné et comment leur envoyer du trafic

## But de la topologie du sujet

Faire communiquer une multitude de machines via BGP-EVPN & VXLAN, en découvrant les notions de route reflexion dynamique associées.

---

# P3 Pratique

Comme démontré dans le sujet dans un routeur démarré seul sans host avec `vtysh` :
- Nous pouvons voir sa visibilité avec `sh ip route` avec plus de détails.

- Sur son voisinage il ne devrait y avoir qu'une seule route sur `sh bgp summary`

- De même sur `sh bgp l2vpn evpn` nous devrions retrouver que les routes préconfigurées de type 3, tant que les machines `host` ne sont pas démarrés

- Une fois que nous la démarrons elle apparaitra dynamiquement avec son adresse MAC en route de type 2 généré par notre RR. 

- Nous pourrons voir l'apprentissage de tout le réseau dynamiquement au fur et à mesure que les VTEPs et routeurs s'activent.

Par défaut nous n'avons pas mis d'adresse IP sur les machines `host`mais elles peuvent être configurées via les commandes `ip addr add <IP>/<MASK> dev <IF>` et consultées avec un `ip addr show` ou `ifconfig`.

Un simple ping entre les host nous permettra de voir que les adresses et les routes sont bien fonctionnelles, il faut bien sur que les IP soient ajoutés sur les interfaces en lien avec les routeurs, et que les masques et IP soient sur le même subnet entre les différents host pour qu'ils puissent dialoguer. (20.1.1.X/24 par exemple) 

Nous pourrons vérifier les trames et protocoles ICMP / OSPF / ARP / BGP via les inspecteurs de packets.
