<p align="center"> <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/> </p>



#	API de Catálogo de Carros
Este é um projeto desenvolvido como parte da demonstração dos meus conhecimentos. 

A aplicação é uma API que possibilita o gerenciamento de um catálogo de carros, oferecendo funcionalidades para criar, ler, atualizar e excluir registros de carros. Essa API foi containerizada utilizando Docker, o que permite sua execução em ambientes isolados de forma consistente. Além disso, ela pode ser implantada em um cluster Kubernetes, possibilitando a escalabilidade e o gerenciamento eficiente dos recursos.

Para garantir agilidade e automatização de tarefas, a aplicação utiliza CI/CD (Integração Contínua/Entrega Contínua). Esse processo automatizado facilita a construção, teste, implantação e atualização da aplicação, tornando o ciclo de desenvolvimento mais eficiente e confiável.

Em resumo, a aplicação consiste em uma API containerizada com Docker, que gerencia um catálogo de carros e pode ser implantada em um ambiente Kubernetes, aproveitando os benefícios da automação fornecidos pelo CI/CD.



## Tecnologias Utilizadas
- .NET 6.0
- XUnit
- MySQL
- Docker
- Kubernetes
- Prometheus
- Grafana
- Alertmanager - Slack
- NGINX
- CI/CD
- Git/GitHub/GitLab



## Pré-requisitos
+ .NET 6.0

+ Docker

+ Kubernetes



## Estrutura do Projeto
src/ - Contém o código-fonte da API em ASP.NET 6.0.
kubernetes/ - Contém os arquivos de configuração para implantar a API no Kubernetes.



## Funcionalidades

- Listar todos os carros do catálogo
- Buscar um carro por ID
- Adicionar um novo carro ao catálogo
- Atualizar as informações de um carro existente
- Excluir um carro do catálogo



## Implantação Local
1. Suba o Docker Compose da API:

   ```bash
   docker-compose up -d
   ```

2. Acesse a API em http://localhost/WeatherForecast



## Implantação no Kubernetes

Certifique-se de que seu cluster Kubernetes esteja em execução e configurado corretamente.

1. Aplique os ConfigMaps:

   ```bash
   kubectl apply -f prometheus-config.yaml
   kubectl apply -f prometheus-alert-config.yaml
   kubectl apply -f alertmanager-config.yaml
   ```

2. Aplique os Serviços:

   ```bash
   kubectl apply -f catalogo-carro-clusterip.yaml
   kubectl apply -f catalogo-carro-nodeport.yaml
   kubectl apply -f prometheus-nodeport.yaml
   kubectl apply -f alertmanager-clusterip.yaml
   kubectl apply -f alertmanager-nodeport.yaml
   ```

3. Aplique os Deployments

   ```bash
   kubectl apply -f catalogo-carro-deployment.yaml
   kubectl apply -f alertmanager-deployment.yaml
   kubectl apply -f prometheus-deployment.yaml
   ```

4. Verifique o status da implantação:

   ```bash
   kubectl get pods
   ```

5. Obtenha o IP externo do serviço:

   ```
   kubectl get svc
   ```

6. Se o cluster estiver local acessar utilizando o localhost, se estiver na nuvem acessar com o IP gerado do Load Balancer. Porta 31222 API, Porta 30001 Prometheus, Porta 30002 Alertmenager.

   ```http
   http://localhost:31222
   http://localhost:30001 
   http://localhost:30002 
   ```

   

## Contribuição
Este projeto foi desenvolvido por:

- [marcoservio](https://github.com/marcoservio)

Sinta-se à vontade para contribuir com melhorias para este projeto. Basta fazer um fork, realizar as alterações e enviar um pull request. Será um prazer revisar e mesclar suas contribuições.



## Licença
Este projeto está licenciado sob a licença MIT.



## Recursos Adicionais
.NET Documentation
Docker Documentation
Kubernetes Documentation
Prometheus Documentation
Grafana Documentation



## Contato
- Email: [marcoservio22@hotmail.com](mailto:marcoservio22@hotmail.com.com)

- GitHub: [marcoservio](https://github.com/marcoservio)

  

Agradeço por visitar este repositório e por verificar meu projeto de Catálogo de Carros em .NET 6.0