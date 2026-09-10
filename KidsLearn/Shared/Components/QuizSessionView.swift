import SwiftUI
import UIKit

struct QuizSessionView: View {
    let title: String
    let emoji: String
    let questions: [QuizQuestion]
    let accent: Color

    @Environment(\.dismiss) private var dismiss
    @State private var index = 0
    @State private var score = 0
    @State private var selected: Int? = nil
    @State private var showedWrong = false
    @State private var finished = false

    private var question: QuizQuestion? {
        guard index < questions.count else { return nil }
        return questions[index]
    }

    var body: some View {
        Group {
            if finished {
                CelebrationView(
                    score: score,
                    total: questions.count,
                    onPlayAgain: reset,
                    onHome: { dismiss() }
                )
            } else if let question {
                sessionBody(question)
            } else {
                Color.clear.onAppear { finished = true }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 6) {
                    Text(emoji)
                    Text(title)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                }
                .accessibilityElement(children: .combine)
            }
        }
    }

    private func sessionBody(_ q: QuizQuestion) -> some View {
        ZStack {
            KidTheme.skyGradient.ignoresSafeArea()

            VStack(spacing: 20) {
                SessionProgressBar(current: index, total: questions.count)
                    .padding(.horizontal, 24)
                    .padding(.top, 8)

                Spacer(minLength: 8)

                if let emoji = q.promptEmoji {
                    Text(emoji)
                        .font(.system(size: 72))
                        .accessibilityHidden(true)
                }

                Text(q.prompt)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(KidTheme.navy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .accessibilityLabel(q.accessibilityHint ?? q.prompt)

                Spacer(minLength: 8)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                    ForEach(Array(q.choices.enumerated()), id: \.offset) { i, choice in
                        ChoiceButton(
                            title: choice,
                            isSelected: selected == i,
                            isCorrect: feedback(for: i, question: q),
                            action: { pick(i, question: q) }
                        )
                        .disabled(selected != nil && showedWrong == false && selected == q.correctIndex)
                    }
                }
                .padding(.horizontal, 20)

                if let selected, selected == q.correctIndex {
                    FeedbackBanner(isCorrect: true, onContinue: advance)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                } else if showedWrong {
                    FeedbackBanner(isCorrect: false, onContinue: {})
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                Spacer(minLength: 12)
            }
            .animation(.spring(response: 0.35), value: selected)
            .animation(.spring(response: 0.35), value: showedWrong)
        }
    }

    private func feedback(for i: Int, question: QuizQuestion) -> Bool? {
        guard let selected else { return nil }
        if selected == question.correctIndex {
            return i == question.correctIndex ? true : nil
        }
        if showedWrong && i == selected {
            return false
        }
        return nil
    }

    private func pick(_ i: Int, question: QuizQuestion) {
        if selected == question.correctIndex { return }

        selected = i
        if i == question.correctIndex {
            if !showedWrong {
                score += 1
            }
            showedWrong = false
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } else {
            showedWrong = true
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                if self.selected == i {
                    self.selected = nil
                    self.showedWrong = false
                }
            }
        }
    }

    private func advance() {
        if index + 1 >= questions.count {
            finished = true
        } else {
            index += 1
            selected = nil
            showedWrong = false
        }
    }

    private func reset() {
        index = 0
        score = 0
        selected = nil
        showedWrong = false
        finished = false
    }
}
