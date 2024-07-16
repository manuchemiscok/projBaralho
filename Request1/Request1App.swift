
//  Request1App.swift
//  Request1
//  Created por MANUELA CHEMISCOK BENATTI em 29/11/23.

// Importa o framework SwiftUI, necessário para criar interfaces de usuário.
import SwiftUI

// Marca a estrutura Request1App como a principal entrada do aplicativo com o atributo @main.
@main
struct Request1App: App {
    
    // Cria uma instância da classe NetWork.
    var network = NetWork()
    
    // Define o conteúdo principal do aplicativo.
    var body: some Scene {
        
        // Cria uma janela principal para o aplicativo.
        WindowGroup {
            // Define ContentView como a visualização principal.
            ContentView()
                // Adiciona a instância de NetWork ao ambiente para que possa ser acessada pelas visualizações.
                .environmentObject(network)
        }
    }
}
