//
//  SliderVC.swift
//  DesignLove
//
//  Created by Muhammad Rehan on 12/16/22.
//

import UIKit

class SliderVC: UIViewController {

    let bgImage: UIImageView = {
        return UIImageView().backGroundImage(name: "1", scales: .scaleToFill)
    }()
    
    let blurView: UIView = {
        return UIView().blurView(color: UIColor.white.withAlphaComponent(0.2))
    }()
    
    let TopLabel: UILabel = {
        return UILabel().labels(labelText: "FANCY", fontSize: 27, textColor: UIColor.white, aliegnment: .left)
    }()
    
    let storyLabel: UILabel = {
        return UILabel().labels(labelText: "Shop the most modern essentionals ", fontSize: 34, textColor: UIColor.white, aliegnment: .left)
    }()
    
    
    let skipButton: UIButton = {
        return UIButton().btn(btnText: "Skip", textColor: UIColor.white)
    }()
    
    let nextTitleButtont: UIButton = {
        return UIButton().btn(btnText: "Next", textColor: UIColor.white)
    }()
    
    let pageCountLabel: UILabel = {
        return UILabel().regulerLabel(text: "1", textColor: UIColor.white, aligement: .center, fonts: .systemFont(ofSize: 17, weight: .bold), border: 1, borderCollor: UIColor.white, cornorRedius: 15)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
     
        
    }
    
    
    fileprivate func setupView() {
        
        [bgImage, blurView, skipButton, storyLabel, nextTitleButtont].forEach({
            view.addSubview($0)
        })
        
        [TopLabel, pageCountLabel].forEach({
            blurView.addSubview($0)
        })
        
        skipButton.addTarget(self, action: #selector(skipAction(sender:)), for: .touchUpInside)
        nextTitleButtont.addTarget(self, action: #selector(nextMove(sender:)), for: .touchUpInside)
        
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bgImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        blurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        TopLabel.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 75).isActive = true
        TopLabel.leftAnchor.constraint(equalTo: blurView.leftAnchor, constant: 30).isActive = true
        
        skipButton.centerYAnchor.constraint(equalTo: TopLabel.centerYAnchor).isActive = true
        skipButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        storyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        storyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        storyLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        storyLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
        
        pageCountLabel.leftAnchor.constraint(equalTo: storyLabel.leftAnchor).isActive = true
        pageCountLabel.centerYAnchor.constraint(equalTo: nextTitleButtont.centerYAnchor).isActive = true
        pageCountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageCountLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        nextTitleButtont.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        nextTitleButtont.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
    }

    
    
    
}

// MARK: - Button Actions:
extension SliderVC {
    @objc fileprivate func skipAction(sender: UIButton) {
        print("Skip is Done")
        self.show(HomeVC(), sender: self)
    }
    
    @objc fileprivate func nextMove(sender: UIButton) {
        print("Next Movies")
    }
}



extension UIView {
    func backGroundImage(name: String, scales: ContentMode) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: name)
        image.contentMode = scales
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func blurView(color: UIColor) -> UIView {
        let v = UIView()
        v.backgroundColor = color
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }
    
    func simpleView(color: UIColor, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> UIView {
        let simpleLabel: UIView =  UIView()
        simpleLabel.backgroundColor = color
        simpleLabel.layer.borderWidth = borderWidth
        simpleLabel.layer.borderColor = borderColor.cgColor
        simpleLabel.layer.cornerRadius = cornerRadius
        simpleLabel.clipsToBounds = true
        simpleLabel.translatesAutoresizingMaskIntoConstraints = false
        return simpleLabel
        
    }
    
    func labels(labelText: String, fontSize: Int, textColor: UIColor, aliegnment: NSTextAlignment) -> UILabel {
        let lbl: UILabel = UILabel()
        lbl.text = labelText
        lbl.numberOfLines = 0
        lbl.textColor = textColor
        lbl.textAlignment = aliegnment
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .bold)
        return lbl
    }
    
    func regulerLabel(text: String, textColor: UIColor, aligement: NSTextAlignment, fonts: UIFont, border: Int, borderCollor: UIColor, cornorRedius: Int) -> UILabel {
        let leb: UILabel = UILabel()
        leb.text = text
        leb.numberOfLines = 0
        leb.textColor = textColor
        leb.font = fonts
        leb.textAlignment = aligement
        leb.layer.borderWidth = CGFloat(border)
        leb.layer.borderColor = borderCollor.cgColor
        leb.layer.cornerRadius = CGFloat(cornorRedius)
        leb.clipsToBounds = true
        leb.translatesAutoresizingMaskIntoConstraints = false
        return leb
    }
    
    
    func btn(btnText: String, textColor: UIColor) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(btnText, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        return button
    }
    
    func mainButtoms(btnText: String, bgColor: UIColor, textColor: UIColor, fonts: UIFont, cornarRadius: CGFloat) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(btnText, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = cornarRadius
        button.titleLabel?.font = fonts
        return button
    }
    
    /*
     et homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)
     let homeImage = UIImage(systemName: "house", withConfiguration: homeSymbolConfiguration)
     let width = homeImage?.size.width
     let height = homeImage?.size.height
     let homeButton = UIButton(frame: CGRect(x: 100, y: 100, width: width!, height: height!))
     homeButton.tintColor = UIColor.gray
     homeButton.setImage(homeImage, for: .normal)
     view.addSubview(homeButton)
     */
    
    func systemImageView(image: UIImage, tintColor: UIColor, scale: ContentMode) -> UIImageView {
        let systemImage: UIImageView = UIImageView()
        systemImage.image = image
        systemImage.tintColor = tintColor
        systemImage.contentMode = scale
        systemImage.translatesAutoresizingMaskIntoConstraints = false
        return systemImage
    }
    
    func btnWithImage(btnText: String, textColor: UIColor, image: UIImage, tintColor: UIColor) -> UIButton {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(btnText, for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
        button.setTitleColor(textColor, for: .normal)
        return button
    }
    
    func textField(bgColor: UIColor, texts: String, textColor: UIColor, fieldPlaceHolder: String, textalignment: NSTextAlignment, textSecurity: Bool) -> UITextField {
        let txt: UITextField = UITextField()
        txt.backgroundColor = bgColor
        txt.text = texts
        txt.textAlignment = textalignment
        txt.textColor = textColor
        txt.placeholder = fieldPlaceHolder
        txt.isSecureTextEntry = textSecurity
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }
    
    
    
    
}



//extension UIImageView {
//    func setImageAndUpdateFrameHeight(image: UIImage) {
//            self.image = image
//
//            if image.size.width > 0 {
//                self.frame.size.height = self.frame.size.width / image.size.width * image.size.height
//            }
//        }
//}
//
//
//class ResizingImageView: UIImageView {
//    var aspectRatio: NSLayoutConstraint?
//
//    func setImageAndUpdateAspectRatio(image: UIImage) {
//        self.image = image
//
//        aspectRatio?.isActive = false
//        if image.size.width > 0 {
//            aspectRatio = self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: image.size.height / image.size.width)
//        }
//        aspectRatio?.isActive = true
//    }
//}








