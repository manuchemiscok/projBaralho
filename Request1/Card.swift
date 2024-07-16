
//  Card.swift
//  Request1
//  Created por MANUELA CHEMISCOK BENATTI em 01/12/23.


// Importa o framework Foundation, necessário para manipulação de dados básicos e operações de rede.
import Foundation

// Define uma classe chamada NetWork que conforma ao protocolo ObservableObject.
// ObservableObject é usado para permitir que SwiftUI observe e reaja a mudanças nos dados.
class NetWork: ObservableObject {
    // Define duas propriedades que podem ser observadas por SwiftUI e notificam quando seus valores mudam.
    @Published var todos: [Todo] = []
    @Published var cardImage: UIImage?

    // Função para obter dados de uma API.
    func getTodos() {
        // Garante que a URL fornecida seja válida. Caso contrário, termina o programa com um erro.
        guard let url = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else {
            fatalError("URL ausente")
        }

        // Cria uma requisição HTTP com a URL.
        let urlRequest = URLRequest(url: url)

        // Cria uma tarefa de rede para obter dados da URL.
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Verifica se ocorreu algum erro na requisição.
            if let error = error {
                print("Erro na requisição", error)
                return
            }

            // Verifica se a resposta HTTP é válida e tem o código 200 (OK).
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }

            // Verifica se os dados recebidos não são nulos.
            guard let data = data else { return }

            // Executa o bloco de código na fila principal, geralmente para atualizar a interface de usuário.
            DispatchQueue.main.async {
                do {
                    // Decodifica os dados JSON em um objeto CardResponse.
                    let cardResponse = try JSONDecoder().decode(CardResponse.self, from: data)
                    // Tenta obter a imagem da carta a partir da URL e a armazena na propriedade cardImage.
                    self.cardImage = UIImage(data: try Data(contentsOf: URL(string: cardResponse.cards.first?.image ?? "")!))

                } catch let error {
                    // Imprime um erro caso a decodificação falhe.
                    print("Erro ao decodificar: ", error)
                }
            }
        }
        // Inicia a tarefa de rede.
        dataTask.resume()
    }
}

// ContentView.swift
import SwiftUI

// Define uma estrutura chamada ContentView que conforma ao protocolo View, representando a interface de usuário principal.
struct ContentView: View {
    // Usa a propriedade environmentObject para acessar o objeto de rede NetWork.
    @EnvironmentObject var network: NetWork

    // Define o conteúdo da visualização (interface de usuário).
    var body: some View {
        // Cria um VStack, que é uma pilha vertical para organizar os elementos da interface.
        VStack {
            // Se cardImage não for nulo, exibe a imagem da carta.
            if let cardImage = network.cardImage {
                Image(uiImage: cardImage)
                    .resizable() // Permite que a imagem seja redimensionada.
                    .aspectRatio(contentMode: .fit) // Mantém a proporção da imagem ao redimensionar.
                    .frame(minHeight: 100, maxHeight: 150) // Define o tamanho da imagem.
            } else {
                // Se cardImage for nulo, exibe uma mensagem de texto.
                Text("Carregando carta...")
            }

            // Cria um ScrollView para exibir uma lista de tarefas.
            ScrollView {
                // Título para a seção de tarefas.
                Text("ToDos para fazer")
                    .font(.title) // Define a fonte do texto.
                    .bold() // Define o texto como negrito.

                // Cria um VStack para organizar as tarefas verticalmente.
                VStack(alignment: .leading) {
                    // Itera sobre a lista de tarefas e exibe cada uma delas.
                    ForEach(network.todos) { todo in
                        // O restante do seu código para exibir as tarefas (todos)
                        // ...
                    }
                }
            }
            .padding(.vertical) // Adiciona preenchimento vertical ao ScrollView.
        }
        // Executa um bloco de código quando a visualização aparece pela primeira vez.
        .onAppear {
            // Chama a função getTodos do network para obter dados quando a visualização aparece.
            network.getTodos()
        }
    }
}

// Define uma estrutura para pré-visualização da ContentView no Xcode.
struct ContentView_Previews: PreviewProvider {
    // Define a propriedade estática previews para fornecer a visualização.
    static var previews: some View {
        // Retorna uma instância de ContentView com um objeto NetWork no ambiente.
        ContentView()
            .environmentObject(NetWork())
    }
}
