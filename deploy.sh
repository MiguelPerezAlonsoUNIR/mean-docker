#!/bin/bash

echo "=========================================="
echo "  Despliegue aplicación MEAN en Kubernetes"
echo "=========================================="

NAMESPACE="fintech"

echo "Creando namespace..."
kubectl apply -f k8s/namespace.yaml

echo "Aplicando ConfigMap..."
kubectl apply -f k8s/configmap.yaml

echo "Aplicando Secret..."
kubectl apply -f k8s/secret.yaml

echo "Desplegando MongoDB (StatefulSet)..."
kubectl apply -f k8s/mongodb-statefulset.yaml

echo "Desplegando Backend..."
kubectl apply -f k8s/backend-deployment.yaml

echo "Desplegando Frontend..."
kubectl apply -f k8s/frontend-deployment.yaml

echo "Creando Services (LoadBalancer)..."
kubectl apply -f k8s/services.yaml

echo "Aplicando Network Policy..."
kubectl apply -f k8s/networkpolicy.yaml

echo "=========================================="
echo "   Despliegue finalizado. Verificando..."
echo "=========================================="

kubectl get pods -n $NAMESPACE
kubectl get svc -n $NAMESPACE
