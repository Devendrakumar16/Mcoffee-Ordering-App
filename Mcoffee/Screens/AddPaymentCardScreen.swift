import SwiftUI

struct AddPaymentCardScreen: View {
    @State private var showSavedPopup = false
    @State private var cardNumber = ""
    @State private var holderName = ""
    @State private var expiry = ""

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(title: "Add card")
                    .padding(.top, 18)

                VStack(alignment: .leading, spacing: 18) {
                    CardPreview()
                        .padding(.bottom, 10)

                    LabeledField(title: "Card number", placeholder: "0000 0000 0000 0000", text: $cardNumber)
                    LabeledField(title: "Card holder", placeholder: "Alex Brown", text: $holderName)
                    LabeledField(title: "Expiry date", placeholder: "09/28", text: $expiry)
                }
                .padding(22)

                Spacer()

                Button {
                    showSavedPopup = true
                } label: {
                    PrimaryButtonLabel(title: "Save card")
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 22)
            }
            .background(appBackground)

            if showSavedPopup {
                PopupView(
                    title: "Card saved",
                    message: "Your payment card has been added successfully.",
                    primaryTitle: "Done",
                    secondaryTitle: nil,
                    primaryAction: { showSavedPopup = false },
                    secondaryAction: nil
                )
            }
        }
    }
}

#Preview {
    AddPaymentCardScreen()
}
