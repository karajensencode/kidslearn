import Foundation

enum ScienceContent {
    static func facts(for activity: LearningActivity) -> [ScienceFact] {
        switch activity {
        case .animals:
            return [
                ScienceFact(title: "Lion", emoji: "🦁", body: "Lions are big cats. They live in groups called prides.", symbolName: "pawprint.fill"),
                ScienceFact(title: "Elephant", emoji: "🐘", body: "Elephants have long trunks they use like a hand.", symbolName: "leaf.fill"),
                ScienceFact(title: "Dolphin", emoji: "🐬", body: "Dolphins live in the ocean and love to play.", symbolName: "water.waves"),
                ScienceFact(title: "Butterfly", emoji: "🦋", body: "Butterflies start as tiny caterpillars.", symbolName: "leaf.fill"),
                ScienceFact(title: "Penguin", emoji: "🐧", body: "Penguins are birds that swim but do not fly.", symbolName: "snowflake"),
                ScienceFact(title: "Frog", emoji: "🐸", body: "Frogs live near water and can hop far.", symbolName: "drop.fill")
            ]
        case .weather:
            return [
                ScienceFact(title: "Sunny", emoji: "☀️", body: "The sun gives us light and warmth.", symbolName: "sun.max.fill"),
                ScienceFact(title: "Rain", emoji: "🌧️", body: "Rain helps plants drink water and grow.", symbolName: "cloud.rain.fill"),
                ScienceFact(title: "Snow", emoji: "❄️", body: "Snow falls when it is very cold.", symbolName: "snowflake"),
                ScienceFact(title: "Spring", emoji: "🌸", body: "In spring, flowers bloom and baby animals arrive.", symbolName: "leaf.fill"),
                ScienceFact(title: "Summer", emoji: "🏖️", body: "Summer is warm. Days are long and bright.", symbolName: "sun.max.fill"),
                ScienceFact(title: "Fall", emoji: "🍂", body: "In fall, leaves change color and drop.", symbolName: "leaf.arrow.triangle.circlepath"),
                ScienceFact(title: "Winter", emoji: "⛄", body: "Winter is cold. Some animals sleep longer.", symbolName: "snowflake")
            ]
        case .plants:
            return [
                ScienceFact(title: "Seeds", emoji: "🌱", body: "A tiny seed can grow into a big plant.", symbolName: "leaf.fill"),
                ScienceFact(title: "Sunlight", emoji: "☀️", body: "Plants need sunlight to make their food.", symbolName: "sun.max.fill"),
                ScienceFact(title: "Water", emoji: "💧", body: "Roots drink water from the soil.", symbolName: "drop.fill"),
                ScienceFact(title: "Flowers", emoji: "🌺", body: "Flowers help plants make new seeds.", symbolName: "flame.fill"),
                ScienceFact(title: "Trees", emoji: "🌳", body: "Trees give us shade, fruit, and clean air.", symbolName: "leaf.fill"),
                ScienceFact(title: "Leaves", emoji: "🍃", body: "Green leaves catch sunlight for the plant.", symbolName: "leaf.fill")
            ]
        case .senses:
            return [
                ScienceFact(title: "Sight", emoji: "👁️", body: "We use our eyes to see colors and shapes.", symbolName: "eye.fill"),
                ScienceFact(title: "Hearing", emoji: "👂", body: "Our ears help us hear music and voices.", symbolName: "ear.fill"),
                ScienceFact(title: "Smell", emoji: "👃", body: "Our nose smells flowers, food, and more.", symbolName: "wind"),
                ScienceFact(title: "Taste", emoji: "👅", body: "Our tongue tastes sweet, sour, and salty.", symbolName: "fork.knife"),
                ScienceFact(title: "Touch", emoji: "✋", body: "Our skin feels soft, hard, hot, and cold.", symbolName: "hand.raised.fill")
            ]
        case .sunMoon:
            return [
                ScienceFact(title: "The Sun", emoji: "☀️", body: "The sun is a star. It lights our day.", symbolName: "sun.max.fill"),
                ScienceFact(title: "Daytime", emoji: "🌅", body: "When our side of Earth faces the sun, it is day.", symbolName: "sunrise.fill"),
                ScienceFact(title: "The Moon", emoji: "🌙", body: "The moon shines at night with sunlight.", symbolName: "moon.stars.fill"),
                ScienceFact(title: "Nighttime", emoji: "🌌", body: "When our side of Earth turns away, it is night.", symbolName: "moon.fill"),
                ScienceFact(title: "Stars", emoji: "⭐", body: "Stars are faraway suns that twinkle.", symbolName: "sparkles"),
                ScienceFact(title: "Shadow", emoji: "🧍", body: "A shadow appears when something blocks light.", symbolName: "person.fill")
            ]
        default:
            return []
        }
    }

    static func quizQuestions(for activity: LearningActivity, count: Int = 6) -> [QuizQuestion] {
        let deck = facts(for: activity)
        guard !deck.isEmpty else { return [] }

        return Array(deck.shuffled().prefix(count)).map { fact in
            var choices = [fact.title]
            let others = deck.map(\.title).filter { $0 != fact.title }.shuffled()
            choices.append(contentsOf: others.prefix(3))
            while choices.count < 4 {
                choices.append("Mystery")
            }
            choices = Array(choices.prefix(4)).shuffled()

            return QuizQuestion(
                prompt: "Which matches this fact?\n\(fact.body)",
                promptEmoji: fact.emoji,
                choices: choices,
                correctIndex: choices.firstIndex(of: fact.title)!,
                accessibilityHint: "\(fact.body) Which is it?"
            )
        }
    }
}
