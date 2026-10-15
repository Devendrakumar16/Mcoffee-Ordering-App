import SwiftUI

let appBlue = Color(red: 50 / 255, green: 74 / 255, blue: 89 / 255)
let appPurple = Color(red: 192 / 255, green: 105 / 255, blue: 222 / 255)
let appBackground = Color(red: 247 / 255, green: 247 / 255, blue: 249 / 255)

struct CartItemRow: View {
    let name: String
    let details: String
    let price: String
    let image: String
    let removeAction: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(10)
                .background(Color.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .font(.system(size: 17, weight: .semibold))
                Text(details)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                Text(price)
                    .font(.system(size: 14, weight: .bold))
            }

            Spacer()

            Button(action: removeAction) {
                Image(systemName: "trash")
                    .foregroundStyle(.gray)
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct CheckoutOptionRow: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .foregroundStyle(appBlue)
                .frame(width: 36, height: 36)
                .background(appBlue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
            }

            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding(18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct CheckoutSummaryRow: View {
    let title: String
    let value: String
    var isStrong = false

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 15, weight: isStrong ? .bold : .regular))
            Spacer()
            Text(value)
                .font(.system(size: 15, weight: isStrong ? .bold : .regular))
        }
    }
}

struct PrimaryButtonLabel: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct PopupView: View {
    let title: String
    let message: String
    let primaryTitle: String
    let secondaryTitle: String?
    let primaryAction: () -> Void
    let secondaryAction: (() -> Void)?

    var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 42))
                    .foregroundStyle(appPurple)

                Text(title)
                    .font(.system(size: 22, weight: .bold))

                Text(message)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)

                Button(action: primaryAction) {
                    PrimaryButtonLabel(title: primaryTitle)
                }

                if let secondaryTitle, let secondaryAction {
                    Button(secondaryTitle, action: secondaryAction)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(appBlue)
                }
            }
            .padding(24)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .padding(.horizontal, 36)
        }
    }
}

struct MapMockView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(red: 240 / 255, green: 242 / 255, blue: 243 / 255)
                street(width: proxy.size.width * 1.3, rotation: -28, x: proxy.size.width * 0.52, y: proxy.size.height * 0.35)
                street(width: proxy.size.width * 1.2, rotation: 58, x: proxy.size.width * 0.55, y: proxy.size.height * 0.42)
                street(width: proxy.size.width * 1.2, rotation: -28, x: proxy.size.width * 0.42, y: proxy.size.height * 0.62)

                Text("University of Bradford")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.gray)
                    .position(x: proxy.size.width * 0.38, y: proxy.size.height * 0.72)

                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 38))
                    .foregroundStyle(appBlue)
                    .position(x: proxy.size.width * 0.58, y: proxy.size.height * 0.48)
            }
        }
    }

    private func street(width: CGFloat, rotation: Double, x: CGFloat, y: CGFloat) -> some View {
        Rectangle()
            .fill(.white)
            .frame(width: width, height: 18)
            .rotationEffect(.degrees(rotation))
            .position(x: x, y: y)
    }
}

struct LabeledField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.gray)
            TextField(placeholder, text: $text)
                .padding(16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }
}

struct CardPreview: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Magic Coffee")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
            Text("****  ****  ****  2042")
                .font(.system(size: 20, weight: .bold))
            Text("Alex Brown")
                .font(.system(size: 13))
        }
        .foregroundStyle(.white)
        .padding(22)
        .frame(maxWidth: .infinity)
        .frame(height: 190)
        .background(LinearGradient(colors: [appBlue, appPurple], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

struct InfoRow: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .foregroundStyle(appBlue)
                .frame(width: 44, height: 44)
                .background(appBlue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

struct TabScreenTitle: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
    }
}
