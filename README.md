# tekton-odm
Run OpenDroneMap (https://www.opendronemap.org/) using TetktonCD-Pipeline Tasks/Pipelines (https://github.com/tektoncd/pipeline)

# Prerequisites

A Kubernetes Cluster

note: Minikube or KIND will also work

minikube:  https://kubernetes.io/docs/tasks/tools/install-minikube/

kind: https://github.com/kubernetes-sigs/kind

# Setup

```
make setup
```

# Run a job

```
make create-new-taskrun
```

# Use different input datasets

edit 03_datasets-pipelineresources/01_dataset-aukerman-pipelineresource.yaml#L11

do `kubectl apply -f 03_datasets-pipelineresources/01_dataset-aukerman-pipelineresource.yaml`

then `make create-new-taskrun`

(add more images to your dataset git repo and then create a new taskrun to get update map)
