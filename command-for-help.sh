#Virtual box commands

VBoxManage list -l hostonlyifs

VBoxManage hostonlyif remove vboxnet1 


# OPEN MATCH starts kubernati cluster

# Create a GKE Cluster 
make activate-gcp-apis
make create-gke-cluster 

# or Create a Minikube Cluster (requires VirtualBox)
make create-mini-cluster 

# Step 2: Download helm and install Tiller in the cluster
make push-helm
# Step 3: Build and Push Open Match Images to gcr.io
make push-images -j$(nproc)
# Install Open Match in the cluster.
make install-chart

# Create a proxy to Open Match pods so that you can access them locally.
# This command consumes a terminal window that you can kill via Ctrl+C.
# You can run `curl -X POST http://localhost:51504/v1/frontend/tickets` to send
# a DeleteTicket request to the frontend service in the cluster.
# Then try visiting http://localhost:3000/ and view the graphs.
make proxy

make proxy-ui
# http://localhost:51500 


# -------------SETUP FROM CLOUD---------------------
# Create a cluster role binding (if using minikube)
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:default

# Create a namespace to place all the Open Match components in.
kubectl create namespace open-match

# Install the core Open Match services and monitoring services.
kubectl apply -f https://open-match.dev/install/v0.6.0/yaml/install.yaml --namespace open-match

kubectl port-forward --namespace open-match service/om-demo 51507:51507


# -----------------CLEANUP-------------------------------

kubectl delete namespace open-match

Teardown
make delete-mini-cluster
make delete-gke-cluster


# Teardown the install
make delete-chart

# Reset workspace
make clean

----------------------------------------------------------------------EXTRA
make build-demo-first-match-image build-mmf-go-deathmatch-image build-evaluator-go-simple-image


kubectl port-forward --namespace open-match service/om-demo 51507:51507


curl -X POST "http://localhost:51500/v1/frontend/tickets" -H "accept: application/json" -H "Content-Type: application/json" -d '{"ticket":{"id":"player#007","properties":{"fields":{"MMR":2456}}}}'

