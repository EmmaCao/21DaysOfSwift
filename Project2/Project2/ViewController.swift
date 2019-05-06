//
//  ViewController.swift
//  Project2
//
//  Created by Emma on 2019/5/6.
//  Copyright © 2019 Emma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var answerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "ShowScore", style: .plain, target: self, action: #selector(showScore))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    @objc func showScore(){
        let ac = UIAlertController(title: "Score", message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(ac, animated: true)
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        var message: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            message = "Your score is \(score)."
        }else{
            title = "Wrong"
            score -= 1
            message = "Wrong! That's the flag of \(countries[sender.tag].capitalizingFirstLetter())"
        }
        
        answerCount += 1
        
        if answerCount < 10 {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }else{
            self.navigationItem.title = countries[correctAnswer].uppercased() + " \(score)"
            let aco = UIAlertController(title: "Finished", message: "Your final score is \(score)", preferredStyle: .alert)
            aco.addAction(UIAlertAction(title: "Finish", style: .default, handler: nil))
            disableButtons([button1, button2, button3])
            present(aco, animated: true)
        }
    }
    
    func disableButtons(_ buttons: [UIButton]){
        for button: UIButton in buttons {
            button.isUserInteractionEnabled = false
        }
    }
}

extension String{
    func capitalizingFirstLetter() -> String{
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizingFirstLetter(){
        self = self.capitalizingFirstLetter()
    }
}

