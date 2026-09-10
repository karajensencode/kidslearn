import SwiftUI

enum KidTheme {
    static let coral = Color(red: 1.0, green: 0.45, blue: 0.45)
    static let peach = Color(red: 1.0, green: 0.72, blue: 0.45)
    static let mint = Color(red: 0.35, green: 0.85, blue: 0.65)
    static let teal = Color(red: 0.25, green: 0.7, blue: 0.75)
    static let lavender = Color(red: 0.7, green: 0.55, blue: 0.95)
    static let purple = Color(red: 0.55, green: 0.4, blue: 0.9)
    static let sunny = Color(red: 1.0, green: 0.85, blue: 0.3)
    static let sky = Color(red: 0.55, green: 0.8, blue: 1.0)
    static let navy = Color(red: 0.15, green: 0.22, blue: 0.4)
    static let cream = Color(red: 1.0, green: 0.98, blue: 0.94)
    static let softPink = Color(red: 1.0, green: 0.75, blue: 0.8)
    static let softBlue = Color(red: 0.7, green: 0.85, blue: 1.0)
    static let softGreen = Color(red: 0.7, green: 0.92, blue: 0.75)
    static let softYellow = Color(red: 1.0, green: 0.92, blue: 0.6)

    static var skyGradient: LinearGradient {
        LinearGradient(
            colors: [sky.opacity(0.5), cream, softPink.opacity(0.3)],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    static let largeTap: CGFloat = 64
    static let cardRadius: CGFloat = 24
}
