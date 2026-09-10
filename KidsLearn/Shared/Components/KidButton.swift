import SwiftUI

struct KidButton: View {
    let title: String
    var emoji: String? = nil
    var background: Color = KidTheme.coral
    var foreground: Color = .white
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if let emoji {
                    Text(emoji)
                        .font(.system(size: 28))
                        .accessibilityHidden(true)
                }
                Text(title)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
            }
            .foregroundStyle(foreground)
            .frame(maxWidth: .infinity)
            .frame(minHeight: KidTheme.largeTap)
            .padding(.horizontal, 20)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: background.opacity(0.35), radius: 8, y: 4)
        }
        .buttonStyle(BounceButtonStyle())
        .accessibilityLabel(title)
    }
}

struct ChoiceButton: View {
    let title: String
    var isSelected: Bool = false
    var isCorrect: Bool? = nil
    let action: () -> Void

    private var fill: Color {
        if let isCorrect {
            return isCorrect ? KidTheme.mint : KidTheme.coral
        }
        return isSelected ? KidTheme.softBlue : .white
    }

    private var border: Color {
        if let isCorrect {
            return isCorrect ? KidTheme.teal : KidTheme.coral
        }
        return isSelected ? KidTheme.sky : KidTheme.navy.opacity(0.15)
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundStyle(KidTheme.navy)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(minHeight: KidTheme.largeTap + 8)
                .padding(.horizontal, 12)
                .background(fill)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(border, lineWidth: 3)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
        }
        .buttonStyle(BounceButtonStyle())
        .accessibilityLabel(title)
    }
}

struct BounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
