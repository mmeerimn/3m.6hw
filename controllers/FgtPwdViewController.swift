//
//  FgtPwdViewController.swift
//  3m.6hw
//
//  Created by Meerim Mamatkadyrova on 5/6/23.
//

import UIKit

class FgtPwdViewController: UIViewController {
    
    var email: String!
    
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
    
    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Don't have account?"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.textColor = .white
        return textLabel
    }()

    private let needHelpLabel: UILabel = {
        let needHelpLabel = UILabel()
        needHelpLabel.text = "Create Now"
        needHelpLabel.font = .boldSystemFont(ofSize: 16)
        needHelpLabel.textColor = .darkGray
        return needHelpLabel
    }()
    
    private let sendOtpButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Send OTP", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .tintColor
        loginButton.layer.cornerRadius = 24
        loginButton.addTarget(self, action: #selector(sendOTP), for: .touchUpInside)
        return loginButton
    }()

    @objc func sendOTP() {
        var otp = String(Int.random(in: 1000...9999))
        showAllert(message: otp)
    }
    
    private func showAllert(message: String) {
       
        let aletrController = UIAlertController(title: "OTP", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
            
        }
        
        aletrController.addAction(okAction)
        
        
        present(aletrController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        emailTF.text = email

        initSubviews()
    }
    
    private func initSubviews() {
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTF)
        view.addSubview(textLabel)
        view.addSubview(needHelpLabel)
        view.addSubview(sendOtpButton)

        
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalTo(titleLabel.snp.bottom).offset(61)
        }
        
        emailTF.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.height.equalTo(48)
        }
        
        sendOtpButton.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(40)
            make.top.equalTo(emailTF.snp.bottom).offset(22)
            make.height.equalTo(48)
        }
        
    }
 
}
