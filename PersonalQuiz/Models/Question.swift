//
//  Question.swift
//  PersonalQuiz
//
//  Created by Alex on 03.04.2023.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Which weapon will you choose?",
                type: .single,
                answers: [
                    Answer(title: "Silver sword", status: .clearVictory),
                    Answer(title: "Steel sword", status: .victoryAndInjury),
                    Answer(title: "Crossbow", status: .fiascoAndInjury),
                    Answer(title: "Bombs with buckshot", status: .death)
                ]
            ),
            Question(
                title: "What elixirs should be taken?",
                type: .multiple,
                answers: [
                    Answer(title: "Golden oriole", status: .clearVictory),
                    Answer(title: "Swallow", status: .victoryAndInjury),
                    Answer(title: "Cat", status: .fiascoAndInjury),
                    Answer(title: "Seagull", status: .death)
                ]
            ),
            Question(
                title: "What style of combat will you choose?",
                type: .ranged,
                answers: [
                    Answer(title: "Quick style ", status: .death),
                    Answer(title: "Medium", status: .victoryAndInjury),
                    Answer(title: "Medium-strength", status: .clearVictory),
                    Answer(title: "Power style", status: .fiascoAndInjury)
                ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let status: Status
}

enum Status: String {
    case clearVictory = "win!"
    case victoryAndInjury = "won, but.."
    case fiascoAndInjury = "couldn't win."
    case death = "dead."
    
    var definition: String {
        switch self {
        case .clearVictory:
            return "You win a convincing victory and get a trophy that can fetch a decent handful of coins. Your skills as a witcher are admirable!"
        case .victoryAndInjury:
            return "It wasn't an easy fight! You were lightly wounded, but the trophy was worth it!"
        case .fiascoAndInjury:
            return "You make too many bad decisions in the course of the battle and get seriously wounded. The Basilisk got away!"
        case .death:
            return "Unfortunately, you're dead! The world has lost another overconfident witcher..."
        }
    }
}
