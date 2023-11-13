//
//  SecondAnimationsViewController.swift
//  AnimationsApp
//
//  Created by nika razmadze on 13.11.23.
//

import UIKit

class SecondAnimationsViewController: UIViewController {
    
    //MARK: - Properties
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.alpha = 1.0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Hello, dear friend"
        return label
    }()
    
    let gradientLayer = CAGradientLayer()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    //MARK: - Private Methods
    private func setupUI(){
        setupView()
        animateGradient()
        setupLabel()
        animateLabel()
    }
    
    private func setupView() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func animateGradient() {
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.fromValue = [UIColor.red.cgColor, UIColor.blue.cgColor]
        colorChangeAnimation.toValue = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        colorChangeAnimation.duration = 6
        colorChangeAnimation.autoreverses = true
        colorChangeAnimation.repeatCount = .infinity
        
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
    }
    
    private func setupLabel() {
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
        

    private func animateLabel() {
         UIView.animate(withDuration: 3, delay: 0.5, options: [.curveEaseInOut], animations: { [weak self] in
             self?.greetingLabel.transform = CGAffineTransform(rotationAngle: .pi)
         }) { [weak self] _ in
             UIView.animate(withDuration: 3, delay: 0.5, options: [.curveEaseInOut], animations: { [weak self] in
                 self?.greetingLabel.transform = .identity
                 //TODO: - უკან დაბრუნება ვერ გავაკეთე როგორც ვიდეოში იყო
                 //self?.greetingLabel.transform = CGAffineTransform(rotationAngle: -(.pi))
                 //ეს ვცადე და შეშდებოდა ერთხელ რო ამოტრიალდებოდა
             }) { [weak self] _ in
                 self?.animateLabel()
             }
         }
     }


}
