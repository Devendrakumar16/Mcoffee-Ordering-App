import SwiftUI

struct OrderTrackingScreen: View {
    private let steps = ["Order accepted", "Preparing coffee", "Ready for pickup"]

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Order status")
                .padding(.top, 18)

            VStack(spacing: 24) {
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(appBlue)
                    .frame(width: 132, height: 132)
                    .background(appBlue.opacity(0.12))
                    .clipShape(Circle())

                Text("Your cappuccino is being prepared")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)

                VStack(spacing: 0) {
                    ForEach(steps.indices, id: \.self) { index in
                        HStack(spacing: 14) {
                            Image(systemName: index < 2 ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(index < 2 ? appPurple : .gray)
                            Text(steps[index])
                                .font(.system(size: 15, weight: index == 1 ? .semibold : .regular))
                            Spacer()
                        }
                        .padding(.vertical, 13)
                    }
                }
                .padding(18)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .padding(28)

            Spacer()
        }
        .background(appBackground)
    }
}

#Preview {
    OrderTrackingScreen()
}
