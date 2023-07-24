//
//  Extension+UIImageView.swift
//  PersonalQuiz
//
//  Created by Alex on 24.07.2023.
//

import UIKit

extension UIImageView {
    func setBackgroundImage(_ imageName: String) {
        if let image = UIImage(named: imageName) {
            self.clipsToBounds = true
            self.image = image
        }
    }
}
