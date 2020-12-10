oc apply -f servicemesh/service-mesh.yml

oc apply -f bookinfo/bookinfo-ns.yml

oc apply -f servicemesh/service-mesh-roll.yml

oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/istio/maistra-1.1/samples/bookinfo/platform/kube/bookinfo.yaml

oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/istio/maistra-1.1/samples/bookinfo/networking/bookinfo-gateway.yaml

export GATEWAY_URL=$(oc -n bookretail-istio-system get route istio-ingressgateway -o jsonpath='{.spec.host}')

oc apply -n bookinfo -f bookinfo/policy.yml

oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/istio/maistra-1.1/samples/bookinfo/networking/destination-rule-all-mtls.yaml


