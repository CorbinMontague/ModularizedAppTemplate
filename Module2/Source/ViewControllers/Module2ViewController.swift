//
//  Module2ViewController.swift
//  Module2
//
//  Created by Corbin Montague on 4/8/20.
//  Copyright © 2020 Corbin. All rights reserved.
//

import Core
import Foundation
import UIKit

public class Module2ViewController: UIViewController {
    
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
    
    private let moduleAvatar: UIImageView = {
        let image = UIImage(named: "moduleAvatar", in: Bundle(for: Module2ViewController.self), compatibleWith: nil)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = String(format: localize.string(forKey: "greetingModule", comment: "Welcome to BRAND"), brand.displayName, "Module2")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle(localize.string(forKey: "back", comment: "Back"), for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Constructors
    
    public init(brand: Brand, localize: Localize) {
        self.brand = brand
        self.localize = localize
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - View Setup
    
    private func setupView() {
        view.backgroundColor = .purple
        
        addSubviews()
        setupConstraints()
        setupActions()
    }

    private func addSubviews() {
        view.addSubview(sharedAvatar)
        view.addSubview(brandedAvatar)
        view.addSubview(moduleAvatar)
        view.addSubview(titleLabel)
        view.addSubview(backButton)
    }
    
    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = [
            titleLabel.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            sharedAvatar.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            sharedAvatar.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            sharedAvatar.heightAnchor.constraint(equalToConstant: 100),
            sharedAvatar.widthAnchor.constraint(equalToConstant: 100),
            
            brandedAvatar.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            brandedAvatar.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            brandedAvatar.heightAnchor.constraint(equalToConstant: 100),
            brandedAvatar.widthAnchor.constraint(equalToConstant: 100),
            
            moduleAvatar.topAnchor.constraint(equalTo: sharedAvatar.bottomAnchor, constant: 20),
            moduleAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moduleAvatar.heightAnchor.constraint(equalToConstant: 100),
            moduleAvatar.widthAnchor.constraint(equalToConstant: 100),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
    }
    
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}
