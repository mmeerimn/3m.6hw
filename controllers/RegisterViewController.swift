//
//  RegisterViewController.swift
//  3m.6hw
//
//  Created by Meerim Mamatkadyrova on 5/6/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    
    private let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.font = .boldSystemFont(ofSize: 18)
        usernameLabel.textColor = .white
        return usernameLabel
    }()
    
    private let usernameTF: UITextField = {
        let usernameTF = UITextField()
        usernameTF.placeholder = "Username"
        usernameTF.backgroundColor = .white
        usernameTF.layer.cornerRadius = 8
        usernameTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: usernameTF.frame.height))
        usernameTF.leftViewMode = .always
        return usernameTF
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
    
    private let mobileNumberLabel: UILabel = {
        let mobileNumberLabel = UILabel()
        mobileNumberLabel.text = "Mobile Number"
        mobileNumberLabel.font = .boldSystemFont(ofSize: 18)
        mobileNumberLabel.textColor = .white
        return mobileNumberLabel
    }()
    
    private let mobileNumberTF: UITextField = {
        let mobileNumberTF = UITextField()
        mobileNumberTF.placeholder = "Mobile Number"
        mobileNumberTF.backgroundColor = .white
        mobileNumberTF.layer.cornerRadius = 8
        mobileNumberTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: mobileNumberTF.frame.height))
        mobileNumberTF.leftViewMode = .always
        return mobileNumberTF
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
    
    @objc func eye() {
        if passwordTF.isSecureTextEntry == true {
            passwordTF.isSecureTextEntry = false
        } else {
            passwordTF.isSecureTextEntry = true
        }
    }
    
    
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
    
    @objc func login() {
        let TFArray: [UITextField] = [usernameTF, emailTF, mobileNumberTF, passwordTF]
        
        var DidSignUpEnd = 0
            for i in TFArray {
                if i.text != "" {
                    DidSignUpEnd += 1
                } else if i.text == "" {
                    i.placeholder = " Заполните, пожалуйста"
                    i.layer.borderWidth = 2
                    i.layer.borderColor = UIColor.red.cgColor
                    DidSignUpEnd = 0
                }
            }
            if DidSignUpEnd == 4 {
                let vc = FgtPwdViewController()
                vc.email = emailTF.text
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        initSubviews()
    }
    
    private func initSubviews() {
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTF)
        view.addSubview(emailLabel)
        view.addSubview(emailTF)
        view.addSubview(mobileNumberLabel)
        view.addSubview(mobileNumberTF)
        view.addSubview(passwordTF)
        view.addSubview(passwordLabel)
        passwordTF.addSubview(eyeButton)
        view.addSubview(loginButton)

        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
        }
        
        usernameTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(usernameLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(usernameTF.snp.bottom).offset(6)
        }
        
        emailTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        mobileNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(emailTF.snp.bottom).offset(6)
        }
        
        mobileNumberTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(mobileNumberLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(mobileNumberTF.snp.bottom).offset(6)
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
        
        loginButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(40)
            make.top.equalTo(passwordTF.snp.bottom).offset(28)
            make.height.equalTo(48)
        }
        
    }
}
