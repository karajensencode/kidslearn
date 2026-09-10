import Foundation

struct QuizQuestion: Identifiable, Equatable {
    let id = UUID()
    let prompt: String
    let promptEmoji: String?
    let choices: [String]
    let correctIndex: Int
    let accessibilityHint: String?

    init(
        prompt: String,
        promptEmoji: String? = nil,
        choices: [String],
        correctIndex: Int,
        accessibilityHint: String? = nil
    ) {
        self.prompt = prompt
        self.promptEmoji = promptEmoji
        self.choices = choices
        self.correctIndex = correctIndex
        self.accessibilityHint = accessibilityHint
    }
}

enum LearningActivity: String, Identifiable, CaseIterable {
    case letters
    case phonics
    case sightWords
    case counting
    case addition
    case subtraction
    case numberBonds
    case multiplication
    case division
    case grouping
    case animals
    case weather
    case plants
    case senses
    case sunMoon

    var id: String { rawValue }

    var title: String {
        switch self {
        case .letters: return "Letter Fun"
        case .phonics: return "Letter Sounds"
        case .sightWords: return "Sight Words"
        case .counting: return "Count to 20"
        case .addition: return "Adding"
        case .subtraction: return "Taking Away"
        case .numberBonds: return "Number Bonds"
        case .multiplication: return "Equal Groups"
        case .division: return "Sharing Fair"
        case .grouping: return "Group by Count"
        case .animals: return "Animals"
        case .weather: return "Weather & Seasons"
        case .plants: return "Plants"
        case .senses: return "Five Senses"
        case .sunMoon: return "Sun & Moon"
        }
    }

    var emoji: String {
        switch self {
        case .letters: return "🔤"
        case .phonics: return "🔊"
        case .sightWords: return "👀"
        case .counting: return "🔢"
        case .addition: return "➕"
        case .subtraction: return "➖"
        case .numberBonds: return "🔗"
        case .multiplication: return "✖️"
        case .division: return "➗"
        case .grouping: return "📦"
        case .animals: return "🦁"
        case .weather: return "🌈"
        case .plants: return "🌱"
        case .senses: return "👁️"
        case .sunMoon: return "🌙"
        }
    }

    var subtitle: String {
        switch self {
        case .letters: return "Find A to Z"
        case .phonics: return "What sound?"
        case .sightWords: return "Read CVC words"
        case .counting: return "How many?"
        case .addition: return "Put together"
        case .subtraction: return "Take away"
        case .numberBonds: return "Make 5 or 10"
        case .multiplication: return "Groups of things"
        case .division: return "Share equally"
        case .grouping: return "Sort by number"
        case .animals: return "Wild & friendly"
        case .weather: return "Rain, sun & more"
        case .plants: return "Grow green"
        case .senses: return "See, hear, feel"
        case .sunMoon: return "Day and night"
        }
    }
}

struct ScienceFact: Identifiable {
    let id = UUID()
    let title: String
    let emoji: String
    let body: String
    let symbolName: String?
}
