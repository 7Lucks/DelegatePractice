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
        nameTf.backgroundColor = .lightGray.withAlphaComponent(0.8)
        nameTf.placeholder = "Enter your name"
        return nameTf
    }()
    
    let passwordTF: UITextField = {
        let passwdTf = UITextField()
        passwdTf.borderStyle = .roundedRect
        passwdTf.backgroundColor = .lightGray.withAlphaComponent(0.8)
        passwdTf.placeholder = "Enter your password"
        return passwdTf
    }()
    
    let emailTF: UITextField = {
        let emailTf = UITextField()
        emailTf.borderStyle = .roundedRect
        emailTf.backgroundColor = .lightGray.withAlphaComponent(0.8)
        emailTf.placeholder = "Enter your E-mail"
        return emailTf
    }()
    
    let confirmButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemGreen.withAlphaComponent(0.8)
        confButton.setTitle("Confirm", for: .normal)
        confButton.layer.cornerRadius = 10
        confButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        confButton.translatesAutoresizingMaskIntoConstraints = false
        return confButton
    }()
    
    let backButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemRed.withAlphaComponent(0.8)
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
        textFieldsStackView = UIStackView(arrangedSubviews: [nameTF, passwordTF,emailTF], axis: .vertical, spacing: 15, distribution: .fillEqually)
        backgroundView.addSubview(textFieldsStackView)
        backgroundView.addSubview(confirmButton)
        backgroundView.addSubview(backButton)
    }

}

// TODO: textfield validation  https://www.youtube.com/watch?v=5Rn6JJAuyK0  проверочные тектс поля  при наборе почты или пароля, а так же на окне регистрации
// https://www.youtube.com/watch?v=jY9t5rX8wHE  dismiss the keyboard // keyboard observerse
// https://www.youtube.com/watch?v=XzWBT6lIB3A&t=1046s save user data with user defaults
// https://www.youtube.com/watch?v=o2TCrqsAW-I user defaults для сравнени данных при входе а приложение на экране логина
// https://www.youtube.com/watch?v=jY9t5rX8wHE&t=726s textfield delegate
//https://www.youtube.com/watch?v=IWVi6_OJb-E&t=1541s POST, PUT, DELETE запросы, Запросы с Query параметрами
// https://www.youtube.com/watch?v=o3Rkg6WmZoY post api call
// https://www.youtube.com/watch?v=tkfVQK6UxDI общие данные по post put del
// https://www.youtube.com/watch?v=EuNThe245nk post request // rested how to make your own server
// https://www.youtube.com/watch?v=9uhvoUbBWcI&t=423s передача данных черех кложуры
