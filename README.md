olution
### preparations
1. **kubectl installation:**
  - `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
  - `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
2. **minikube installation:**
  - `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
  - `sudo install minikube-linux-amd64 /usr/local/bin/minikube`
2. **minikube installation:**
  - `curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash`
3. **build docker image and make it accessible to minikube:**
  - `eval $(minikube docker-env)`
  - `docker build -t go-app .`


### docker
1. `docker-compose up -d`
You can find screenshots under `screenshots/docker` folder.

### minikube-helm
1. **redis installation:**
  - `helm repo add bitnami https://charts.bitnami.com/bitnami`
  - `helm install redis --set auth.enabled=false --set fullnameOverride="redis" oci://registry-1.docker.io/bitnamicharts/redis`
2. **app installation:**
  - `helm install go-app go-app/`
You can find screenshots under `screenshots/minikube-helm` folder.

### agones
1. **agones platform installation:**
  - `kubectl create namespace agones-system`
  - `kubectl apply --server-side -f https://raw.githubusercontent.com/googleforgames/agones/release-1.34.0/install/yaml/install.yaml`
2. **gameserver installation:**
  - `kubectl create -f https://raw.githubusercontent.com/googleforgames/agones/main/examples/xonotic/gameserver.yaml`
3. Download [xonotic client](https://xonotic.org/download/) and connect to the gameserver.
You can find screenshots and log from the gameserver under `screenshots/agones` folder.
