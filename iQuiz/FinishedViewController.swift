//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController, QuizComponentViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var percentScoreLabel: UILabel!
    @IBOutlet weak var fractionScoreLabel: UILabel!

    // external data
    private var quizState: QuizState?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(from state: QuizState) {
        self.quizState = state
    }

    private func refreshView() {
        if let state = quizState {
            let score = state.getScore()
            let total = state.getQuestionCount()
            let scoreAsPercent = Int(Double(score) / Double(total) * 100)
            let scoreColor = UIColor(hue: CGFloat(scoreAsPercent) / CGFloat(200),
                                     saturation: 0.8,
                                     brightness: 0.8,
                                     alpha: 1.0)
            let messageText = scoreAsPercent == 100 ? "!!Perfect!!"
                            : scoreAsPercent > 90   ? "Nice!"
                            : scoreAsPercent > 70   ? "Good work"
                            : scoreAsPercent > 50   ? "Well, it could be worse"
                            : "Bruh"

            messageLabel?.text = messageText
            percentScoreLabel?.text = "  \(scoreAsPercent)%"
            fractionScoreLabel?.text = "\(score) / \(total)"

            messageLabel?.textColor = scoreColor
            percentScoreLabel?.textColor = scoreColor
            fractionScoreLabel?.textColor = scoreColor
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
