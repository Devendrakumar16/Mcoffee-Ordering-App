import SwiftUI

struct CafeSelectionScreen: View {
    @State private var selectedCafe = "Magic Coffee"

    private let cafes = [
        ("Magic Coffee", "0.7 km", "42 University Road"),
        ("Coffee Room", "1.2 km", "18 Listerhills Road"),
        ("Espresso Bar", "1.9 km", "7 Thornton Road")
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            MapMockView()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HeaderView(title: "Nearest coffee houses")
                    .padding(.top, 18)
                Spacer()
            }

            VStack(spacing: 14) {
                Text("Choose coffee house")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                ForEach(cafes, id: \.0) { cafe in
                    Button {
                        selectedCafe = cafe.0
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "cup.and.saucer.fill")
                                .foregroundStyle(.white)
                                .frame(width: 38, height: 38)
                                .background(.white.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                            VStack(alignment: .leading, spacing: 4) {
                                Text(cafe.0)
                                    .font(.system(size: 15, weight: .semibold))
                                Text(cafe.2)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white.opacity(0.75))
                            }

                            Spacer()
                            Text(cafe.1)
                                .font(.system(size: 13, weight: .medium))
                        }
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(selectedCafe == cafe.0 ? appPurple : appPurple.opacity(0.78))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 24)
                }
            }
            .padding(.top, 24)
            .padding(.bottom, 32)
            .background(appBlue)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 34, topTrailingRadius: 34))
        }
    }
}

#Preview {
    CafeSelectionScreen()
}
