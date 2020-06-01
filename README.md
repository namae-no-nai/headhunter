# Headhunter


## Lista de Conteúdos

[Descrição](#descrição)

[Funcionalidades](#funcionalidades)

[Gems instaladas](#gems-instaladas)

[Pré-requisitos](#pré-requisitos-package)

[Configurações](#configurações)

[Rodando a aplicação](#rodando-a-aplicação-arrow_forward)

[Rodando os testes](#rodando-os-testes-memo)

[Casos de Uso](#casos-de-uso-busts_in_silhouette)

[Database](#database-floppy_disk)

[Rotas](#rotas)

[Resolvendo Problemas](#resolvendo-problemas-exclamation)

[Licença](#licença-trident)

## Descrição
<p align="justify"> Headhunter é uma aplicação Ruby on Rails para intereção de candidatos e headhunters, atráves da criação de perfis por candidatos, e seleção de vagas cadastradas por headhunters 
</p>

## Funcionalidades

Os **headhunters** (recrutadores) podem: 

Criar uma conta e uma vaga

Ver os inscritos em uma vaga

Escrever comentarios no perfil dos candidatos cadastrados a vaga  

Marcar perfis como destaque

Rejeitar perfils mandando um feedback

Enviar proposta para o perfil

Receber proposta do candidato 

Buscar por candidatos a partir do nome ou profissão

Encerrar as inscrições para uma vaga

Os **candidatos** podem: 

Criar uma conta 

Completar o seu perfil

Buscar por vagas a partir do titulo ou skills requeridas 

Se inscrever em uma vaga

Receber feedbacks negativos

Receber propostas de handhunterss

Aceitar e rejeitar propostas

## Techs

Ruby on Rails

[I18n](https://guides.rubyonrails.org/i18n.html) 

## Gems instaladas

[**Devise**](https://github.com/heartcombo/devise) para autenticação de usuários (recrutadores e candidatos)

[**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

[**Capybara**](https://github.com/teamcapybara/capybara) para escrever e executar testes de integração, isto é, de alto nível

[**Factory Bot Rails**](https://github.com/thoughtbot/factory_bot_rails) para otimizar a escrita de testes

[**SimpleCov**](https://github.com/colszowka/simplecov) para gerar relatórios referentes a cobertura de testes

[**SimpleForm**](https://github.com/heartcombo/simple_form) para melhor o aspecto dos formulários

[**Rubocop**](https://rubocop.org/) para melhorar a formatação do código

Pré-requisitos 

Algumas instalações serão necessárias antes de iniciar o projeto. 

[Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.7.0

[Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.3

[Node](https://nodejs.org/en/download/) versão >=10.13.0

[Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

[Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

[Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

## Configurações

### Iniciando/Configurando banco de dados

No terminal, clone o projeto: 

```
https://github.com/namae-no-nai/headhunter.git 'pasta_de_destino'
```
ou baixe o zip

Entre na pasta
```
cd plataforma-headhunters-treina-dev 
``` 
ou 
``` 
cd pasta_destino
``` 

Instale as dependencias e prepare o database
```
bin/setup
```

## Rodando a aplicação :arrow_forward:

```
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação

## Resolvendo Problemas

>Em progresso
