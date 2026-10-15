import SwiftUI

struct RewardsScreen: View {
    private let rewards = [
        ("Free cappuccino", "80 pts", "gift.fill"),
        ("Double espresso day", "+2x", "bolt.fill"),
        ("Birthday drink", "Free", "sparkles")
    ]

    var body: some View {
        VStack(spacing: 0) {
            TabScreenTitle(title: "Bonuses")
                .padding(.horizontal, 24)
                .padding(.top, 22)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Magic points")
                            .foregroundStyle(.white.opacity(0.8))
                        Text("420")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundStyle(.white)
                        ProgressView(value: 0.7)
                            .tint(appPurple)
                        Text("180 points until your next free coffee")
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.78))
                    }
                    .padding(22)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(appBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

                    ForEach(rewards, id: \.0) { reward in
                        InfoRow(icon: reward.2, title: reward.0, subtitle: reward.1)
                    }
                }
                .padding(22)
            }
        }
        .background(appBackground)
    }
}

#Preview {
    RewardsScreen()
}
