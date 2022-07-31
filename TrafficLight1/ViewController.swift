//
//  ViewController.swift
//  TrafficLight1
//
//  Created by roman Khilchenko on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var greenView: UIView!
    private var nextColourLight = CurrentLight.red
    private let turnOn: CGFloat = 1
    private let turnOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupButton()
        
    }
    
    @IBAction func tapAction() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch nextColourLight {
        case .red:
            redView.alpha = turnOn
            greenView.alpha = turnOff
            nextColourLight = .yellow
        case .yellow:
            yellowView.alpha = turnOn
            redView.alpha = turnOff
            nextColourLight = .green
        default:
            greenView.alpha = turnOn
            yellowView.alpha = turnOff
            nextColourLight = .red
        }
    }
    
    private func setupViews() {
        let colours: [UIColor] = [.red, .yellow, .green]
        let views = [redView, yellowView, greenView]
        for (index, view) in views.enumerated() {
            if let view = view {
                view.backgroundColor = colours[index]
                view.alpha = turnOff
                view.layer.cornerRadius = 50
                
            }
        }
    }
    
    private func setupButton() {
        startButton.tintColor = .white
        startButton.backgroundColor = .systemBlue
        startButton.layer.cornerRadius = 10
        startButton.setTitle("START", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 23)
    }
    
    private enum CurrentLight {
        case red
        case yellow
        case green
    }
}

