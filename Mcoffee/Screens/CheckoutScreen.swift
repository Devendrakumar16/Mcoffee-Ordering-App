import SwiftUI

struct CheckoutScreen: View {
    @State private var showOrderPopup = false
    @State private var goToTracking = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderView(title: "Checkout")
                    .padding(.top, 18)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        NavigationLink {
                            CafeSelectionScreen()
                                .navigationBarBackButtonHidden()
                        } label: {
                            CheckoutOptionRow(icon: "mappin.and.ellipse", title: "Coffee house", subtitle: "Magic Coffee, 42 University Road")
                        }
                        .buttonStyle(.plain)

                        NavigationLink {
                            PaymentMethodScreen()
                                .navigationBarBackButtonHidden()
                        } label: {
                            CheckoutOptionRow(icon: "creditcard", title: "Payment method", subtitle: "Visa ending in 2042")
                        }
                        .buttonStyle(.plain)

                        VStack(spacing: 14) {
                            CheckoutSummaryRow(title: "Order", value: "BYN 5.30")
                            CheckoutSummaryRow(title: "Service", value: "BYN 0.00")
                            Divider()
                            CheckoutSummaryRow(title: "Total Amount", value: "BYN 5.30", isStrong: true)
                        }
                        .padding(18)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 26)
                }

                Button {
                    showOrderPopup = true
                } label: {
                    PrimaryButtonLabel(title: "Pay and Order")
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 22)
            }
            .background(appBackground)
            .navigationDestination(isPresented: $goToTracking) {
                OrderTrackingScreen()
                    .navigationBarBackButtonHidden()
            }

            if showOrderPopup {
                PopupView(
                    title: "Order accepted",
                    message: "Your coffee is being prepared. Track the order status now.",
                    primaryTitle: "Track order",
                    secondaryTitle: "Close",
                    primaryAction: {
                        showOrderPopup = false
                        goToTracking = true
                    },
                    secondaryAction: { showOrderPopup = false }
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        CheckoutScreen()
    }
}
