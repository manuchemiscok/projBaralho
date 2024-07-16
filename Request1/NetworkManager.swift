// Comentários indicando o nome do arquivo, o projeto, o autor e a data de criação.
//
//  NetworkManager.swift
//  Request1
//
//  Created por MANUELA CHEMISCOK BENATTI em 01/12/23.
//

// Importa os frameworks Foundation, SwiftUI e UIKit.
import Foundation
import SwiftUI
import UIKit

// Define uma estrutura CardResponse que conforma ao protocolo Decodable para decodificar a resposta JSON da API.
struct CardResponse: Decodable {
    let cards: [Card]
}

// Define uma estrutura Card que conforma ao protocolo Decodable para decodificar os detalhes da carta.
struct Card: Decodable {
    let image: String
    let value: String
    let suit: String
}

// Define uma classe chamada NetworkManager que conforma ao protocolo ObservableObject.
// ObservableObject é usado para permitir que SwiftUI observe e reaja a mudanças nos dados.
class NetworkManager: ObservableObject {
    // Define uma propriedade observável chamada card que pode ser um objeto Card.
    // @Published é usado para notificar a interface de usuário sobre mudanças nessa propriedade.
    @Published var card: Card?

    // Função para obter uma carta da API.
    func getCard() {
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

            do {
                // Decodifica os dados JSON em um objeto CardResponse.
                let cardResponse = try JSONDecoder().decode(CardResponse.self, from: data)
                // Executa o bloco de código na fila principal, geralmente para atualizar a interface de usuário.
                DispatchQueue.main.async {
                    // Atualiza a propriedade card com a primeira carta da resposta.
                    self.card = cardResponse.cards.first
                }
            } catch let error {
                // Imprime um erro caso a decodificação falhe.
                print("Erro ao decodificar: ", error)
            }
        }
        // Inicia a tarefa de rede.
        dataTask.resume()
    }
}
