import SwiftUI

// MARK: - Model

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timestamp: Date
}

// MARK: - Main View

struct CoffeeChatView: View {

    @State private var messageText = ""

    @State private var messages: [ChatMessage] = [
        ChatMessage(
            text: "Hi Dev 👋\nHow can I help you today?",
            isUser: false,
            timestamp: Date()
        )
    ]

    var body: some View {

        ZStack {

            backgroundView

            VStack(spacing: 16) {

                headerView

                chatMessagesView

                inputBar
            }
            .padding(.vertical)
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Background

extension CoffeeChatView {

    private var backgroundView: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 0.12, green: 0.08, blue: 0.06),
                    Color(red: 0.22, green: 0.15, blue: 0.10),
                    Color(red: 0.35, green: 0.25, blue: 0.18)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(.white.opacity(0.08))
                .frame(width: 300)
                .blur(radius: 100)
                .offset(x: -150, y: -250)

            Circle()
                .fill(.orange.opacity(0.15))
                .frame(width: 250)
                .blur(radius: 100)
                .offset(x: 140, y: 250)
        }
    }
}

// MARK: - Header

extension CoffeeChatView {

    private var headerView: some View {

        HStack(spacing: 12) {

            Circle()
                .fill(
                    LinearGradient(
                        colors: [.orange, .brown],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 55, height: 55)
                .overlay {
                    Image(systemName: "cup.and.saucer.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }

            VStack(alignment: .leading, spacing: 4) {

                Text("Coffee Assistant")
                    .font(.headline)
                    .fontWeight(.semibold)

                HStack(spacing: 6) {

                    Circle()
                        .fill(.green)
                        .frame(width: 8, height: 8)

                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
            }

            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
            )
        )
        .overlay {
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.15))
        }
        .padding(.horizontal)
    }
}

// MARK: - Messages

extension CoffeeChatView {

    private var chatMessagesView: some View {

        ScrollViewReader { proxy in

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 16) {

                    ForEach(messages) { message in
                        MessageBubble(message: message)
                            .id(message.id)
                    }
                }
                .padding()
            }
            .onChange(of: messages.count) { _, _ in

                if let last = messages.last {

                    withAnimation(.easeInOut) {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }
        }
    }
}

// MARK: - Input Bar

extension CoffeeChatView {

    private var inputBar: some View {

        HStack(spacing: 12) {

            TextField(
                "Ask anything about coffee...",
                text: $messageText,
                axis: .vertical
            )
            .foregroundColor(.white)
            .lineLimit(1...4)

            Button {

                sendMessage()

            } label: {

                Image(systemName: "arrow.up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(
                        LinearGradient(
                            colors: [.orange, .brown],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .overlay {
            Capsule()
                .stroke(.white.opacity(0.15))
        }
        .clipShape(Capsule())
        .padding(.horizontal)
    }

    private func sendMessage() {

        let text = messageText.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !text.isEmpty else { return }

        messages.append(
            ChatMessage(
                text: text,
                isUser: true,
                timestamp: Date()
            )
        )

        messageText = ""

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            messages.append(
                ChatMessage(
                    text: "Thanks for your message ☕",
                    isUser: false,
                    timestamp: Date()
                )
            )
        }
    }
}

// MARK: - Bubble

struct MessageBubble: View {

    let message: ChatMessage

    var body: some View {

        HStack {

            if message.isUser {

                Spacer(minLength: 60)

                VStack(alignment: .trailing, spacing: 4) {

                    Text(message.text)
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(
                                colors: [.orange, .brown],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(.white.opacity(0.2))
                        }
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 26,
                                style: .continuous
                            )
                        )
                        .shadow(
                            color: .orange.opacity(0.4),
                            radius: 15,
                            y: 8
                        )

                    Text(timeString)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }

            } else {

                VStack(alignment: .leading, spacing: 4) {

                    Text(message.text)
                        .padding()
                        .foregroundColor(.white)
                        .background(.ultraThinMaterial)
                        .overlay {
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(.white.opacity(0.15))
                        }
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 26,
                                style: .continuous
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.2),
                            radius: 15,
                            y: 8
                        )

                    Text(timeString)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }

                Spacer(minLength: 60)
            }
        }
    }

    private var timeString: String {

        let formatter = DateFormatter()
        formatter.timeStyle = .short

        return formatter.string(from: message.timestamp)
    }
}

// MARK: - Preview

#Preview {
    CoffeeChatView()
}
