<p align="center"> <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/> </p>



#	API de Catálogo de Carros
Este é um projeto desenvolvido como parte da demonstração dos meus conhecimentos.

A aplicação é uma API que possibilita o gerenciamento de um catálogo de carros, oferecendo funcionalidades para criar, ler, atualizar e excluir registros de carros. Essa API foi containerizada utilizando Docker, o que permite sua execução em ambientes isolados de forma consistente. Além disso, ela pode ser implantada em um cluster Kubernetes, possibilitando a escalabilidade e o gerenciamento eficiente dos recursos.

Para garantir agilidade e automatização de tarefas, a aplicação utiliza CI/CD (Integração Contínua/Entrega Contínua). Esse processo automatizado facilita a construção, teste, implantação e atualização da aplicação, tornando o ciclo de desenvolvimento mais eficiente e confiável.

Em resumo, a aplicação consiste em uma API containerizada com Docker, que gerencia um catálogo de carros e pode ser implantada em um ambiente Kubernetes, aproveitando os benefícios da automação fornecidos pelo CI/CD.



## Tecnologias Utilizadas
- .NET 6.0
- Entity Framework Core
- Identity
- XUnit
- MySQL
- Docker
- Kubernetes
- Prometheus
- Grafana
- Alertmanager - Slack
- NGINX
- Git
- GitHub
- Jenkins



## Pré-requisitos
+ .NET 6.0

+ Docker

+ Kubernetes



## Estrutura do Projeto
src/ - Contém o código-fonte da API em ASP.NET 6.0.
kubernetes/ - Contém os arquivos de configuração para implantar a API no Kubernetes.



## Funcionalidades
- Listar todos os carros do catálogo.
- Buscar um carro por ID.
- Adicionar um novo carro ao catálogo.
- Atualizar as informações de um carro existente.
- Excluir um carro do catálogo.
- Coleta de métricas do Kubernetes (Kluster), Nginx e API pelo Prometheus.
- Envio de alertas de erro relacionados à API para o Slack por meio do Alertmanager.
- Visualização e consulta das métricas no Grafana.



## Documentação da API 
Para obter mais informações sobre os endpoints e a funcionalidade da API de Catálogo de Carros, consulte a [documentação da API no Postman](https://documenter.getpostman.com/view/22241608/2s93sf1qnf).



## Implantação Local
1. Suba o Docker Compose da API:

   ```bash
   docker-compose up -d
   ```

2. Acesse a API em http://localhost/swagger



## Implantação no Kubernetes
Certifique-se de que seu cluster Kubernetes esteja em execução e configurado corretamente.

1. Crie um namespace para uma melhor organização:

   ```bash
   kubectl create namespace catalogo-carros
   ```

2. Aplique a configurações de metricas do Cluster:

   ```bash
   kubectl apply -f kube-state-metrics/
   ```

3. Aplique os arquivos da API:

   ```bash   
   kubectl apply -f catalogo-carros/ --namespace=catalogo-carros  
   ```

4. Aplique os arquivo do Alertmanager:

   ```bash
   kubectl apply -f alertmanager/ --namespace=catalogo-carros 
   ```

5. Aplique os arquivos do Prometheus

   ```bash
   kubectl apply -f prometheus/ --namespace=catalogo-carros
   ```

6. Aplique os arquivos do Grafana

   ```bash
   kubectl apply -f grafana/ --namespace=catalogo-carros
   ```

8. Aplique os arquivos do MySql

   ```bash
   kubectl apply -f mysql/ --namespace=catalogo-carros
   ```

9. Aplique os arquivos do Nginx

   ```bash
   kubectl apply -f nginx/ --namespace=catalogo-carros
   ```

10. Aplique os arquivos do Client

   ```bash
   kubectl apply -f client/ --namespace=catalogo-carros
   ```

11. Você também pode aplicar todos os arquivos de uma vez:

   ```bash
   kubectl create namespace catalogo-carros
   kubectl apply -f kube-state-metrics/
   kubectl apply -f catalogo-carros/ --namespace=catalogo-carros
   kubectl apply -f alertmanager/ --namespace=catalogo-carros
   kubectl apply -f prometheus/ --namespace=catalogo-carros
   kubectl apply -f grafana/ --namespace=catalogo-carros
   kubectl apply -f mysql/ --namespace=catalogo-carros
   kubectl apply -f nginx/ --namespace=catalogo-carros
   kubectl apply -f client/ --namespace=catalogo-carros
   ```

12. Verifique o status da implantação:

    ```
    kubectl get pods --namespace=catalogo-carros
    ```

13. As portas utilizadas para acesso aos serviços são: 

   - 80 para a API.
   - 9090 para o Prometheus.
   - 9093 para o Alertmanager.
   - 3000 para o Grafana.

14. Caso seja necessário, você pode excluir todos os pods de uma vez usando o seguinte comando:

    ```
    kubectl delete deploy alertmanager-deployment catalogo-carros-deployment nginx-deployment prometheus-deployment grafana-deployment nginx-prometheus-exporter-deployment client-deployment --force --namespace=catalogo-carros
    kubectl delete statefulset mysql-statefulset --force --namespace=catalogo-carros
    #ou
    kubectl delete namespace catalogo-carros
    ```

    


## Observações:
- Para receber mensagens do Alertmanager no Slack, crie um canal para receber os alerts e instale o "incoming-webhook" no Slack escolhendo o canal criado para receber os alerts. Copie a URL do webhook gerada e cole-a no arquivo "alertmanager.yml" (slack_api_url).
- O ambiente kubernetes pode ser facilmente aplicado em qualquer provedor de nunvem sem muitas alterações.



## Contribuição
Este projeto foi desenvolvido por:

- [marcoservio](https://github.com/marcoservio)

Sinta-se à vontade para contribuir com melhorias para este projeto. Basta fazer um fork, realizar as alterações e enviar um pull request. Será um prazer revisar e mesclar suas contribuições.



## Licença
Este projeto está licenciado sob a licença MIT.



## Recursos Adicionais
- [.NET](https://docs.microsoft.com/pt-br/dotnet/)
- [Entity Framework Core](https://docs.microsoft.com/pt-br/ef/core/)
- [Identity](https://docs.microsoft.com/pt-br/aspnet/core/security/authentication/)
- [XUnit](https://xunit.net/)
- [MySQL](https://dev.mysql.com/doc/)
- [Docker](https://docs.docker.com/)
- [Kubernetes](https://kubernetes.io/docs/home/)
- [Prometheus](https://prometheus.io/docs/)
- [Grafana](https://grafana.com/docs/)
- [Alertmanager](https://prometheus.io/docs/alerting/latest/configuration/)
- [NGINX](https://nginx.org/en/docs/)
- [Git](https://git-scm.com/doc)
- [GitHub](https://docs.github.com/en)
- [Jenkins](https://www.jenkins.io/doc/)



## Contato
- Email: [marcoservio22@hotmail.com](mailto:marcoservio22@hotmail.com.com)

- GitHub: [marcoservio](https://github.com/marcoservio)

- LinkedIn: [Marco Servio](https://www.linkedin.com/in/marco-sérvio-366b2b137/)



Se você tiver alguma dúvida, sugestão ou quiser se conectar profissionalmente, sinta-se à vontade para entrar em contato por e-mail ou me encontrar no LinkedIn.



Agradeço por visitar este repositório e por verificar meu projeto de Catálogo de Carros em .NET 6.0