//
//  ViewController.swift
//  3m.6hw
//
//  Created by Meerim Mamatkadyrova on 5/6/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "Image")
        return backgroundImage
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Welcome"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.text = "Login to your account"
        subTitleLabel.font = .boldSystemFont(ofSize: 20)
        subTitleLabel.textColor = .systemGray3
        return subTitleLabel
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = .boldSystemFont(ofSize: 18)
        emailLabel.textColor = .white
        return emailLabel
    }()
    
    private let emailTF: UITextField = {
        let emailTF = UITextField()
        emailTF.placeholder = "Email"
        emailTF.backgroundColor = .white
        emailTF.layer.cornerRadius = 8
        emailTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: emailTF.frame.height))
        emailTF.leftViewMode = .always
        return emailTF
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = .boldSystemFont(ofSize: 18)
        passwordLabel.textColor = .white
        return passwordLabel
    }()
    
    private let passwordTF: UITextField = {
        let passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.backgroundColor = .white
        passwordTF.layer.cornerRadius = 8
        passwordTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTF.frame.height))
        passwordTF.leftViewMode = .always
        return passwordTF
    }()
    
    private let eyeButton: UIButton = {
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.addTarget(self, action: #selector(eye), for: .touchUpInside)
        eyeButton.tintColor = .systemGray3
        return eyeButton
    }()
    
    @objc func eye(){
        if passwordTF.isSecureTextEntry == true {
            passwordTF.isSecureTextEntry = false
        }else{
            passwordTF.isSecureTextEntry = true
        }
    }
    
    private let fgtPwdLabel: UILabel = {
        let fgtPwdLabel = UILabel()
        fgtPwdLabel.text = "Forgot Password?"
        fgtPwdLabel.font = .boldSystemFont(ofSize: 16)
        fgtPwdLabel.textColor = .red
        return fgtPwdLabel
    }()
    
    private let loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .tintColor
        loginButton.layer.cornerRadius = 24
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        return loginButton
    }()
    
    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Don't have account?"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.textColor = .white
        return textLabel
    }()

    private let createNowLabel: UILabel = {
        let createNowLabel = UILabel()
        createNowLabel.text = "Create Now"
        createNowLabel.font = .boldSystemFont(ofSize: 16)
        createNowLabel.textColor = .darkGray
        return createNowLabel
    }()
    
    private let googleImage: UIImageView = {
        let googleImage = UIImageView()
        googleImage.image = UIImage(named: "1")
        return googleImage
    }()
    
    private let facebookImage: UIImageView = {
        let googleImage = UIImageView()
        googleImage.image = UIImage(named: "2")
        return googleImage
    }()
    
    private let instagramImage: UIImageView = {
        let instagramImage = UIImageView()
        instagramImage.image = UIImage(named: "3")
        return instagramImage
    }()
    
    @objc func login() {
        var TFArray: [UITextField] = [emailTF, passwordTF]
        var DidSignUpEnd = 0
            for i in TFArray {
                if i.text != "" {
                    DidSignUpEnd += 1
                } else if i.text == ""{
                    i.placeholder = " Заполните, пожалуйста"
                    i.layer.borderWidth = 2
                    i.layer.borderColor = UIColor.red.cgColor
                    DidSignUpEnd = 0
                }
            }
            if DidSignUpEnd == 2 {
                let vc = FinalViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    @objc func openReg() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNowLabel.isUserInteractionEnabled = true
        createNowLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openReg)))
        
        view.backgroundColor = .black
        
        initSubviews()
        
    }
    
    private func initSubviews() {
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTF)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTF)
        passwordTF.addSubview(eyeButton)
        view.addSubview(fgtPwdLabel)
        view.addSubview(loginButton)
        view.addSubview(textLabel)
        view.addSubview(createNowLabel)
        view.addSubview(googleImage)
        view.addSubview(facebookImage)
        view.addSubview(instagramImage)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(25)
        }
        
        emailTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(emailTF.snp.bottom).offset(6)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(passwordLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        eyeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(32)
        }
        
        fgtPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(7)
            make.trailing.equalToSuperview().offset(-30)
            }
        
        loginButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(40)
            make.top.equalTo(fgtPwdLabel.snp.bottom).offset(28)
            make.height.equalTo(48)
        }
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(70)
            make.top.equalTo(loginButton.snp.bottom).offset(14)
        }
        
        createNowLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(70)
            make.top.equalTo(loginButton.snp.bottom).offset(14)
        }
        
        facebookImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(50)
            make.height.width.equalTo(30)
        }
        
        googleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(97)
            make.top.equalTo(textLabel.snp.bottom).offset(50)
            make.height.width.equalTo(30)
        }
        
        instagramImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-97)
            make.top.equalTo(textLabel.snp.bottom).offset(50)
            make.height.width.equalTo(30)
        }
    }
}
