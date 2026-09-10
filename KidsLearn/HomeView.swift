import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                KidTheme.skyGradient
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 28) {
                        header

                        NavigationLink {
                            ReadingHubView()
                        } label: {
                            HubCard(
                                title: "Reading",
                                subtitle: "Letters, sounds & words",
                                emoji: "📚",
                                colors: [KidTheme.coral, KidTheme.peach]
                            )
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Reading. Letters, sounds and words.")

                        NavigationLink {
                            MathHubView()
                        } label: {
                            HubCard(
                                title: "Math",
                                subtitle: "Count, add & share",
                                emoji: "🔢",
                                colors: [KidTheme.mint, KidTheme.teal]
                            )
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Math. Count, add and share.")

                        NavigationLink {
                            ScienceHubView()
                        } label: {
                            HubCard(
                                title: "Science",
                                subtitle: "Animals, weather & more",
                                emoji: "🔬",
                                colors: [KidTheme.lavender, KidTheme.purple]
                            )
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("Science. Animals, weather and more.")
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 32)
                }
            }
            .navigationBarHidden(true)
        }
    }

    private var header: some View {
        VStack(spacing: 8) {
            Text("🌟")
                .font(.system(size: 56))
                .accessibilityHidden(true)
            Text("KidsLearn")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundStyle(KidTheme.navy)
            Text("Let's play and learn!")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundStyle(KidTheme.navy.opacity(0.7))
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("KidsLearn. Let's play and learn!")
    }
}

struct HubCard: View {
    let title: String
    let subtitle: String
    let emoji: String
    let colors: [Color]

    var body: some View {
        HStack(spacing: 20) {
            Text(emoji)
                .font(.system(size: 52))
                .frame(width: 72, height: 72)
                .background(.white.opacity(0.35))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text(subtitle)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.9))
            }

            Spacer()

            Image(systemName: "chevron.right.circle.fill")
                .font(.system(size: 32))
                .foregroundStyle(.white.opacity(0.9))
                .accessibilityHidden(true)
        }
        .padding(22)
        .frame(maxWidth: .infinity, minHeight: 110)
        .background(
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: colors.first?.opacity(0.4) ?? .clear, radius: 12, y: 6)
    }
}

#Preview {
    HomeView()
}
