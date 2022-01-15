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
    
    let nameTF: UITextField = {
        let nameTf = UITextField()
        nameTf.borderStyle = .roundedRect
        nameTf.backgroundColor = .lightGray
        nameTf.placeholder = "Enter your name"
        return nameTf
    }()
    
    let passwordTF: UITextField = {
        let passwdTf = UITextField()
        passwdTf.borderStyle = .roundedRect
        passwdTf.backgroundColor = .lightGray
        passwdTf.placeholder = "Enter your password"
        return passwdTf
    }()
    
    let emailTF: UITextField = {
        let emailTf = UITextField()
        emailTf.borderStyle = .roundedRect
        emailTf.backgroundColor = .lightGray
        emailTf.placeholder = "Enter your E-mail"
        return emailTf
    }()
    
    let confirmButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemGreen
        confButton.setTitle("Confirm", for: .normal)
        confButton.layer.cornerRadius = 10
        confButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        confButton.translatesAutoresizingMaskIntoConstraints = false
        return confButton
    }()
    
    let backButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemRed
        confButton.setTitle("Back", for: .normal)
        confButton.layer.cornerRadius = 10
        confButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        confButton.translatesAutoresizingMaskIntoConstraints = false
        return confButton
    }()
    
    
    var textFieldsStackView = UIStackView()
    
    @objc func confirmButtonTapped(){
        
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemsAtRegistrationVc()
        setupConstrRegistrationVC()

    }
    
    
    func setupItemsAtRegistrationVc(){
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(registrationLabel)
        textFieldsStackView = UIStackView(arrangedSubviews: [nameTF, passwordTF,emailTF], axis: .vertical, spacing: 10, distribution: .fillEqually)
        backgroundView.addSubview(textFieldsStackView)
        backgroundView.addSubview(confirmButton)
        backgroundView.addSubview(backButton)
    }

}
