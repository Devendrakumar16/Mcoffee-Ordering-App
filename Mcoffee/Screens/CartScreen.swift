import SwiftUI

struct CartScreen: View {
    @State private var showRemovePopup = false
    @State private var selectedOrderID: UUID?
    @EnvironmentObject private var orderManager: OrderManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CartHeaderView(dismiss: dismiss)
                
                if orderManager.orders.isEmpty {
                    Text("No orders yet")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(orderManager.orders) { item in
                            MyOrderRow(item: item)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 17, trailing: 0))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        selectedOrderID = item.id
                                        showRemovePopup = true
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(Color(red: 1, green: 224 / 255, blue: 224 / 255))
                                }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .frame(height: 280)
                    .padding(.top, 18)
                }
                
                Spacer()
                
                HStack(alignment: .bottom, spacing: 22) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Total Price")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color.gray.opacity(0.35))
                        
                        Text(formattedSingleLinePrice(orderManager.totalPrice))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color(red: 10 / 255, green: 31 / 255, blue: 55 / 255))
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        CheckoutScreen()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 17) {
                            Image(systemName: "cart")
                                .font(.system(size: 17, weight: .semibold))
                            Text("Next")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 135, height: 42)
                        .background(appBlue)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal, 35)
                .padding(.bottom, 28)
            }
            .background(.white)
            
            if showRemovePopup {
                PopupView(
                    title: "Remove coffee?",
                    message: "This item will be removed from your order.",
                    primaryTitle: "Remove",
                    secondaryTitle: "Cancel",
                    primaryAction: {
                        if let selectedOrderID {
                            orderManager.removeOrder(id: selectedOrderID)
                        }
                        selectedOrderID = nil
                        showRemovePopup = false
                    },
                    secondaryAction: {
                        selectedOrderID = nil
                        showRemovePopup = false
                    }
                )
            }
        }
    }

    private func formattedSingleLinePrice(_ price: Double) -> String {
        String(format: "BYN %.2f", price)
    }
}

private struct CartHeaderView: View {
    let dismiss: DismissAction

    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.black)
            }

            Spacer()

            Text("My Orders")

            Spacer()

            Button {
                popToRootViewController()
            } label: {
                Image(systemName: "house")
                    .foregroundStyle(.black)
            }
            .accessibilityLabel("Home")
        }
        .font(.title3)
        .padding(.vertical)
        .padding(.horizontal, 26)
    }

    private func popToRootViewController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        findNavigationController(from: rootViewController)?.popToRootViewController(animated: true)
    }

    private func findNavigationController(from viewController: UIViewController) -> UINavigationController? {
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for child in viewController.children {
            if let navigationController = findNavigationController(from: child) {
                return navigationController
            }
        }

        return viewController.presentedViewController.flatMap(findNavigationController)
    }
}
    
    private struct MyOrderRow: View {
        let item: OrderItem
        
        var body: some View {
            HStack(spacing: 9) {
                Image(item.coffee.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 69)
                
                VStack(alignment: .leading, spacing: 7) {
                    Text(item.coffee.name)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color(red: 10 / 255, green: 31 / 255, blue: 55 / 255))
                    
                    Text(item.details)
                        .font(.system(size: 10))
                        .foregroundStyle(Color.gray.opacity(0.55))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                    
                    Text("x \(item.quantity)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color(red: 10 / 255, green: 31 / 255, blue: 55 / 255))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(formattedMultilinePrice(item.totalPrice))
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color(red: 10 / 255, green: 31 / 255, blue: 55 / 255))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)
            }
            .padding(.trailing, 17)
            .frame(height: 80)
            .frame(maxWidth: .infinity)
            .background(Color(red: 248 / 255, green: 249 / 255, blue: 252 / 255))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .padding(.leading, 27)
            .padding(.trailing, 31)
        }

        private func formattedMultilinePrice(_ price: Double) -> String {
            String(format: "BYN\n%.2f", price)
        }
    }
    
    #Preview {
        NavigationStack {
            CartScreen()
                .environmentObject(OrderManager())
        }
    }
    

