#Autor: Fagner Geraldes Braga  
#Data de criação: 14/04/2023  
#Data de atualização: 14/04/2023  
#Versão: 0.01

## Métricas
	São medições numéricas de dados relacionados a elementos 
	do seu software do seu software ou da sua infraestrutura.
	Normalmente esses dados numéricos são relacionados a uma linha temporal.

### Métricas de Sistema
	Quantidade de requisições
	Quantidade de erros
	Consumo de recursos
	APIs mais acessadas
	Tempo de acesso a um recurso

### Métricas de Negócio
	Usuários acessando a aplicação
	Boletos emitidos
	Compras de um produto

### Métricas
	Dados numéricos
	Gráficos
	Agregações
	Performance

### Logs
	Dados textuais
	Mensagens de Erro
	Informação
	Buscáveis

# Prometheus
	Criado pela SoundCloud
	OpenSource
	Dados dimensionais (TSDB)
	Múltiplas formas de visualização
	Configuração de alertas
	Projetos graduado na CNCF

```bash
cd "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada"
mkdir monitoramento
cd monitoramento
mv "E:\Users\fagne\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\jornada\deploy-prometheus-grafana.yaml" .

cd ..\..
kubectl apply -f .\monitoramento\deploy-prometheus-grafana.yaml
kubectl get pods
kubectl get service
```
### Alterar arquivo .\kube-news\k8s\deployment.yaml

kubectl apply -f .\kube-news\k8s\deployment.yaml
kubectl get pods

### Grafana
Usuário: admin
Senha: 

Executar comando abaixo no gitbash
kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode

Engrenagem, Configuration, Add data source
Prometheus
HTTP
URL: http://prometheus-server
Save and Test

Dashboards, New dashboard
Disquete
Dashboard name: Jornada DevOps de Elite
Save
Add Panel
Add a new panel

Title: Requisições
Query, Code
Metrics browser: sum(rate(http_requests_total{path="/"}[20s])) by (app, path)

kubectl delete service
terraform destroy

