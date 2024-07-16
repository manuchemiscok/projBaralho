# Request1

## Descrição

Request1 é um aplicativo criado para demonstrar como obter dados de uma API e exibi-los utilizando SwiftUI. Neste projeto, o aplicativo busca dados de duas APIs diferentes: uma que fornece uma lista de tarefas (todos) e outra que fornece cartas de um baralho. As informações obtidas são exibidas na interface do usuário, permitindo interações básicas como a visualização de uma carta e a listagem de tarefas.

## Funcionalidades

- **Obtenção de dados da API**: O aplicativo busca dados de duas APIs distintas.
  - **Tarefas**: Obtém uma lista de tarefas de uma API pública.
  - **Cartas de Baralho**: Obtém uma carta de um baralho de uma API pública.
- **Exibição de Dados**: Mostra as tarefas obtidas e a imagem da carta na interface do usuário.
- **Interação do Usuário**: Permite ao usuário atualizar a lista de tarefas e obter uma nova carta com um clique de botão.

## Tecnologias Utilizadas

- **Linguagem de Programação**: Swift
- **Frameworks**:
  - **SwiftUI**: Utilizado para construir a interface do usuário de forma declarativa.
  - **Foundation**: Necessário para manipulações básicas de dados e operações de rede.
  - **UIKit**: Utilizado para manipulação de imagens.

## Estrutura do Projeto

1. **`Request1App.swift`**
   - Ponto de entrada do aplicativo.
   - Configura a interface principal e injeta dependências no ambiente.

2. **`ContentView.swift`**
   - Define a visualização principal onde os dados das APIs são exibidos.
   - Inclui lógica para obter uma carta e exibir tarefas.

3. **`NetworkManager.swift`**
   - Gerencia as solicitações de rede para obter dados das APIs.
   - Decodifica as respostas JSON em estruturas utilizáveis pelo Swift.

4. **`Todo.swift`**
   - Define a estrutura para representar uma tarefa.
   - Conforma aos protocolos `Identifiable` e `Decodable` para facilitar o uso no SwiftUI.

## Dependências

- **`URLSession`**: Utilizado para realizar solicitações HTTP e obter dados da API.
- **`JSONDecoder`**: Utilizado para decodificar os dados JSON obtidos das APIs.
- **`ObservableObject` e `@Published`**: Utilizados para permitir que a interface do usuário reaja a mudanças nos dados.

## Como Executar o Projeto

1. **Clone o Repositório**
   ```sh
   git clone https://github.com/manuchemiscok/projLabirinto.git
   cd projLabirinto
   ## Funcionalidades

2. **Abra o Projeto no Xcode**.

