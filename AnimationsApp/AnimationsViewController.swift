//
//  ViewController.swift
//  AnimationsApp
//
//  Created by nika razmadze on 13.11.23.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    //MARK: - Properties
    
    let clickMeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemCyan
        label.alpha = 0.0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Click anywhere"
        return label
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        setupView()
        setupLabel()
        animateLabel()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupLabel() {
        view.addSubview(clickMeLabel)
        
        NSLayoutConstraint.activate([
            clickMeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clickMeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        ])
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0.5, options: [.curveEaseInOut], animations: { [weak self] in
            self?.clickMeLabel.transform = CGAffineTransform(translationX: 0, y: -200)
            self?.clickMeLabel.alpha = 1.0
        }) { [weak self] _ in
            UIView.animate(withDuration: 2, delay: 0.5, options: [.curveEaseInOut], animations: { [weak self] in
                self?.clickMeLabel.transform = .identity
                self?.clickMeLabel.alpha = 0.0
            }) { [weak self] _ in
                self?.animateLabel()
            }
        }
    }
    
    @objc private func screenTapped() {
        navigationController?.pushViewController(SecondAnimationsViewController(), animated: true)
    }
    
}


