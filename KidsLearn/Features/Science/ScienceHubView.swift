import SwiftUI

struct ScienceHubView: View {
    private let activities: [LearningActivity] = [
        .animals, .weather, .plants, .senses, .sunMoon
    ]

    var body: some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("🔬 Science")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(KidTheme.navy)
                        .padding(.top, 8)
                        .accessibilityAddTraits(.isHeader)

                    Text("Explore facts, then play a quiz!")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(KidTheme.navy.opacity(0.7))
                        .multilineTextAlignment(.center)

                    ForEach(activities) { activity in
                        NavigationLink {
                            ScienceTopicView(activity: activity)
                        } label: {
                            ActivityCard(
                                title: activity.title,
                                subtitle: activity.subtitle,
                                emoji: activity.emoji,
                                tint: KidTheme.lavender
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

struct ScienceTopicView: View {
    let activity: LearningActivity

    private var facts: [ScienceFact] {
        ScienceContent.facts(for: activity)
    }

    var body: some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {
                    Text("\(activity.emoji) \(activity.title)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(KidTheme.navy)
                        .accessibilityAddTraits(.isHeader)

                    ForEach(facts) { fact in
                        ScienceFactCard(fact: fact)
                    }

                    NavigationLink {
                        QuizSessionView(
                            title: "\(activity.title) Quiz",
                            emoji: activity.emoji,
                            questions: ScienceContent.quizQuestions(for: activity),
                            accent: KidTheme.lavender
                        )
                    } label: {
                        HStack {
                            Text("🎮")
                            Text("Play Quiz")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: KidTheme.largeTap)
                        .background(KidTheme.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: KidTheme.purple.opacity(0.35), radius: 8, y: 4)
                    }
                    .buttonStyle(BounceButtonStyle())
                    .accessibilityLabel("Play \(activity.title) quiz")
                    .padding(.top, 8)
                }
                .padding(24)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ScienceFactCard: View {
    let fact: ScienceFact

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(spacing: 6) {
                Text(fact.emoji)
                    .font(.system(size: 40))
                if let symbol = fact.symbolName {
                    Image(systemName: symbol)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(KidTheme.purple)
                }
            }
            .frame(width: 60)
            .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 6) {
                Text(fact.title)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(KidTheme.navy)
                Text(fact.body)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundStyle(KidTheme.navy.opacity(0.75))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: KidTheme.cardRadius, style: .continuous))
        .shadow(color: KidTheme.lavender.opacity(0.25), radius: 8, y: 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(fact.title). \(fact.body)")
    }
}
