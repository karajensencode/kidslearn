import SwiftUI

struct ProgressStars: View {
    let current: Int
    let total: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<total, id: \.self) { index in
                Image(systemName: index < current ? "star.fill" : "star")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(index < current ? KidTheme.sunny : KidTheme.navy.opacity(0.2))
                    .accessibilityHidden(true)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Question \(min(current + 1, total)) of \(total)")
    }
}

struct SessionProgressBar: View {
    let current: Int
    let total: Int

    var body: some View {
        VStack(spacing: 8) {
            ProgressStars(current: current, total: total)
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(KidTheme.navy.opacity(0.1))
                    Capsule()
                        .fill(KidTheme.mint)
                        .frame(width: geo.size.width * CGFloat(current) / CGFloat(max(total, 1)))
                }
            }
            .frame(height: 10)
            .accessibilityHidden(true)
        }
    }
}
