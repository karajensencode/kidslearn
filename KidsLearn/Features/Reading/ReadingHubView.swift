import SwiftUI

struct ReadingHubView: View {
    private let activities: [LearningActivity] = [.letters, .phonics, .sightWords]

    var body: some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("📚 Reading")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(KidTheme.navy)
                        .padding(.top, 8)
                        .accessibilityAddTraits(.isHeader)

                    Text("Tap a game to start!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(KidTheme.navy.opacity(0.7))

                    ForEach(activities) { activity in
                        NavigationLink {
                            ReadingSessionLauncher(activity: activity)
                        } label: {
                            ActivityCard(
                                title: activity.title,
                                subtitle: activity.subtitle,
                                emoji: activity.emoji,
                                tint: KidTheme.coral
                            )
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("\(activity.title). \(activity.subtitle)")
                    }
                }
                .padding(24)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActivityCard: View {
    let title: String
    let subtitle: String
    let emoji: String
    let tint: Color

    var body: some View {
        HStack(spacing: 16) {
            Text(emoji)
                .font(.system(size: 44))
                .frame(width: 70, height: 70)
                .background(tint.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(KidTheme.navy)
                Text(subtitle)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundStyle(KidTheme.navy.opacity(0.65))
            }

            Spacer()

            Image(systemName: "play.circle.fill")
                .font(.system(size: 36))
                .foregroundStyle(tint)
                .accessibilityHidden(true)
        }
        .padding(18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: KidTheme.cardRadius, style: .continuous))
        .shadow(color: tint.opacity(0.25), radius: 10, y: 5)
    }
}

struct ReadingSessionLauncher: View {
    let activity: LearningActivity

    private var questions: [QuizQuestion] {
        switch activity {
        case .letters: return ReadingContent.letterQuestions()
        case .phonics: return ReadingContent.phonicsQuestions()
        case .sightWords: return ReadingContent.sightWordQuestions()
        default: return []
        }
    }

    var body: some View {
        QuizSessionView(
            title: activity.title,
            emoji: activity.emoji,
            questions: questions,
            accent: KidTheme.coral
        )
    }
}
