# Cloud-native data processing workflows with Argo Workflows and Events

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

## Workflow Demo

```bash
# connect to server locally and open UI
kubectl -n argo port-forward deployment/argo-server 2746:2746
open http://localhost:2746

# submit simple hello world workflow
argo submit -n argo --watch workflows/hello-world.yaml
argo list -n argo
argo get -n argo @latest
argo logs -n argo @latest
```

## Events Demo

```bash
cd events

kubectl apply -n argo-events -f eventbus-native.yaml
kubectl apply -n argo-events -f eventsource-webhook.yaml
kubectl apply -n argo-events -f workflow-rbac.yaml
kubectl apply -n argo-events -f sensor-rbac.yaml
kubectl apply -n argo-events -f sensor-webhook.yaml

kubectl -n argo-events port-forward $(kubectl -n argo-events get pod -l eventsource-name=webhook -o name) 12000:12000
curl -d '{"message":"data2day demo webhook"}' -H "Content-Type: application/json" -X POST http://localhost:12000/example

kubectl -n argo-events get workflows
```

## Maintainer

M.-Leander Reimer (@lreimer), <mario-leander.reimer@qaware.de>

## License

This software is provided under the MIT open source license, read the `LICENSE`
file for details.
