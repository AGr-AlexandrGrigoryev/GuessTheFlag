//
//  RecordVC.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 10/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

class RecordVC: UIViewController {

    //MARK: - Creating Label
    private lazy var recordLabel   = CustomLabel.customLabel(label: "Total record \n \(RootVC.record) 🏆 ", size: 50.0 , font: "GangofThree")
    
     //MARK: - Creating buttons
    private lazy var dismissButton = CustomUIButtonView.setupButton(title: "Back to Game")
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(rootStackView)
        constraintsForStackView()
        actionButton()
        
    }
    
    //MARK: - Setup StackView
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [recordLabel, dismissButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 50.0
        return stackView
    }()
    
    func constraintsForStackView() {
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - Action for dismiss modal window
    private func actionButton() {
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}
