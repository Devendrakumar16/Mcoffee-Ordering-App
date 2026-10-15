import SwiftUI

struct NewsScreen: View {
    private let news = [
        ("New seasonal raf is here", "Try a soft vanilla and cream recipe.", "newspaper.fill"),
        ("How to choose beans", "A quick guide to origin and roast.", "leaf.fill"),
        ("Meet our barista", "David shares his favorite espresso.", "person.fill")
    ]

    var body: some View {
        VStack(spacing: 0) {
            TabScreenTitle(title: "News")
                .padding(.horizontal, 24)
                .padding(.top, 22)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    VStack(alignment: .leading, spacing: 12) {
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.system(size: 38))
                        Text("Coffee lover's encyclopedia")
                            .font(.system(size: 24, weight: .bold))
                        Text("Short notes about beans, brewing and flavor combinations.")
                            .font(.system(size: 14))
                    }
                    .foregroundStyle(.white)
                    .padding(22)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 210)
                    .background(LinearGradient(colors: [appBlue, appPurple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

                    ForEach(news, id: \.0) { item in
                        InfoRow(icon: item.2, title: item.0, subtitle: item.1)
                    }
                }
                .padding(22)
            }
        }
        .background(appBackground)
    }
}

#Preview {
    NewsScreen()
}
