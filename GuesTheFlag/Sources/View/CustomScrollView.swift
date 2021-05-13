//
//  CustomScrollView.swift
//  GuesTheFlag
//
//  Created by Alexandr Grigoryev on 11/03/2020.
//  Copyright © 2020 Alexandr Grigoryev. All rights reserved.
//

import UIKit

class CustomScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    static func customScrollView (contentSize: CGFloat) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = contentSize
        return scrollView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
