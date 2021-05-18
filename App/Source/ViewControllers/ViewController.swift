//
//  ViewController.swift
//  App
//
//  Created by Corbin Montague on 5/18/21.
//

import Core
import Module1
import Module2
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private let brand: Brand
    private let localize: Localize
    
    // MARK: - Views
    
    private let sharedAvatar: UIImageView = {
        let image = UIImage(named: "sharedAvatar")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let brandedAvatar: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = localize.string(forKey: "greeting", comment: "Brand specific greeting")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var module1Button: UIButton = {
        let button = UIButton()
        button.setTitle(String(format: localize.string(forKey: "goToModule", comment: "Go to Module1"), "Module1"), for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var module2Button: UIButton = {
        let button = UIButton()
        button.setTitle(String(format: localize.string(forKey: "goToModule", comment: "Go to Module2"), "Module2"), for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Constructor
    
    init(brand: Brand, localize: Localize) {
        self.brand = brand
        self.localize = localize
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - View Setup
    
    private func setupView() {
        addSubviews()
        setupConstraints()
        colorBackground()
        setupActions()
    }
    
    private func addSubviews() {
        view.addSubview(sharedAvatar)
        view.addSubview(brandedAvatar)
        view.addSubview(titleLabel)
        view.addSubview(module1Button)
        view.addSubview(module2Button)
    }
    
    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            titleLabel.bottomAnchor.constraint(equalTo: module1Button.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            
            module1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80),
            module1Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            module2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            module2Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            sharedAvatar.topAnchor.constraint(equalTo: module1Button.bottomAnchor, constant: 20),
            sharedAvatar.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            sharedAvatar.heightAnchor.constraint(equalToConstant: 100),
            sharedAvatar.widthAnchor.constraint(equalToConstant: 100),
            
            brandedAvatar.topAnchor.constraint(equalTo: module1Button.bottomAnchor, constant: 20),
            brandedAvatar.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            brandedAvatar.heightAnchor.constraint(equalToConstant: 100),
            brandedAvatar.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func colorBackground() {
        switch brand {
        case .lightside:
            view.backgroundColor = .green
        case .darkside:
            view.backgroundColor = .red
        }
    }
    
    // MARK: - Actions
    
    private func setupActions() {
        module1Button.addTarget(self, action: #selector(module1ButtonTapped), for: .touchDown)
        module2Button.addTarget(self, action: #selector(module2ButtonTapped), for: .touchDown)
    }
    
    @objc private func module1ButtonTapped() {
        present(Module1ViewController(brand: brand, localize: localize),
                animated: true,
                completion: nil)
    }
    
    @objc private func module2ButtonTapped() {
        present(Module2ViewController(brand: brand, localize: localize),
                animated: true,
                completion: nil)
    }
    
}
