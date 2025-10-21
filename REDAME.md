🧩 Atividade Avaliativa Prática 01 – Infraestrutura de TI

Aluno: Caio Palácio
Turma: 28M4A
Data: 21/10/2025

📘 Descrição da Atividade

Esta atividade prática teve como objetivo criar, dockerizar e implantar uma API Flask em um cluster local Kubernetes (Minikube), além de provisionar recursos AWS com Terraform.
O trabalho foi desenvolvido seguindo boas práticas de Infraestrutura como Código (IaC), conteinerização e orquestração de serviços.

🚀 Tecnologias Utilizadas

- Python 3.11

- Flask 2.2.5

- Docker

- Kubernetes (Minikube)

- Terraform

- LocalStack

- Postman

🧱 Estrutura do Projeto
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

⚙️ Passos de Execução
1️⃣ Build da Imagem Docker
cd api
docker build -t infra-prova-api:latest .
docker run --rm -p 5000:5000 infra-prova-api:latest

2️⃣ Teste Local
curl http://localhost:5000/
curl -X POST http://localhost:5000/sum -H "Content-Type: application/json" -d '{"a":3,"b":4.5}'

3️⃣ Deploy no Kubernetes (Minikube)
minikube image load infra-prova-api:latest
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service infra-prova-api-svc --url

4️⃣ Provisionamento com Terraform
LocalStack
localstack start
terraform apply -auto-approve

🧩 Desafios e Soluções
Desafio	Solução
Erro ImagePullBackOff no Minikube	Configuração do ambiente Docker dentro do Minikube (eval $(minikube docker-env)) e rebuild da imagem.
Lentidão entre container e cluster	Ajuste no service.yaml e validação de NodePort com minikube service.
Erros no Terraform com AWS	Uso do LocalStack para simular recursos AWS localmente.

✅ Resultados Obtidos
API Flask funcional, containerizada e implantada com sucesso no Minikube.
Recursos AWS simulados via Terraform/LocalStack (S3 e IAM).
Testes de integração realizados com sucesso no Postman.
Fluxo completo de DevOps reproduzido em ambiente local.

📄 Autor

Caio Palácio
Estudante de Engenharia de Software
Email: [adicione seu email institucional ou pessoal se desejar]