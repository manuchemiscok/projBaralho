
//  ContentView_Previews.swift
//  Request1
//  Created por MANUELA CHEMISCOK BENATTI em 01/12/23.


// Importa os frameworks Foundation e SwiftUI.
import Foundation
import SwiftUI

// Define uma estrutura chamada ContentView_Previews que conforma ao protocolo PreviewProvider.
// Este protocolo é usado para fornecer visualizações (previews) de componentes SwiftUI no Xcode.
struct ContentView_Previews: PreviewProvider {
    // Define uma propriedade estática chamada previews que retorna uma visualização.
    static var previews: some View {
        // Retorna uma instância de ContentView.
        // Isso permite visualizar como o ContentView ficará no Xcode.
        ContentView()
    }
}
