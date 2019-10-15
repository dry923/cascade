#!/usr/bin/env bash

echo "Deleting my-ripsaw and backpack services and namespaces"

if [[ `kubectl get namespaces my-ripsaw` ]]
then
  kubectl delete all --all -n my-ripsaw
  kubectl delete namespace my-ripsaw
fi

if [[ `kubectl get namespaces backpack` ]]
then
  kubectl delete all --all -n backpack
  kubectl delete namespace backpack
fi
