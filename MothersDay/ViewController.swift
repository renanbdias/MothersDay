//
//  ViewController.swift
//  MothersDay
//
//  Created by Renan Benatti Dias on 09/05/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let messages = [
        "Buona Festa della mamma!",
        "Bonne Fête des mères!",
        "Alles Gute/Liebe zum Muttertag!",
        "母の日!",
        "Feliz Día de la Madre!",
        "Feliz Dia das Mães!",
        "母亲节快乐!",
        "haengboghan eomeoni nal doeseyo!",
        "Happy Mother’s Day!",
    ]
    
    var current = -1
    
    let centerLabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: -20, width: view.frame.width, height: view.frame.height)
        
        let confettiView = SAConfettiView(frame: frame)
        confettiView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confettiView)
        
        view.addSubview(centerLabel)
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            centerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 172),
            centerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            centerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        confettiView.type = .Image(UIImage(named: "red")!)

        confettiView.colors = [
            UIColor(red:0.95, green:0.40, blue:0.27, alpha:1.0),
            UIColor(red:1.00, green:0.78, blue:0.36, alpha:1.0),
            UIColor(red:0.58, green:0.39, blue:0.55, alpha:1.0)]
        
        confettiView.intensity = 0.65
        
        confettiView.startConfetti()
        
        centerLabel.text = "Happy Mother's Day"
        centerLabel.font = UIFont(name: "Sofia-Regular", size: 48)
        centerLabel.textAlignment = .center
        centerLabel.textColor = .white
        centerLabel.numberOfLines = 0
        
        centerLabel.layer.shadowColor = UIColor.black.cgColor
        centerLabel.layer.shadowRadius = 3.0
        centerLabel.layer.shadowOpacity = 1.0
        centerLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        centerLabel.layer.masksToBounds = false
        
        view.backgroundColor = UIColor(red: 254/255, green: 219/255, blue: 233/255, alpha: 1)
        
        fadeLabel()
    }
    
    func fadeLabel() {
        UIView.animate(withDuration: 3, delay: 2, options: [], animations: {
            self.centerLabel.alpha = 0
        }) { (_) in
            self.changeLabel()
        }
    }
    
    func changeLabel() {
        current += 1
        
        if current >= messages.count {
            current = 0
        }
        
        centerLabel.text = messages[current]
        
        UIView.animate(withDuration: 2, animations: {
            self.centerLabel.alpha = 1
        }) { (_) in
            self.fadeLabel()
        }
    }
}
