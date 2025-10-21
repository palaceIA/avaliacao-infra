# 🧩 **Atividade Avaliativa Prática 01 – Infraestrutura de TI**

**Aluno:** Caio Alves de Aguiar Palácio  
**Turma:** 28M4A  
**Data:** 21/10/2025  
**Resultados:** [`/docs`](./docs)

---

## 📘 **Descrição da Atividade**

Esta atividade prática teve como objetivo **criar, dockerizar e implantar uma API Flask** em um **cluster Kubernetes local (Minikube)**, além de **provisionar recursos AWS simulados via Terraform e LocalStack**.  

O trabalho foi desenvolvido seguindo **boas práticas de Infraestrutura como Código (IaC)**, **conteinerização** e **orquestração de serviços**, garantindo automação e reprodutibilidade do ambiente.

---

## 🚀 **Tecnologias Utilizadas**

| Tecnologia | Versão | Finalidade |
|-------------|---------|-------------|
| 🐍 Python | 3.11 | Linguagem base da API |
| 🌶️ Flask | 2.2.5 | Framework Web para criação da API |
| 🐳 Docker | Latest | Conteinerização da aplicação |
| ☸️ Kubernetes | Minikube | Orquestração e deploy local |
| 🌍 Terraform | Latest | Provisionamento de infraestrutura |
| 🧱 LocalStack | Latest | Simulação de serviços AWS |
| 📬 Postman | - | Testes de integração da API |

---

## 🧱 **Estrutura do Projeto**

```bash
infra-prova-pratica/
├── api/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md
```

---

## ⚙️ **Passos de Execução**

### 1️⃣ Build da Imagem Docker

```bash
cd api
docker build -t infra-prova-api:latest .
docker run --rm -p 5000:5000 infra-prova-api:latest
```

---

### 2️⃣ Teste Local da API

```bash
curl http://localhost:5000/
curl -X POST http://localhost:5000/sum      -H "Content-Type: application/json"      -d '{"a":3,"b":4.5}'
```

---

### 3️⃣ Deploy no Kubernetes (Minikube)

```bash
minikube image load infra-prova-api:latest
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service infra-prova-api-svc --url
```

---

### 4️⃣ Provisionamento com Terraform + LocalStack

```bash
localstack start
cd terraform
terraform apply -auto-approve
```

---


✨ *Desenvolvido por Caio Palácio   
📅 *Infraestrutura de TI – Avaliação Prática 01*
