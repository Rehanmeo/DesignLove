//
//  LoginVC.swift
//  DesignLove
//
//  Created by Muhammad Rehan on 12/19/22.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    let bgImage: UIImageView = {
        return UIImageView().backGroundImage(name: "4", scales: .scaleAspectFill)
    }()
    let backBtn: UIButton = {
        let btn: UIButton = UIButton()
        return btn.btnWithImage(btnText: "", textColor: UIColor.clear, image: UIImage(systemName: "arrow.backward")!, tintColor: .white)
    }()
    
    let LoginLabel: UILabel = {
        return UILabel().labels(labelText: "LOG IN", fontSize: 56, textColor: UIColor.white, aliegnment: .center)
    }()
    
    let centerFieldView: UIView = {
        return UIView().simpleView(color: UIColor.white.withAlphaComponent(0.3), borderColor: UIColor.clear, borderWidth: 0, cornerRadius: 15)
    }()
    
    let textFieldView: UIView = {
        return UIView().simpleView(color: UIColor.white, borderColor: UIColor.clear, borderWidth: 0, cornerRadius: 25)
    }()
    
    let textFieldUserImage: UIImageView = {
        //return UIImageView().backGroundImage(name: "envelope", scales: .scaleAspectFit)
        return UIImageView().systemImageView(image: UIImage(systemName: "person")!, tintColor: UIColor.black, scale: .scaleAspectFit)
    }()
    
    let userTextfiel: UITextField = {
        return UITextField().textField(bgColor: .clear, texts: "", textColor: UIColor.black, fieldPlaceHolder: "Please Enter Username", textalignment: .left, textSecurity: false)
    }()
    
    let passwordtextFieldView: UIView = {
        return UIView().simpleView(color: UIColor.white, borderColor: UIColor.clear, borderWidth: 0, cornerRadius: 25)
    }()
    
    let passwordtextFieldUserImage: UIImageView = {
        //return UIImageView().backGroundImage(name: "envelope", scales: .scaleAspectFit)
        return UIImageView().systemImageView(image: UIImage(systemName: "lock")!, tintColor: UIColor.black, scale: .scaleAspectFit)
    }()
    
    let showPasswordBtn: UIButton = {
        let btn: UIButton = UIButton()
        return btn.btnWithImage(btnText: "", textColor: UIColor.clear, image: UIImage(systemName: "eye")!, tintColor: .black)
    }()
    
    let passwordTextfiel: UITextField = {
        return UITextField().textField(bgColor: .clear, texts: "", textColor: UIColor.black, fieldPlaceHolder: "Password", textalignment: .left, textSecurity: true)
    }()
    
    let forgetPasswordButton: UIButton = {
        return UIButton().btn(btnText: "Forgot Password", textColor: UIColor.white)
    }()
    
    
    let rememberMeBtn: UIButton = {
        let btn: UIButton = UIButton()
        return btn.btnWithImage(btnText: "", textColor: UIColor.clear, image: UIImage(systemName: "rectangle")!, tintColor: .white)
    }()
    let rememberMeLabel: UILabel = {
        return UILabel().labels(labelText: "remember me", fontSize: 14, textColor: UIColor.white, aliegnment: .center)
    }()
    
    let loginButton: UIButton = {
        return UILabel().mainButtoms(btnText: "LOG IN", bgColor: .black, textColor: .white, fonts: .systemFont(ofSize: 20, weight: .bold), cornarRadius: 25)
    }()
    
    let plusMeBtn: UIButton = {
        let btn: UIButton = UIButton()
        return btn.btnWithImage(btnText: "", textColor: UIColor.clear, image: UIImage(systemName: "plus")!, tintColor: .black)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginLabel.layer.cornerRadius = 32
        LoginLabel.layer.borderWidth = 0.5
        LoginLabel.layer.borderColor = UIColor.white.cgColor
        
        plusMeBtn.backgroundColor = UIColor.white
        plusMeBtn.layer.cornerRadius = 35
        setupUI()
    }
    
    fileprivate func setupUI() {
        [bgImage, backBtn, LoginLabel, centerFieldView, plusMeBtn].forEach({
            view.addSubview($0)
        })
        
        [textFieldView, passwordtextFieldView, forgetPasswordButton, rememberMeBtn, rememberMeLabel, loginButton].forEach({
            centerFieldView.addSubview($0)
        })
        
        [textFieldUserImage, userTextfiel].forEach({
            textFieldView.addSubview($0)
        })
        
        [passwordtextFieldUserImage, passwordTextfiel, showPasswordBtn].forEach({
            passwordtextFieldView.addSubview($0)
        })
        
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        backBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        //action proform on back actions:-
        backBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        
        //Center field View:
        centerFieldView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerFieldView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        centerFieldView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        LoginLabel.widthAnchor.constraint(equalTo: centerFieldView.widthAnchor).isActive = true
        LoginLabel.centerXAnchor.constraint(equalTo: centerFieldView.centerXAnchor).isActive = true
        LoginLabel.bottomAnchor.constraint(equalTo: centerFieldView.topAnchor, constant: -10).isActive = true
        
        //Login Forms:-
        textFieldView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textFieldView.widthAnchor.constraint(equalTo: centerFieldView.widthAnchor, multiplier: 0.9).isActive = true
        textFieldView.centerXAnchor.constraint(equalTo: centerFieldView.centerXAnchor).isActive = true
        textFieldView.topAnchor.constraint(equalTo: centerFieldView.topAnchor, constant: 23).isActive = true
        
        textFieldUserImage.centerYAnchor.constraint(equalTo: textFieldView.centerYAnchor).isActive = true
        textFieldUserImage.leftAnchor.constraint(equalTo: textFieldView.leftAnchor, constant: 18).isActive = true
        textFieldUserImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        textFieldUserImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        userTextfiel.centerYAnchor.constraint(equalTo: textFieldUserImage.centerYAnchor).isActive = true
        userTextfiel.leftAnchor.constraint(equalTo: textFieldUserImage.rightAnchor, constant: 8).isActive = true
        userTextfiel.rightAnchor.constraint(equalTo: textFieldView.rightAnchor, constant: -18).isActive = true
        
        
        passwordtextFieldView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordtextFieldView.widthAnchor.constraint(equalTo: centerFieldView.widthAnchor, multiplier: 0.9).isActive = true
        passwordtextFieldView.centerXAnchor.constraint(equalTo: centerFieldView.centerXAnchor).isActive = true
        passwordtextFieldView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 10).isActive = true
        
        //passwordtextFieldUserImage
        passwordtextFieldUserImage.centerYAnchor.constraint(equalTo: passwordtextFieldView.centerYAnchor).isActive = true
        passwordtextFieldUserImage.leftAnchor.constraint(equalTo: passwordtextFieldView.leftAnchor, constant: 18).isActive = true
        passwordtextFieldUserImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        passwordtextFieldUserImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //showPasswordBtn
        
        showPasswordBtn.centerYAnchor.constraint(equalTo: passwordtextFieldView.centerYAnchor).isActive = true
        showPasswordBtn.rightAnchor.constraint(equalTo: passwordtextFieldView.rightAnchor, constant: -18).isActive = true
        showPasswordBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        showPasswordBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //password TextField:-
        passwordTextfiel.centerYAnchor.constraint(equalTo: showPasswordBtn.centerYAnchor).isActive = true
        passwordTextfiel.leftAnchor.constraint(equalTo: passwordtextFieldUserImage.rightAnchor, constant: 8).isActive = true
        passwordTextfiel.rightAnchor.constraint(equalTo: showPasswordBtn.leftAnchor, constant: -8).isActive = true
        
        //forgotpassword:-
        forgetPasswordButton.topAnchor.constraint(equalTo: passwordtextFieldView.bottomAnchor, constant: 8).isActive = true
        forgetPasswordButton.rightAnchor.constraint(equalTo: passwordtextFieldView.rightAnchor, constant: -18).isActive = true
        
        
        rememberMeBtn.centerYAnchor.constraint(equalTo: forgetPasswordButton.centerYAnchor).isActive = true
        rememberMeBtn.leftAnchor.constraint(equalTo: passwordtextFieldUserImage.leftAnchor).isActive = true
        rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeBtn.centerYAnchor).isActive = true
        rememberMeLabel.leftAnchor.constraint(equalTo: rememberMeBtn.rightAnchor, constant: 8).isActive = true
        loginButton.topAnchor.constraint(equalTo: rememberMeBtn.bottomAnchor, constant: 15).isActive = true
        loginButton.leftAnchor.constraint(equalTo: passwordtextFieldView.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordtextFieldView.rightAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plusMeBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        plusMeBtn.heightAnchor.constraint(equalToConstant: 70).isActive = true
        plusMeBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        plusMeBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
    }
    
}
//Login Actions
extension LoginVC {
    @objc fileprivate func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        print("LOgin Controller")
    }
}

