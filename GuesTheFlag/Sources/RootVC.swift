//
//  ViewController.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 01/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    
    
    //MARK: -  Variabels
    private let padding: CGFloat = 30.0
    var countries = [String]()
    var correct = 0
    var score = 0
    var countOfQuestion = 0
    var maxCountOfQuestion = 10
    public static var record: Int = 0
    
    
    //MARK: - Creating buttons
    private lazy var button1 = CustomUIButtonView.customButton(tag: 0)
    private lazy var button2 = CustomUIButtonView.customButton(tag: 1)
    private lazy var button3 = CustomUIButtonView.customButton(tag: 2)
    
   
    //MARK: - Creating Text of question and text of score
    private lazy var textOfQuestion = CustomLabel.customLabel(label: "", size: 30.0, font: "GangofThree")
    private lazy var textOfScore    = CustomLabel.customLabel(label: "", size: 35.0, font: "GangofThree")
    private lazy var textOfFlag     = CustomLabel.customLabel(label: "", size: 50.0, font: "GangofThree")
    
    //MARK: - Creating scrollView
    private var scrollView = CustomScrollView.customScrollView(contentSize: 500.0)
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addCountries()
        askQuestion()
        buttonAction()
    }
    
    func setupView() {
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        title = "Guess the flag"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: #selector(showRecordModalVC))
    
        view.addSubview(scrollView)
        constraintScrollView()
        scrollView.addSubview(rootStackView)
        setupConstraintsStackView()
        
    }
    
    func constraintScrollView() {
    let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    //MARK: setup Button StackView
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:
            [textOfQuestion, textOfFlag, button1, button2, button3, textOfScore])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = self.padding
        return stackView
    }()

    
    // setup constraints which include all others view
    func setupConstraintsStackView() {
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            rootStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding * 2),
            scrollView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor),
        ])
    }
    
    //MARK: - Push name of countries to array
    func addCountries() {
        countries += ["estonia","france","germany","ireland","italy","monaco",
                      "nigeria","poland","russia","spain","uk","us"]
    }
    
    
    //MARK: - Ask user's answer
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        //add correct answer
        correct = Int.random(in: 0...2)
        //Change text
        textOfQuestion.text = "Find the flag of"
        textOfFlag.text = " \(countries[correct].uppercased())"
        textOfScore.text = "Score: \(score) 🏆"
    }
    
    
    //MARK: -  Add action for each button
    func buttonAction() {
        button1.addTarget(self, action: #selector(actionForFlagButtons(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(actionForFlagButtons(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(actionForFlagButtons(_:)), for: .touchUpInside)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
