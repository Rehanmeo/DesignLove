//
//  HomeVC.swift
//  DesignLove
//
//  Created by Muhammad Rehan on 12/18/22.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    let bgImage: UIImageView = {
        return UIImageView().backGroundImage(name: "1", scales: .scaleToFill)
    }()
    
    let envelopeImage: UIImageView = {
        //return UIImageView().backGroundImage(name: "envelope", scales: .scaleAspectFit)
        return UIImageView().systemImageView(image: UIImage(systemName: "envelope")!, tintColor: UIColor.black, scale: .scaleAspectFit)
    }()
   
    let signupWithEmailLabel: UILabel = {
        return UILabel().labels(labelText: "Sign Up with Email", fontSize: 15, textColor: UIColor.black, aliegnment: .center)
    }()
    
    let facebookImage: UIImageView = {
        //return UIImageView().backGroundImage(name: "envelope", scales: .scaleAspectFit)
        return UIImageView().systemImageView(image: UIImage(systemName: "florinsign.circle")!, tintColor: UIColor.black, scale: .scaleAspectFit)
    }()
   
    let signupWithFacebookLabel: UILabel = {
        return UILabel().labels(labelText: "Continue with Facebook", fontSize: 15, textColor: UIColor.black, aliegnment: .center)
    }()
    
    let LoginButton: UIButton = {
        return UIButton().btn(btnText: "Log in", textColor: UIColor.white)
    }()
    
    let emailButton: UIButton = {
        return UIButton().btn(btnText: "", textColor: UIColor.clear)
    }()
    
    let centerTitleLabel: UILabel = {
        return UILabel().labels(labelText: "FANCY", fontSize: 56, textColor: UIColor.white, aliegnment: .center)
    }()
    
    let centerSubTitleLabel: UILabel = {
        return UILabel().regulerLabel(text: "Best fashan shopping App" , textColor: UIColor.white, aligement: .center, fonts: .systemFont(ofSize: 14, weight: .regular), border: 0, borderCollor: UIColor.clear, cornorRedius: 0)
    }()
    
    let fnButtonView: UIView = {
        return UIView().simpleView(color: UIColor.white, borderColor: UIColor.clear, borderWidth: 0, cornerRadius: 25)
    }()
    
    let withEmailButtonView: UIView = {
        return UIView().simpleView(color: UIColor.white, borderColor: UIColor.clear, borderWidth: 0, cornerRadius: 25)
    }()
    
    let stackView   = UIStackView()
    let stackViewtwo   = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        emailButton.addTarget(self, action: #selector(signWithEmail(sender:)), for: .touchUpInside)
        LoginButton.addTarget(self, action: #selector(loginButton(sender:)), for: .touchUpInside)
        
    }
    
    fileprivate func setupUI() {
        [bgImage, LoginButton, centerTitleLabel, centerSubTitleLabel, fnButtonView, withEmailButtonView].forEach({
            view.addSubview($0)
        })
        
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
//        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackViewtwo.axis  = NSLayoutConstraint.Axis.horizontal
//        stackViewtwo.distribution  = UIStackView.Distribution.equalSpacing
        stackViewtwo.distribution  = UIStackView.Distribution.fill
        stackViewtwo.alignment = UIStackView.Alignment.center
        stackViewtwo.spacing   = 4.0
        stackViewtwo.translatesAutoresizingMaskIntoConstraints = false
        
        [envelopeImage, signupWithEmailLabel].forEach({
            stackView.addArrangedSubview($0)
        })
        
        [facebookImage, signupWithFacebookLabel].forEach({
            stackViewtwo.addArrangedSubview($0)
        })
        
        envelopeImage.heightAnchor.constraint(equalToConstant: 26).isActive = true
        envelopeImage.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        facebookImage.heightAnchor.constraint(equalToConstant: 26).isActive = true
        facebookImage.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        
        [stackView, emailButton].forEach({
            withEmailButtonView.addSubview($0)
        })
        
        [stackViewtwo].forEach({
            fnButtonView.addSubview($0)
        })
        
        
        
        
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        LoginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        LoginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        centerTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        centerTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        centerSubTitleLabel.topAnchor.constraint(equalTo: centerTitleLabel.bottomAnchor, constant: 15).isActive = true
        centerSubTitleLabel.centerXAnchor.constraint(equalTo: centerTitleLabel.centerXAnchor).isActive = true
        centerSubTitleLabel.leftAnchor.constraint(equalTo: centerTitleLabel.leftAnchor).isActive = true
        centerSubTitleLabel.rightAnchor.constraint(equalTo: centerTitleLabel.rightAnchor).isActive = true
        
        fnButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        fnButtonView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        fnButtonView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        fnButtonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        withEmailButtonView.heightAnchor.constraint(equalTo: fnButtonView.heightAnchor).isActive = true
        withEmailButtonView.leftAnchor.constraint(equalTo: fnButtonView.leftAnchor).isActive = true
        withEmailButtonView.rightAnchor.constraint(equalTo: fnButtonView.rightAnchor).isActive = true
        withEmailButtonView.bottomAnchor.constraint(equalTo: fnButtonView.topAnchor, constant: -20).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: withEmailButtonView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: withEmailButtonView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        emailButton.topAnchor.constraint(equalTo: withEmailButtonView.topAnchor).isActive = true
        emailButton.leftAnchor.constraint(equalTo: withEmailButtonView.leftAnchor).isActive = true
        emailButton.bottomAnchor.constraint(equalTo: withEmailButtonView.bottomAnchor).isActive = true
        emailButton.rightAnchor.constraint(equalTo: withEmailButtonView.rightAnchor).isActive = true
        
        stackViewtwo.centerYAnchor.constraint(equalTo: fnButtonView.centerYAnchor).isActive = true
        stackViewtwo.centerXAnchor.constraint(equalTo: fnButtonView.centerXAnchor).isActive = true
        stackViewtwo.widthAnchor.constraint(equalToConstant: 215).isActive = true
    }
    
}

//Home Controller button actions:-

extension HomeVC {
    
    @objc func loginButton(sender: UIButton) {
        print("Logins")
        self.show(LoginVC(), sender: self)
    }
    
    @objc func signWithEmail(sender: UIButton) {
        print("Email With")
    }
}
