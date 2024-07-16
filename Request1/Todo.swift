
//  Todo.swift
//  Request1
//  Created por MANUELA CHEMISCOK BENATTI em 29/11/23.


// Importa o framework Foundation, necessário para manipulação de dados básicos.
import Foundation

// Define uma estrutura chamada Todo que conforma aos protocolos Identifiable e Decodable.
// Identifiable permite que cada instância de Todo tenha um identificador único, útil para listas no SwiftUI.
// Decodable permite que a estrutura seja decodificada a partir de dados JSON.
struct Todo: Identifiable, Decodable {
    // Propriedade para armazenar o ID do usuário que criou a tarefa.
    var userId: Int
    // Propriedade para armazenar o ID único da tarefa.
    var id: Int
    // Propriedade para armazenar o título da tarefa.
    var title: String
    // Propriedade para indicar se a tarefa foi concluída.
    var completed: Bool
}
