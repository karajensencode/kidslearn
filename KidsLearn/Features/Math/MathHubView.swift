import SwiftUI

struct MathHubView: View {
    private let activities: [LearningActivity] = [
        .counting, .addition, .subtraction, .numberBonds,
        .multiplication, .division, .grouping
    ]

    var body: some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("🔢 Math")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(KidTheme.navy)
                        .padding(.top, 8)
                        .accessibilityAddTraits(.isHeader)

                    Text("Tap a game to start!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(KidTheme.navy.opacity(0.7))

                    ForEach(activities) { activity in
                        NavigationLink {
                            MathSessionLauncher(activity: activity)
                        } label: {
                            ActivityCard(
                                title: activity.title,
                                subtitle: activity.subtitle,
                                emoji: activity.emoji,
                                tint: KidTheme.mint
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

struct MathSessionLauncher: View {
    let activity: LearningActivity

    private var questions: [QuizQuestion] {
        switch activity {
        case .counting: return MathContent.countingQuestions()
        case .addition: return MathContent.additionQuestions()
        case .subtraction: return MathContent.subtractionQuestions()
        case .numberBonds: return MathContent.numberBondQuestions()
        case .multiplication: return MathContent.multiplicationQuestions()
        case .division: return MathContent.divisionQuestions()
        case .grouping: return MathContent.groupingQuestions()
        default: return []
        }
    }

    var body: some View {
        QuizSessionView(
            title: activity.title,
            emoji: activity.emoji,
            questions: questions,
            accent: KidTheme.mint
        )
    }
}
