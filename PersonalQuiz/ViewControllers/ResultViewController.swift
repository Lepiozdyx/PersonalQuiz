//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alex on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.setBackgroundImage("backgroundFinal")
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
        var responseRate: [Status: Int] = [:]
        let answers = answers.map { $0.status }
        
        for answer in answers {
            if let count = responseRate[answer] {
                responseRate[answer] = count + 1
            } else {
                responseRate[answer] = 1
            }
        }
        
        let sortedResponseRate = responseRate.sorted { $0.value > $1.value }
        guard let mostResponseRate = sortedResponseRate.first?.key else { return }
        
        updateUI(with: mostResponseRate)
    }
    
    func updateUI(with status: Status) {
        statusLabel.text = "You - \(status.rawValue)"
        messageLabel.text = status.definition
    }
    
}
