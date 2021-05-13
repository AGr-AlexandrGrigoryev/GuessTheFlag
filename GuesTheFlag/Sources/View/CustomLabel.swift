//
//  CustomLabel.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 07/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    static func customLabel(label: String, size: CGFloat, font: String) -> UILabel{
        let newLabel = UILabel()
        newLabel.text = label
        newLabel.font = UIFont(name: font, size: size)
        newLabel.textAlignment = .center
        newLabel.numberOfLines = 2
        return newLabel
    }
    //for indicate name of font 
    static func findeNameOfFont() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
