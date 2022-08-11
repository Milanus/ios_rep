//
//  LoginView.swift
//  Bankey
//
//  Created by Milan Schon on 09/08/2022.
//

import Foundation
import UIKit

class LoginView:UIView {
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextFiled = UITextField()
    let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension LoginView {
    func style () {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "UserName"
        usernameTextField.delegate = self
        
        passwordTextFiled.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFiled.placeholder = "password"
        passwordTextFiled.isSecureTextEntry = true
        passwordTextFiled.delegate = self
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTextFiled)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextFiled.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

