
//  NetWork.swift
//  Request1
//  Created por MANUELA CHEMISCOK BENATTI em 29/11/23.


// Importa o framework Foundation, necessário para manipulação de dados básicos e operações de rede.
import Foundation

// Define uma classe chamada NetWork que conforma ao protocolo ObservableObject.
// ObservableObject é usado para permitir que SwiftUI observe e reaja a mudanças nos dados.
class NetWork: ObservableObject {
    
    // Define uma propriedade observável chamada todos, que é uma lista de objetos Todo.
    // @Published é usado para notificar a interface de usuário sobre mudanças nessa propriedade.
    @Published var todos: [Todo] = []
    
    // Função para obter dados de uma API.
    func getTodos() {
        // Garante que a URL fornecida seja válida. Caso contrário, termina o programa com um erro.
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            fatalError("Missing URL")
        }
        
        // Cria uma requisição HTTP com a URL.
        let urlRequest = URLRequest(url: url)
        
        // Cria uma tarefa de rede para obter dados da URL.
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            // Verifica se ocorreu algum erro na requisição.
            if let error = error {
                print("Request error", error)
                return
            }
            
            // Verifica se a resposta HTTP é válida.
            guard let response = response as? HTTPURLResponse else { return }
            
            // Se a resposta for válida e o código de status for 200 (OK):
            if response.statusCode == 200 {
                // Verifica se os dados recebidos não são nulos.
                guard let data = data else { return }
                
                // Executa o bloco de código na fila principal, geralmente para atualizar a interface de usuário.
                DispatchQueue.main.async {
                    do {
                        // Decodifica os dados JSON em um array de objetos Todo.
                        let decodedTodos = try JSONDecoder().decode([Todo].self, from: data)
                        // Atualiza a propriedade todos com os dados decodificados.
                        self.todos = decodedTodos
                    } catch let error {
                        // Imprime um erro caso a decodificação falhe.
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        // Inicia a tarefa de rede.
        dataTask.resume()
    }
}
