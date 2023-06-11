<p align="center"> <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/> </p>



#	API de Catálogo de Carros

Este é um projeto de Catálogo de Carros desenvolvido como parte da demonstração dos meus conhecimentos. 
A aplicação consiste em uma API para gerenciar um catálogo de carros, permitindo a criação, leitura, atualização e exclusão de carros, que foi containerizada com Docker e pode ser implantada em um cluster Kubernetes.



## Tecnologias Utilizadas

- .NET 6.0
- Docker
- Kubernetes
- Prometheus
- Grafana
- MySQL



## Pré-requisitos
+ Docker

+ .NET 6.0

+ Kubernetes



## Estrutura do Projeto
CatalogoCarros/ - Contém o código-fonte da API em ASP.NET 6.0.
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
   docker-compose up
   ```

2. Acesse a API em http://localhost:8888.



## Implantação no Kubernetes

Certifique-se de que seu cluster Kubernetes esteja em execução e configurado corretamente.

1. Implante a API, o Prometheus no Kubernetes:

   ```bash
   kubectl apply -f kubernetes/catalogo-carro-deployment.yaml
   kuebctl apply -f kubernetes/prometheus-deployment.yaml
   ```

2. Exponha o serviço para acesso externo do cluster e externo:

   ```bash
   kubectl apply -f kubernetes/catalogo-carro-svc-interno.yaml.yaml
   kuebctl apply -f kubernetes/svc-catalogo-carro.yaml
   kuebctl apply -f kubernetes/svc-prometheus.yaml
   ```

3. Aplicar arquivo de config para configurações do Prometheus

   ```bash
   kubectl apply -f kubernetes/prometheus-config.yaml
   ```

4. Verifique o status da implantação:

   ```bash
   kubectl get pods
   ```

5. Obtenha o IP externo do serviço:

   ```
   kubectl get svc
   ```

6. Se o cluster estiver local acessar utilizando o localhost, se estiver na nuvem acessar com o IP gerado do Load Balancer

   ```http
   API -> http://localhost:31222
   Prometheus -> http://localhost:30001 
   ```

   

## Contribuição

Este projeto foi desenvolvido por:

- [marcoservio](https://github.com/marcoservio)
- [Nome do Autor 2](https://github.com/autor2)

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