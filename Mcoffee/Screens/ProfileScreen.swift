import SwiftUI

struct ProfileScreen: View {
    private let rows = [
        ("person.text.rectangle", "Personal information"),
        ("clock.arrow.circlepath", "Order history"),
        ("mappin.and.ellipse", "Addresses"),
        ("creditcard", "Payment methods")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Profile")
                .padding(.top, 18)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(appBlue)
                        Text("Alex")
                            .font(.system(size: 24, weight: .bold))
                        Text("alex@mail.com")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

                    VStack(spacing: 0) {
                        ForEach(rows, id: \.1) { row in
                            InfoRow(icon: row.0, title: row.1, subtitle: "")
                        }
                    }
                }
                .padding(22)
            }
        }
        .background(appBackground)
    }
}

#Preview {
    ProfileScreen()
}
