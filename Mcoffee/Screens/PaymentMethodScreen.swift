import SwiftUI

struct PaymentMethodScreen: View {
    @State private var selectedCard = "Visa"

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Payment")
                .padding(.top, 18)

            VStack(spacing: 16) {
                ForEach(["Visa", "Mastercard", "Cash"], id: \.self) { method in
                    Button {
                        selectedCard = method
                    } label: {
                        HStack(spacing: 14) {
                            Image(systemName: method == "Cash" ? "banknote" : "creditcard.fill")
                                .foregroundStyle(appBlue)
                                .frame(width: 34)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(method)
                                    .font(.system(size: 16, weight: .semibold))
                                Text(method == "Cash" ? "Pay at coffee house" : "Saved payment card")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            Image(systemName: selectedCard == method ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(selectedCard == method ? appPurple : .gray)
                        }
                        .padding(18)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }

                NavigationLink {
                    AddPaymentCardScreen()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new card")
                        Spacer()
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(appBlue)
                    .padding(18)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .buttonStyle(.plain)
            }
            .padding(22)

            Spacer()
        }
        .background(appBackground)
    }
}

#Preview {
    NavigationStack {
        PaymentMethodScreen()
    }
}
