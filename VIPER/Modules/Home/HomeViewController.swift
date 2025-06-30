//
//  HomeViewController.swift
//  VIPER
//
//  Created by Shivaji N. Pawar on 30/06/25.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI(){

        let label = UILabel()
                label.text = "Welcome to the Home Screen!"
                label.textAlignment = .center
                label.font = .systemFont(ofSize: 22, weight: .medium)
                label.translatesAutoresizingMaskIntoConstraints = false
                label.accessibilityIdentifier = "Welcome to the Home Screen!"
                view.addSubview(label)

                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
        
    }
}

