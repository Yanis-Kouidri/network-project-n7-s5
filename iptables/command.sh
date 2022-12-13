# Commandes iptable :

# Connecter la dmz et la zone privée :
sudo iptables -I DOCKER-ISOLATION-STAGE-2 -o br-cd9b849ae2de -i br-729e43e6a477 -j ACCEPT
sudo iptables -I DOCKER-ISOLATION-STAGE-2 -o br-729e43e6a477 -i br-cd9b849ae2de -j ACCEPT

# Empecher l'accès à internet depuis la zone privé :
sudo iptables -I DOCKER-ISOLATION-STAGE-2 -o wlp0s20f3 -i br-cd9b849ae2de -j DROP
sudo iptables -I DOCKER-ISOLATION-STAGE-2 -o br-cd9b849ae2de -i wlp0s20f3 -j DROP

# Faire du port forwarding sur tout ce qui arrive sur le port 53 vers le serveur DNS externe
sudo iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT --to-destination 172.20.1.2

