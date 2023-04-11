//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setsResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

// MARK: - Private Methods
private extension ResultViewController {
    func setsResult() {
        var responseRate: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let count = responseRate[animal] {
                responseRate[animal] = count + 1
            } else {
                responseRate[animal] = 1
            }
        }
        
        let sortedResponseRate = responseRate.sorted { $0.value > $1.value }
        guard let mostResponseRate = sortedResponseRate.first?.key else { return }
        
        updateUI(with: mostResponseRate)
    }
    
    func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        messageLabel.text = animal.definition
    }
    
}
