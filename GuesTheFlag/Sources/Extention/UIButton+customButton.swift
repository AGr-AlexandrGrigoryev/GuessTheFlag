//
//  UIButton+customButton.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 04/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

extension UIButton{
    /// Settings for buttons
    /// - Parameter tag: number of tag for indicate button
    static func customButton(tag: Int) ->UIButton{
        let button = UIButton()
        button.tag = tag
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        //add Shadow to the buttons
        button.layer.shadowRadius = 15
        button.layer.shadowOffset = .init(width: 10, height: 10)
        button.layer.shadowOpacity = 0.8
        return button
    }
}
