import SwiftUI

struct CoffeeCountry: View {
    @EnvironmentObject private var orderManager: OrderManager

    var countries = [
        "Brazil",
        "Colombia",
        "Ethiopia",
        "India",
        "Kenya"
    ]

    var body: some View {

        VStack {

            HeaderView(title: "Coffee lover assemblage")

            ListHeader(title: "Select country and sort of coffee")

            List(countries, id: \.self) { country in

                NavigationLink {
                    CoffeeType()
                        .navigationBarBackButtonHidden()

                } label: {

                    HStack {

                        Text(country)
                            .foregroundStyle(.black)
                        Spacer()

//                        Image(systemName: "chevron.right")
//                            .foregroundStyle(.black)
                    }
                }
                .foregroundStyle(Color.black)
                .simultaneousGesture(TapGesture().onEnded {
                    orderManager.updateCountry(country)
                })
            }
            .padding(.top, 20)
            .listStyle(.plain)
        }
    }
}

#Preview {

    CoffeeCountry()
        .environmentObject(OrderManager())
}
