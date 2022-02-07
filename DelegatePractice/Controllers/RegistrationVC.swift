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
        backgroundView.backgroundColor = .white.withAlphaComponent(0.89)
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
    
    // name tf
    let nameTF: UITextField = {
        let nameTf = UITextField()
        nameTf.borderStyle = .roundedRect
        nameTf.backgroundColor = .white.withAlphaComponent(0.8)
        nameTf.placeholder = "Enter your name"
        return nameTf
    }()
    
    //label tf
    let labelNameTF: UILabel = {
        let label = UILabel()
        label.text = "Enter your name"
        label.textColor = .gray
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 10)
        return label
    }()
    
    //passwd tf
    let passwordTF: UITextField = {
        let passwdTf = UITextField()
        passwdTf.borderStyle = .roundedRect
        passwdTf.backgroundColor = .white.withAlphaComponent(0.8)
        passwdTf.placeholder = "Enter your password"
        return passwdTf
    }()
    
    //label passwd
    let labelPasswordTF: UILabel = {
        let label = UILabel()
        label.text = "Enter your password"
        label.textColor = .gray
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 10)
        return label
    }()
    
    //email tf
    let emailTF: UITextField = {
        let emailTf = UITextField()
        emailTf.borderStyle = .roundedRect
        emailTf.backgroundColor = .white.withAlphaComponent(0.8)
        emailTf.placeholder = "Enter your E-mail"
        return emailTf
    }()
    
    //label tf
    let labelEmailTF: UILabel = {
        let label = UILabel()
        label.text = "Enter your e-mail"
        label.textColor = .gray
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 10)
        return label
    }()
    
    //button confirm
    let confirmButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemMint//.withAlphaComponent(0.8)
        confButton.setTitle("Confirm", for: .normal)
        confButton.layer.cornerRadius = 10
        confButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        confButton.translatesAutoresizingMaskIntoConstraints = false
        return confButton
    }()
    
    // button cancel
    let backButton: UIButton = {
        let confButton = UIButton()
        confButton.backgroundColor = .systemRed//.withAlphaComponent(0.8)
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
        keyboardObserverNotification()
        textFieldDelegates()

    }
    deinit{
        removeKeyboardNotifications()
    }
    
    //MARK: subviews -
    func setupItemsAtRegistrationVc(){
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(registrationLabel)
        backgroundView.addSubview(labelNameTF)
        backgroundView.addSubview(labelPasswordTF)
        backgroundView.addSubview(labelEmailTF)
        textFieldsStackView = UIStackView(arrangedSubviews: [nameTF,labelNameTF, passwordTF,labelPasswordTF, emailTF, labelEmailTF], axis: .vertical, spacing: 5, distribution: .fillProportionally)
        backgroundView.addSubview(textFieldsStackView)
        backgroundView.addSubview(confirmButton)
        backgroundView.addSubview(backButton)
    }

}//end of registration VC

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


extension RegistrationVC{
    
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
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 8)
     
    }
    // when keyboard hidden
    @objc func keyboardWillHide(notification: Notification){
//        print("keyboard hide")
        // при скрытии клавы просто возвращаем content offset to 0
        scrollView.contentOffset = CGPoint.zero
//        topAnchor?.constant = 200
    }
    
}

extension RegistrationVC: UITextFieldDelegate{
  
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        print (string) // выводит поочередно все буквы\цифры которые печатем
        
        // так как нейм тф опциональный ставлю по умолчанию пустую строку и добавляю символы которые получаем в метод
        let text = (nameTF.text ?? "") + string
        let result: String
        
        //range = когда символы добавляются то значение range будет равно 0. когда значения удаляются значение будет равно 1. Значит в блок == 1 попадаем при удалении символов
        if range.length == 1{
            let end = text.index(text.startIndex, offsetBy: text.count - 1 )
            result = String(text[text.startIndex..<end]) // записываем в массив все значения от startIndex до end
        }else{
            result = text
        }
        
        nameTF.text = result
        
        return false
    }
    
    
    
    func textFieldDelegates(){
        nameTF.delegate = self
        passwordTF.delegate = self
        emailTF.delegate = self
    }
    //hide keyboard when end editing and touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
        //  change field when Return tapped, and final field will hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF{
            passwordTF.becomeFirstResponder()
        }else if textField == passwordTF{
            emailTF.becomeFirstResponder()
            }else if textField == emailTF{
                textField.resignFirstResponder()
            }
        
        return true
    }
    
    
}
