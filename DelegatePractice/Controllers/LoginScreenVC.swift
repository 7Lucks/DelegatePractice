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
    let welcomeLabel : UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Login me"
        welcomeLabel.isHighlighted = true
        welcomeLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 35)
        welcomeLabel.textColor = .systemRed
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()
    
    //login text field
    let loginTF: UITextField = {
        let loginTF = UITextField()
        loginTF.borderStyle = .roundedRect
        loginTF.placeholder = "Login"
        loginTF.backgroundColor = .white.withAlphaComponent(0.8)
        return loginTF
    }()
    //Create an Item on view Programmaticaly
//    let loginTFLabel: UILabel = {
//        let loginLabel = UILabel()
//        loginLabel.text = "Enter your Login"
//        loginLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 10)
//
//        return loginLabel
//    }()
//
    
    
    // paswd text field
    let passwdTF: UITextField = {
        let passwdTF = UITextField()
        passwdTF.borderStyle = .roundedRect
        passwdTF.placeholder = "Password"
        passwdTF.isSecureTextEntry = true
        passwdTF.backgroundColor = .white.withAlphaComponent(0.8)
        return passwdTF
    }()
    
//    let passwordTFLabel: UILabel = {
//        let passwordLabel = UILabel()
//        passwordLabel.text = "Enter your Password"
//        passwordLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 10)
//        return passwordLabel
//    }()
    
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
    
    var topAnchor: NSLayoutConstraint? 
    
    //MARK:  viewDidLoad() -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemsAtLoginVc()
        setupConstrLoginVC()
        keyboardObserverNotification()
        textFieldDelegates()
    }
    //deinit VC
    deinit{
        removeKeyboardNotifications()
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
    
    
    
    
    // MARK: QUESTION : реально ли сделать чтоб лейблы и текст филды имели разный спейсинг внутри стеквью)) или убрать стеквью и сделать верстку 
    func setupItemsAtLoginVc(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(welcomeLabel)
//        backgroundView.addSubview(loginTFLabel)
//        backgroundView.addSubview(passwordTFLabel)
        textFieldsStackView = UIStackView(arrangedSubviews: [loginTF,/*loginTFLabel,*/ passwdTF, /*passwordTFLabel*/], axis: .vertical, spacing: 5,  distribution: .fillProportionally)
        backgroundView.addSubview(textFieldsStackView)
        buttonsStackView = UIStackView(arrangedSubviews: [signInButton, signUpButton], axis: .horizontal, spacing: 15, distribution: .fillProportionally)
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
    
    //when keyboard shown
    @objc func keyboardWillShow(notification: Notification){
//        print ("keyboard show")
        let userInfo = notification.userInfo //обращение к юзер инфо и через юзер инфо достаю высоту клавиатуры
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //получаем высоту клавиатуры в формате CGRect
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 3)
//        welcomeLabel.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 290).isActive = true // как сдвинуть отдельный элемент при вызове контент оффсета у скроллвью
//        topAnchor?.constant = 250
    }
    // when keyboard hidden
    @objc func keyboardWillHide(notification: Notification){
//        print("keyboard hide")
        // при скрытии клавы просто возвращаем content offset to 0
        scrollView.contentOffset = CGPoint.zero
//        topAnchor?.constant = 200
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
