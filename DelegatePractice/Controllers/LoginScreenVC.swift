//
//  LoginScreenVC.swift
//  DelegatePractice
//
//  Created by Дмитрий Игнатьев on 14.01.2022.
//

import UIKit

class LoginScreenVC: UIViewController {
    
    //MARK:  LoginVC main screen elements-
    
    // если нужно чтоб клавиатура поднимала обьекты на вью, помещаю все элементы на скролл вью
    
    //scrollView
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    //background view color
    let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    
    
    // logo Image
    //    let logoImage: UIImage = {
    //        let logo = UIImage(named: "LoginBackground")
    //
    //        return logo!
    //    }()
    
    
    //login label
    let loginLabel : UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login me"
        loginLabel.isHighlighted = true
        loginLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 35)
        loginLabel.textColor = .systemRed
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    
    //login text field
    let loginTF: UITextField = {
        let loginTF = UITextField()
        loginTF.borderStyle = .roundedRect
        loginTF.placeholder = "Login"
        return loginTF
    }()
    
    // paswd text field
    let passwdTF: UITextField = {
        let passwdTF = UITextField()
        passwdTF.borderStyle = .roundedRect
        passwdTF.placeholder = "Password"
        return passwdTF
    }()
    
    //signIn button
    let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .systemMint
        signInButton.setTitle("SignIn", for: .normal)
        signInButton.titleColor(for: .normal)
        signInButton.layer.cornerRadius = 10
        return signInButton
    }()
    //singUp button
    let signUpButton: UIButton = {
        let signUpbutton = UIButton()
        signUpbutton.backgroundColor = .systemRed
        signUpbutton.setTitle("SignUp", for: .normal)
        signUpbutton.titleColor(for: .normal)
        signUpbutton.layer.cornerRadius = 10
        
        return signUpbutton
    }()
    
    var textFieldsStackView = UIStackView()
    var buttonsStackView = UIStackView()
    
    //MARK:  viewDidLoad() -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupItemsAtLoginVc()
        setupConstrLoginVC()
    }
    
    func setupItemsAtLoginVc(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(loginLabel)
        textFieldsStackView = UIStackView(arrangedSubviews: [loginTF, passwdTF], axis: .vertical, spacing: 15,  distribution: .fillEqually)
        backgroundView.addSubview(textFieldsStackView)
        buttonsStackView = UIStackView(arrangedSubviews: [signInButton, signUpButton], axis: .horizontal, spacing: 15, distribution: .fillEqually)
        backgroundView.addSubview(buttonsStackView)
    }// end of setupItemsAtLoginVc()
    
    
    
} //end of LoginVC
