docker context rm -f dind
docker context create dind --description "docker in k8s" --docker "host=tcp://$1:443,ca=temp\client\ca.pem,cert=temp\client\cert.pem,key=temp\client\key.pem,skip-tls-verify=1"
docker context use dind