import SwiftUI
struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()

    var body: some View {
        VStack {
            if let card = networkManager.card {
                Image(uiImage: loadImage(from: card.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minHeight: 100, maxHeight: 150)

                Text("Valor: \(card.value)")
                Text("Naipe: \(card.suit)")
            } else {
                Text("Clique no botão para obter uma carta.")
            }

            Button("Obter Carta") {
                networkManager.getCard()
            }
            .padding()
        }
        .onAppear {
            networkManager.getCard()
        }
    }

    func loadImage(from urlString: String) -> UIImage {
        guard let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
            return UIImage(systemName: "photo") ?? UIImage()
        }
        return image
    }
}
