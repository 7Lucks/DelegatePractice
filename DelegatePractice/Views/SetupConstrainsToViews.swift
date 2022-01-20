//
//  SetupConstrainsLoginVC.swift
//  DelegatePractice
//
//  Created by Дмитрий Игнатьев on 14.01.2022.
//

import UIKit

extension LoginScreenVC{
    func setupConstrLoginVC() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    
        
        NSLayoutConstraint.activate([
            textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            textFieldsStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textFieldsStackView.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -10)
         
        ])
        //если над опускать лейбл на главном экране
//        topAnchor =  welcomeLabel.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 200)
//        topAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.centerXAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 100),
            welcomeLabel.bottomAnchor.constraint(equalTo: textFieldsStackView.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonsStackView.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buttonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.safeAreaLayoutGuide.bottomAnchor, constant: 20)
            
        ])
    }//end setupConstraintsforItems()
}

//MARK: - registrationVC menu

extension RegistrationVC{
    func setupConstrRegistrationVC(){
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            registrationLabel.centerXAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.centerXAnchor),
            registrationLabel.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
//            textFieldsStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            textFieldsStackView.topAnchor.constraint(equalTo: registrationLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            textFieldsStackView.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldsStackView.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -20)

        ])
        
        // TODO: объединить кнопки в стеквью
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor,constant: 50),
            confirmButton.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            confirmButton.widthAnchor.constraint(equalTo: textFieldsStackView.safeAreaLayoutGuide.widthAnchor),
            confirmButton.centerXAnchor.constraint(equalTo: textFieldsStackView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor,constant: 10),
            backButton.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalTo: textFieldsStackView.safeAreaLayoutGuide.widthAnchor),
//            backButton.centerXAnchor.constraint(equalTo: textFieldsStackView.centerXAnchor)
        ])
        
    }
}
