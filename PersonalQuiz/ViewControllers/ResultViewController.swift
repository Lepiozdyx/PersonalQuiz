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
    
    var answersChosenResult: [Answer]!

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
        
        for answer in answersChosenResult {
            if let count = responseRate[answer.animal] {
                responseRate[answer.animal] = count + 1
            } else {
                responseRate[answer.animal] = 1
            }
        }
        
        var mostResponseRate: Animal?
        var maxCount = 0
        for (animal, count) in responseRate {
            if count > maxCount {
                maxCount = count
                mostResponseRate = animal
            }
        }
        
        if let mostResponseRate = mostResponseRate {
            updateUI(with: mostResponseRate)
        }
    }
    
    func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        messageLabel.text = animal.definition
    }
    
}
