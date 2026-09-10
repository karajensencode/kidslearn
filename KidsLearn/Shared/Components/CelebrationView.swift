import SwiftUI

struct CelebrationView: View {
    let score: Int
    let total: Int
    let onPlayAgain: () -> Void
    let onHome: () -> Void

    private var message: String {
        let ratio = Double(score) / Double(max(total, 1))
        if ratio >= 0.8 { return "Amazing job!" }
        if ratio >= 0.5 { return "Great trying!" }
        return "You did it!"
    }

    private var emoji: String {
        let ratio = Double(score) / Double(max(total, 1))
        if ratio >= 0.8 { return "🎉" }
        if ratio >= 0.5 { return "⭐" }
        return "🌈"
    }

    var body: some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Text(emoji)
                    .font(.system(size: 80))
                    .accessibilityHidden(true)

                Text(message)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(KidTheme.navy)
                    .multilineTextAlignment(.center)

                Text("You got \(score) out of \(total)!")
                    .font(.system(size: 22, weight: .medium, design: .rounded))
                    .foregroundStyle(KidTheme.navy.opacity(0.75))

                HStack(spacing: 8) {
                    ForEach(0..<min(score, 5), id: \.self) { _ in
                        Text("⭐")
                            .font(.system(size: 36))
                    }
                }
                .accessibilityHidden(true)

                Spacer()

                KidButton(title: "Play Again", emoji: "🔄", background: KidTheme.mint, action: onPlayAgain)
                KidButton(title: "Back Home", emoji: "🏠", background: KidTheme.lavender, action: onHome)
            }
            .padding(28)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("\(message). You got \(score) out of \(total).")
    }
}

struct FeedbackBanner: View {
    let isCorrect: Bool
    let onContinue: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text(isCorrect ? "Yes! 🌟" : "Nice try! Try again 💛")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(isCorrect ? KidTheme.teal : KidTheme.coral)
                .accessibilityLabel(isCorrect ? "Yes, that's correct!" : "Nice try. Try again.")

            if isCorrect {
                KidButton(title: "Next", emoji: "➡️", background: KidTheme.mint, action: onContinue)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.white.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
        .padding(.horizontal, 20)
    }
}
