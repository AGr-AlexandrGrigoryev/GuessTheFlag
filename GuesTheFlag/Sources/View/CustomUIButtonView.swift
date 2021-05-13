//
//  CustomUIButtonView.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 05/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

class CustomUIButtonView: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    static func setupButton(title: String) -> UIButton{
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        return button
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
