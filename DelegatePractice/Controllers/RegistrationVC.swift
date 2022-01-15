//
//  RegistrationVC.swift
//  DelegatePractice
//
//  Created by Дмитрий Игнатьев on 15.01.2022.
//

import UIKit

class RegistrationVC: UIViewController {

    //scrollView
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //background view color
    let backgroundView: UIView = {
        let backgroundView = UIView()
        //https://proswift.ru/uiview-i-prozrachnost-uicolor/ альфа только для цвета бекграунда
        backgroundView.backgroundColor = .black.withAlphaComponent(0.8)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    
    //login label
    let registrationLabel : UILabel = {
        let regLabel = UILabel()
        regLabel.text = "Registration"
        regLabel.isHighlighted = true
        regLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 35)
        regLabel.textColor = .systemRed
        regLabel.translatesAutoresizingMaskIntoConstraints = false
        return regLabel
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemsAtRegistrationVc()
        setupConstrRegistrationVC()

    
    }
    
    
    func setupItemsAtRegistrationVc(){
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(registrationLabel)
    }

}
