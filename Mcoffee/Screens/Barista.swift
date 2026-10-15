import SwiftUI

struct Barista: View {

    var baristaImage = [
        "Barista",
        "Barista",
        "Barista",
        "Barista",
        "Barista"
    ]

    var body: some View {

        VStack {

            HeaderView(title: "Barista")

            ListHeader(title: "select a barista")

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 5) {

                    ForEach(baristaImage, id: \.self) { barista in

                        NavigationLink {

                            CoffeeCountry()
                                .navigationBarBackButtonHidden()

                        } label: {

                            HStack(spacing: 15) {

                                // Left Image
                                Image(barista)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 62, height: 62)
                                    .cornerRadius(12)

                                // Middle Texts
                                VStack(alignment: .leading, spacing: 6) {

                                    Text("David Bennett")
                                        .font(.headline)
                                        .foregroundStyle(.black)

                                    Text("Espresso Specialist")
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                }

                                Spacer()

                                // Right Status Icon
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(
                                        Bool.random()
                                        ? Color.green
                                        : Color.red
                                    )
                            }
                            .padding()

                            .background(Color.white)

                            .cornerRadius(16)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 35)
            }
            .background(Color.gray.opacity(0.2))
        }
    }
}

#Preview {

    Barista()
}
