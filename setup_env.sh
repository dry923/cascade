#!/usr/bin/env bash

echo "Setting up my-ripsaw and backpack environments"

kubectl create namespace backpack

kubectl apply -f ripsaw/resources/namespace.yaml
kubectl apply -f ripsaw/deploy
kubectl apply -f ripsaw/resources/crds/ripsaw_v1alpha1_ripsaw_crd.yaml
kubectl apply -f ripsaw/resources/operator.yaml
kubectl wait --for=condition=Initialized pods -l name=benchmark-operator --namespace my-ripsaw
kubectl wait --for=condition=Ready pods -l name=benchmark-operator --namespace my-ripsaw

