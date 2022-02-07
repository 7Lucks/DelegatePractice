//
//  UIStackViewExtension.swift
//  DelegatePractice
//
//  Created by Дмитрий Игнатьев on 14.01.2022.
//

import UIKit
//https://github.com/SwifterSwift/SwifterSwift/blob/master/Sources/SwifterSwift/UIKit/UIStackViewExtensions.swift  - extinsoions for stackview

extension UIStackView{
    
    convenience init(
           arrangedSubviews: [UIView],
           axis: NSLayoutConstraint.Axis,
           spacing: CGFloat,
           distribution: UIStackView.Distribution) {
            
           self.init(arrangedSubviews: arrangedSubviews)
           self.axis = axis
           self.spacing = spacing
           self.distribution = distribution
               // не забывать добавлять авторесайзинг! потратил на поиск решения полтора часа!!!
               self.translatesAutoresizingMaskIntoConstraints = false
       }
}



