# Make it
./dind/dind-apply.sh

#wait for it to be ready
ip=""
while [ -z $ip ]; do
  echo "Waiting for external IP"
    ip=$(kubectl get service -n gary dind -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  [ -z "$ip" ] && sleep 10
done
echo 'Found external IP: '$ip

#Copy the certs
./dind/dind-copycerts.sh

#Set up docker context
./dind/dind-context.sh $ip

docker info