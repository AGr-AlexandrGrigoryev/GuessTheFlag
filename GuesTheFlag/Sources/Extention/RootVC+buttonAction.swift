//
//  RootVC+buttonAction.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 04/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

extension RootVC {
    @objc func actionForFlagButtons(_ sender: UIButton){
        var title: String
        
        if  sender.tag == correct  {
            score += 1
            countOfQuestion += 1
            title = "Correct 🤓"
        } else {
            score -= 1
            countOfQuestion += 1
            title = "That’s the flag of \(countries[sender.tag].uppercased()). 🤬"
        }
        
        if countOfQuestion < maxCountOfQuestion {
            let ac = UIAlertController(title: title, message: "Question \(countOfQuestion) from \(maxCountOfQuestion)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Next question", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let acWin = UIAlertController(title: "You have finished", message: "You have \(score)🏅.", preferredStyle: .alert)
            acWin.addAction(UIAlertAction(title: "NEW GAME", style: .default, handler: askQuestion))
            present(acWin, animated: true)
            score = 0
            countOfQuestion = 0
        }
        
        if RootVC.record <= score {
            RootVC.record = score
        }
    }
    
    @objc func showRecordModalVC() {
        let vc = RecordVC()
        vc.isModalInPresentation = false
        vc.modalPresentationStyle = .automatic
        self.navigationController?.present(vc, animated: true)
    }
}

