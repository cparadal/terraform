# Google Kubernetes Engine Cluster

## Export GCP credentials
```
export GOOGLE_CLOUD_KEYFILE_JSON={{path}}
```

## Initialise, plan and apply
```
terraform init
terraform plan
terraform apply

## Get cluster credentials
```
gcloud container clusters get-credentials gke-cluster-lab --zone=us-east1
```

