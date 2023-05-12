echo Copying certs
#Get pod name
pod=$(kubectl get pod -n gary -l app=dind -o jsonpath={.items[0].metadata.name})
echo pod name = $pod

kubectl cp -n gary $pod:certs/client ./temp/client