# K8s Dataflows: Cloud-native data processing workflows with Argo Workflows and Events

Demo repository for data2day 2022 talk on cloud-native data processing workflows with Argo workflows and events.

## Setup

```bash
# install Argo Workflows
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.3.9/install.yaml

# install Argo Events
kubectl create namespace argo-events
kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/v1.7.2/manifests/namespace-install.yaml
```

## Maintainer

M.-Leander Reimer (@lreimer), <mario-leander.reimer@qaware.de>

## License

This software is provided under the MIT open source license, read the `LICENSE`
file for details.
