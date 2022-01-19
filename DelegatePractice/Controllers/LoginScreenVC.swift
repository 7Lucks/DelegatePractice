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
       // backgroundView.backgroundColor = .white
        backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "LoginBackground")!)
        backgroundView.contentMode = .scaleToFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    
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
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        return signInButton
    }()
    
    //singUp button
    let signUpButton: UIButton = {
        let signUpbutton = UIButton()
        signUpbutton.backgroundColor = .systemRed
        signUpbutton.setTitle("SignUp", for: .normal)
        signUpbutton.titleColor(for: .normal)
        signUpbutton.layer.cornerRadius = 10
        signUpbutton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpbutton.translatesAutoresizingMaskIntoConstraints = false
        return signUpbutton
    }()
    
  //MARK: stackview-
    var textFieldsStackView = UIStackView()
    var buttonsStackView = UIStackView()
    
    
    
    //MARK:  viewDidLoad() -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemsAtLoginVc()
        setupConstrLoginVC()
        keyboardObserverNotification()
        textFieldDelegates()
    }
    
    
    //MARK: - button methods
    
    @objc func signInButtonTapped(){
        let signIn = MainScreenVC()
        self.present(signIn, animated: true, completion: nil)
    }
    
    @objc func signUpButtonTapped(){
        let signUp = RegistrationVC()
        self.present(signUp, animated: true, completion: nil)
        
    }
    
    
    
    //MARK: subviews -
    
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

extension LoginScreenVC{
    
    func keyboardObserverNotification(){
        // observer to keyboard will show notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // observer to keyboard will hide notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //remove keyboard notification when Deinit VC
    func removeKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: QUESTION : loginLabel.topAnchor.constraint(equalTo: 250)
    //when keyboard shown
    @objc func keyboardWillShow(notification: Notification){
//        print ("keyboard show")
        let userInfo = notification.userInfo //обращение к юзер инфо и через юзер инфо достаю высоту клавиатуры
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //получаем высоту клавиатуры в формате CGRect
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 3)
//        loginLabel.topAnchor.constraint(equalTo: 250) // как сдвинуть отдельный элемент при вызове контент оффсета у скроллвью
    }
    // when keyboard hidden
    @objc func keyboardWillHide(notification: Notification){
//        print("keyboard hide")
        // при скрытии клавы просто возвращаем content offset to 0
        scrollView.contentOffset = CGPoint.zero
    }
    
}

extension LoginScreenVC: UITextFieldDelegate{
    
    func textFieldDelegates(){
        loginTF.delegate = self
        passwdTF.delegate = self
    }
    //hide keyboard when end editing and touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
        //  change field when Return tapped, and final field will hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF{
            passwdTF.becomeFirstResponder()
        }else if textField == passwdTF{
            textField.resignFirstResponder()

//            signInButtonTapped()
        }
        return true
    }
    
    
}
