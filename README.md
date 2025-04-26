<div align="left" style="position: relative;">
<img src="/design_system/assets/images/logo.png" align="right" width="30%" style="margin: -20px 0 0 20px;">
<h1>ADOTE UM PET</h1>
<p align="left">
	<em>Unindo caudas e corações</em>
</p>
<p align="left">
	<!-- Shields.io badges disabled, using skill icons. --></p>
<p align="left">Criado com as tecnologias:</p>
<p align="left">
	<a href="https://skillicons.dev">
		<img src="https://skillicons.dev/icons?i=dart,flutter">
	</a></p>
</div>
<br clear="right">

## 🔗 Índice

I. [📍 Visão Geral](#-visão-geral)
II. [👾 Funcionalidades](#-funcionalidades)
III. [🏗️ Arquitetura](#-arquitetura)
IV. [📦 Pacotes](#-pacotes)
V. [🎨 Design System](#-design-system)
VI. [📁 Estrutura do Projeto](#-estrutura-do-projeto)
VII. [🚀 Começando](#-começando)
VIII. [📌 Roadmap do Projeto](#-roadmap-do-projeto)
IX. [🔰 Contribuindo](#-contribuindo)
X. [🎗 Licença](#-licença)
XI. [🙌 Agradecimentos](#-agradecimentos)

---

## 📍 Visão Geral

O "Adote um Pet" é um aplicativo móvel baseado em Flutter projetado para facilitar o processo de adoção de animais de estimação. Ele oferece recursos como listagens de animais em tempo real, filtros de pesquisa fáceis de usar e formulários de adoção interativos. Voltado para futuros donos de animais e abrigos, este aplicativo simplifica a busca e adoção de pets, melhorando a experiência do usuário e aumentando as taxas de adoção.

---

## 👾 Funcionalidades

|      | Funcionalidade   | Resumo       |
| :--- | :---:           | :---          |
| 🔐 | **Autenticação** | <ul><li>Sistema completo de login/registro</li><li>Fluxo de onboarding para novos usuários</li><li>Interceptor para gerenciamento de autenticação</li></ul> |
| 🐕 | **Busca de Pets** | <ul><li>Filtros por tipo de animal (cães, gatos, aves, etc.)</li><li>Busca avançada com diversos critérios</li><li>Visualização detalhada do perfil dos pets</li></ul> |
| 💬 | **Mensagens** | <ul><li>Sistema de chat entre adotantes e abrigos/tutores</li><li>Acompanhamento de conversas e solicitações de adoção</li></ul> |
| 🎁 | **Doações** | <ul><li>Funcionalidade para doação de itens e recursos para abrigos</li><li>Fluxo específico para cadastro de doações</li></ul> |
| 📱 | **UI/UX** | <ul><li>Design responsivo com componentes modernos</li><li>Experiência do usuário intuitiva e acessível</li><li>Design system consistente em toda aplicação</li></ul> |

---

## 🏗️ Arquitetura

O aplicativo segue os princípios da **Clean Architecture** combinada com **MVVM (Model-View-ViewModel)**, proporcionando uma estrutura organizada e de fácil manutenção:

### Camadas da Arquitetura:
- **Presentation**: Contém pages (UI), viewmodels e state management usando Flutter Bloc
- **Domain**: Contém entidades de negócio, repositórios e casos de uso
- **Data**: Implementação de repositórios, datasources e modelos de dados
- **Infrastructure**: Configurações de DI, HTTP Client, interceptors e serviços

### Injeção de Dependências:
O aplicativo utiliza o padrão **Service Locator** implementado com o pacote **GetIt** para gerenciar suas dependências, possibilitando:
- Lazy loading de dependências quando necessário
- Injeção de dependências por feature
- Fácil substituição de implementações para testes

### Gerenciamento de Estado:
- **Flutter Bloc**: Para gerenciamento de estado reativo e fluxo de dados unidirecional
- **Equatable**: Para comparações eficientes de estado e igualdade de objetos

### Navegação:
- **Go Router**: Navegação declarativa com suporte a rotas nomeadas e redirecionamentos

---

## 📦 Pacotes

O projeto utiliza uma cuidadosa seleção de pacotes para otimizar o desenvolvimento:

### Core:
- **flutter_bloc**: Gerenciamento de estado
- **equatable**: Comparações eficientes de estado
- **go_router**: Navegação
- **get_it**: Injeção de dependências

### Networking:
- **dio**: Cliente HTTP
- **flutter_dotenv**: Gerenciamento de variáveis de ambiente

### Armazenamento:
- **shared_preferences**: Armazenamento local persistente

### UI/UX:
- **design_system**: Pacote local de design system
- **gap**: Espaçamento consistente
- **flutter_masked_text2**: Formatação de campos de texto

### Utilitários:
- **logger**: Log avançado para desenvolvimento
- **lucid_validation**: Validação de formulários
- **result_dart**: Tratamento elegante de resultados/erros
- **image_picker**: Seleção de imagens para uploads

---

## 🎨 Design System

O aplicativo implementa um design system personalizado como um pacote modular localizado em `/design_system`, que inclui:

### Componentes:
- **Buttons**: Botões primários e selecionáveis
- **Drawer**: Menu lateral personalizado com itens de navegação
- **Inputs**: Campos de texto com diferentes estilos
- **Icons**: Conjunto de ícones personalizado para a aplicação

### Tema:
- **Cores**: Paleta de cores consistente para toda a aplicação
- **Tipografia**: Família de fontes e tamanhos padronizados
- **Espaçamento**: Sistema de spacing consistente

### Assets:
- **Imagens**: Logo, imagens de animais e recursos visuais
- **Ícones**: Conjunto de ícones personalizados para navegação e UI

O design system garante uma interface consistente e coesa em todo o aplicativo, facilitando a manutenção e escalabilidade do design.

---

## 📁 Estrutura do Projeto

```sh
└── adote-um-pet-app/
    ├── lib/
    │   ├── main.dart                  # Ponto de entrada do aplicativo
    │   └── src/
    │       ├── app_widget.dart        # Widget principal do aplicativo
    │       ├── routes.dart            # Configuração de rotas com go_router
    │       ├── app/                   # Features específicas do domínio
    │       │   └── features/
    │       │       ├── auth/          # Feature de autenticação
    │       │       ├── donate/        # Feature de doação
    │       │       └── message/       # Feature de mensagens
    │       └── core/                  # Componentes core da aplicação
    │           ├── DI/                # Injeção de dependências
    │           ├── cache/             # Gerenciamento de cache
    │           ├── client_http/       # Cliente HTTP e gerenciamento de requisições
    │           ├── errors/            # Tratamento de erros
    │           ├── features/          # Features do core (onboarding, etc)
    │           ├── logger/            # Sistema de logging
    │           ├── typedefs/          # Definição de tipos comuns
    │           ├── usecase/           # Interfaces de casos de uso
    │           └── utils/             # Utilitários e helpers
    │
    ├── design_system/                 # Pacote de design system
    │   ├── lib/
    │   │   ├── design_system.dart     # Exportação do design system
    │   │   └── src/
    │   │       ├── buttons/           # Componentes de botões
    │   │       ├── drawer/            # Componente de drawer
    │   │       ├── icons/             # Ícones do app
    │   │       ├── image/             # Componentes de imagem
    │   │       ├── inputs/            # Componentes de input
    │   │       └── theme/             # Definição de tema
    │   └── assets/                    # Recursos visuais do design system
    │       ├── icons/                 # Ícones
    │       └── images/                # Imagens
    │
    ├── assets/                        # Recursos da aplicação principal
    └── .env                           # Variáveis de ambiente
```

---

## 🚀 Começando

### Pré-requisitos
- Flutter SDK ^3.5.1
- Dart SDK ^3.5.1
- Um editor de código (VS Code, Android Studio, etc.)

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/adote-um-pet-app.git
cd adote-um-pet-app
```

2. Crie um arquivo `.env` na raiz do projeto com as variáveis necessárias:
```
API_BASE_URL=https://sua-api.exemplo.com
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o aplicativo:
```bash
flutter run
```

---

## 📌 Roadmap do Projeto

 wip

---

## 🔰 Contribuindo

 wip

---

## 🎗 Licença

 wip

---

## 🙌 Agradecimentos

 wip

---

