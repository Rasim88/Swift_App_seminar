//
//  ViewController.swift
//  Project_1
//
//  Created by Расим on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Authorization"
        label.textAlignment = .center
        label.font = UIFont(name: "Papyrus", size: 24)
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loginField: UITextField = {
        let login = UITextField()
        login.borderStyle = .line
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.black.cgColor
        login.textColor = .black
        let placeholderText = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        login.attributedPlaceholder = placeholderText
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    
    private var passwordField: UITextField = {
        let password = UITextField()
        password.borderStyle = .line
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
        password.textColor = .black
        let placeholderText = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        password.attributedPlaceholder = placeholderText
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViews()
        enterButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(enterButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let passwordFieldTrailingConstraint = NSLayoutConstraint(item: passwordField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -30)
        passwordFieldTrailingConstraint.isActive = true

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 4),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 3.5),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/15),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
            loginField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 10),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordFieldTrailingConstraint,
            passwordField.heightAnchor.constraint(equalToConstant: 30),
            
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            enterButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/4),
            enterButton.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
        ])
    }

    @objc func tap() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

    
}
