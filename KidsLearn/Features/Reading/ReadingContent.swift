import Foundation

enum ReadingContent {
    private static let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

    private static let phonics: [(letter: String, sound: String, example: String, emoji: String)] = [
        ("A", "a as in apple", "apple", "🍎"),
        ("B", "b as in ball", "ball", "⚽"),
        ("C", "c as in cat", "cat", "🐱"),
        ("D", "d as in dog", "dog", "🐶"),
        ("E", "e as in egg", "egg", "🥚"),
        ("F", "f as in fish", "fish", "🐟"),
        ("G", "g as in goat", "goat", "🐐"),
        ("H", "h as in hat", "hat", "🎩"),
        ("I", "i as in igloo", "igloo", "🏠"),
        ("J", "j as in jump", "jump", "🦘"),
        ("K", "k as in kite", "kite", "🪁"),
        ("L", "l as in lion", "lion", "🦁"),
        ("M", "m as in moon", "moon", "🌙"),
        ("N", "n as in nest", "nest", "🪺"),
        ("O", "o as in octopus", "octopus", "🐙"),
        ("P", "p as in pig", "pig", "🐷"),
        ("Q", "q as in queen", "queen", "👑"),
        ("R", "r as in rain", "rain", "🌧️"),
        ("S", "s as in sun", "sun", "☀️"),
        ("T", "t as in tree", "tree", "🌳"),
        ("U", "u as in umbrella", "umbrella", "☂️"),
        ("V", "v as in van", "van", "🚐"),
        ("W", "w as in water", "water", "💧"),
        ("X", "x as in fox", "fox", "🦊"),
        ("Y", "y as in yellow", "yellow", "💛"),
        ("Z", "z as in zebra", "zebra", "🦓")
    ]

    private static let sightWords = [
        "cat", "dog", "sun", "hat", "pen", "cup", "bus", "pig",
        "map", "bed", "red", "big", "hot", "run", "sit", "mop",
        "fan", "jam", "net", "box", "fox", "bug", "mud", "top"
    ]

    static func letterQuestions(count: Int = 6) -> [QuizQuestion] {
        let letters = alphabet.shuffled().prefix(count)
        return letters.map { letter in
            let correct = String(letter)
            var choices = [correct]
            while choices.count < 4 {
                let distractor = String(alphabet.randomElement()!)
                if !choices.contains(distractor) {
                    choices.append(distractor)
                }
            }
            choices.shuffle()
            return QuizQuestion(
                prompt: "Find the letter \(correct)",
                promptEmoji: "🔤",
                choices: choices,
                correctIndex: choices.firstIndex(of: correct)!,
                accessibilityHint: "Find the letter \(correct)"
            )
        }
    }

    static func phonicsQuestions(count: Int = 6) -> [QuizQuestion] {
        Array(phonics.shuffled().prefix(count)).map { item in
            var choices = [item.example]
            let others = phonics.map(\.example).filter { $0 != item.example }.shuffled()
            choices.append(contentsOf: others.prefix(3))
            choices.shuffle()
            return QuizQuestion(
                prompt: "Which word starts with \(item.letter)?",
                promptEmoji: item.emoji,
                choices: choices.map { $0.capitalized },
                correctIndex: choices.firstIndex(of: item.example)!,
                accessibilityHint: "Which word starts with the letter \(item.letter)? Sound: \(item.sound)"
            )
        }
    }

    static func sightWordQuestions(count: Int = 6) -> [QuizQuestion] {
        Array(sightWords.shuffled().prefix(count)).map { word in
            var choices = [word]
            let others = sightWords.filter { $0 != word }.shuffled()
            choices.append(contentsOf: others.prefix(3))
            choices.shuffle()
            return QuizQuestion(
                prompt: "Find the word: \(word)",
                promptEmoji: "👀",
                choices: choices,
                correctIndex: choices.firstIndex(of: word)!,
                accessibilityHint: "Find the word \(word.enumerated().map { String($0.element) }.joined(separator: " "))"
            )
        }
    }
}
