import Foundation

enum MathContent {
    private static let countEmojis = ["⭐", "🍎", "🐶", "🔵", "🐟", "🌸", "🎈", "🧁"]

    static func countingQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let n = Int.random(in: 1...20)
            let emoji = countEmojis.randomElement()!
            let visual = String(repeating: emoji, count: min(n, 12)) + (n > 12 ? " +\(n - 12)" : "")
            var choices = [String(n)]
            while choices.count < 4 {
                let d = Int.random(in: 1...20)
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "How many?",
                promptEmoji: visual,
                choices: choices,
                correctIndex: choices.firstIndex(of: String(n))!,
                accessibilityHint: "How many are there? Count the pictures."
            )
        }
    }

    static func additionQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let a = Int.random(in: 1...9)
            let b = Int.random(in: 1...min(10 - a, 9))
            let sum = a + b
            var choices = [String(sum)]
            while choices.count < 4 {
                let d = Int.random(in: max(1, sum - 4)...(sum + 4))
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "\(a) + \(b) = ?",
                promptEmoji: "➕",
                choices: choices,
                correctIndex: choices.firstIndex(of: String(sum))!,
                accessibilityHint: "What is \(a) plus \(b)?"
            )
        }
    }

    static func subtractionQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let a = Int.random(in: 3...12)
            let b = Int.random(in: 1...a)
            let diff = a - b
            var choices = [String(diff)]
            while choices.count < 4 {
                let d = Int.random(in: 0...(a + 2))
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "\(a) − \(b) = ?",
                promptEmoji: "➖",
                choices: choices,
                correctIndex: choices.firstIndex(of: String(diff))!,
                accessibilityHint: "What is \(a) minus \(b)?"
            )
        }
    }

    static func numberBondQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let target = Bool.random() ? 5 : 10
            let a = Int.random(in: 0...target)
            let b = target - a
            var choices = [String(b)]
            while choices.count < 4 {
                let d = Int.random(in: 0...target)
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "\(a) + ? = \(target)",
                promptEmoji: "🔗",
                choices: choices,
                correctIndex: choices.firstIndex(of: String(b))!,
                accessibilityHint: "\(a) plus what equals \(target)?"
            )
        }
    }

    static func multiplicationQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let groups = Int.random(in: 2...4)
            let each = Int.random(in: 2...5)
            let product = groups * each
            let visual = Array(repeating: String(repeating: "🔵", count: each), count: groups)
                .joined(separator: "  ")
            var choices = [String(product)]
            while choices.count < 4 {
                let d = Int.random(in: 2...20)
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "\(groups) groups of \(each). How many?",
                promptEmoji: visual,
                choices: choices,
                correctIndex: choices.firstIndex(of: String(product))!,
                accessibilityHint: "There are \(groups) groups of \(each). How many in all?"
            )
        }
    }

    static func divisionQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let groups = Int.random(in: 2...4)
            let each = Int.random(in: 2...5)
            let total = groups * each
            var choices = [String(each)]
            while choices.count < 4 {
                let d = Int.random(in: 1...8)
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "Share \(total) into \(groups) equal groups. How many in each?",
                promptEmoji: String(repeating: "🍪", count: min(total, 12)),
                choices: choices,
                correctIndex: choices.firstIndex(of: String(each))!,
                accessibilityHint: "Share \(total) cookies into \(groups) equal groups. How many in each group?"
            )
        }
    }

    static func groupingQuestions(count: Int = 6) -> [QuizQuestion] {
        (0..<count).map { _ in
            let size = Int.random(in: 2...4)
            let groups = Int.random(in: 2...5)
            let total = size * groups
            var choices = [String(groups)]
            while choices.count < 4 {
                let d = Int.random(in: 1...8)
                if !choices.contains(String(d)) { choices.append(String(d)) }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "\(total) stars. Groups of \(size). How many groups?",
                promptEmoji: String(repeating: "⭐", count: min(total, 12)),
                choices: choices,
                correctIndex: choices.firstIndex(of: String(groups))!,
                accessibilityHint: "You have \(total) stars. Put them in groups of \(size). How many groups?"
            )
        }
    }
}
