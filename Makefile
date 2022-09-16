GITHUB_USER ?= lreimer

prepare-gke-cluster:
	@gcloud config set compute/zone europe-west1-b
	@gcloud config set container/use_client_certificate False

create-gke-cluster:
	@gcloud container clusters create gke-k8s-dataflows --num-nodes=3 --enable-autoscaling --min-nodes=3 --max-nodes=7 --cluster-version=1.22
	@kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$$(gcloud config get-value core/account)
	@kubectl cluster-info

bootstrap-gke-flux2:
	@flux bootstrap github \
		--owner=$(GITHUB_USER) \
  		--repository=k8s-dataflows \
  		--branch=main \
  		--path=./k8s/gke-cluster \
		--components-extra=image-reflector-controller,image-automation-controller \
		--read-write-key \
  		--personal

delete-gke-cluster:
	@gcloud container clusters delete gke-k8s-dataflows --async --quiet
