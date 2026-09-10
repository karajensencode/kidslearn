# KidsLearn

A playful, offline SwiftUI learning app for kids ages **4–6**. Bright colors, large tap targets, short 5–8 question sessions, celebration screens, gentle retry, and VoiceOver labels throughout.

**Platform:** iOS 17+ · SwiftUI · no network required

## Open in Xcode

1. Clone or copy this project onto a Mac.
2. Open `KidsLearn.xcodeproj` in Xcode 15+.
3. Select an iPhone simulator (or a device).
4. Press **Run** (⌘R).

```bash
open KidsLearn.xcodeproj
```

The app target is **KidsLearn**, bundle ID `com.karajensen.KidsLearn`, deployment target **iOS 17.0**.

## Features

### Home
Three hubs: **Reading**, **Math**, and **Science**.

### Reading (`Features/Reading`)
- **Letter Fun** — recognize A–Z
- **Letter Sounds** — phonics / beginning sounds
- **Sight Words** — CVC and early sight words

### Math (`Features/Math`)
- Counting 1–20
- Addition & subtraction
- Number bonds to 5 / 10
- Visual equal-groups multiplication
- Visual sharing / grouping division
- Group by count

### Science (`Features/Science`)
Fact decks + quizzes:
- Animals
- Weather & seasons
- Plants
- Five senses
- Sun & moon / day & night

Each science topic shows short emoji + SF Symbol fact cards, then a quiz.

## Module map

```
KidsLearn/
├── KidsLearnApp.swift          # @main entry
├── HomeView.swift              # Hub picker
├── Assets.xcassets
├── Preview Content/
├── Features/
│   ├── Reading/
│   │   ├── ReadingHubView.swift
│   │   └── ReadingContent.swift
│   ├── Math/
│   │   ├── MathHubView.swift
│   │   └── MathContent.swift
│   └── Science/
│       ├── ScienceHubView.swift
│       └── ScienceContent.swift
└── Shared/
    ├── Theme/KidTheme.swift
    ├── Models/QuizModels.swift
    └── Components/
        ├── KidButton.swift
        ├── ProgressStars.swift
        ├── CelebrationView.swift
        └── QuizSessionView.swift
```

| Module | Role |
|--------|------|
| `Shared/Theme` | Colors, gradients, tap sizes |
| `Shared/Models` | `QuizQuestion`, `LearningActivity`, `ScienceFact` |
| `Shared/Components` | Buttons, progress stars, celebration, quiz session |
| `Features/Reading` | Hub + in-code letter/phonics/sight content |
| `Features/Math` | Hub + counting / ops / bonds / groups content |
| `Features/Science` | Fact decks, topic views, quizzes |

## Design notes

- Offline-only: all content is generated in code (no API calls).
- Sessions are short (~6 questions) with celebration and gentle retry on wrong answers.
- Controls use large minimum tap heights and VoiceOver labels.
- Haptic feedback on correct / incorrect answers (device / simulator support varies).

## Requirements

- macOS with Xcode 15 or later
- iOS 17 SDK
- Swift 5.9+

## License

See [LICENSE](LICENSE) in the repository root when published.
