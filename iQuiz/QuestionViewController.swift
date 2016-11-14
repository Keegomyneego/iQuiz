//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, QuizComponentViewController {

    let selectedColor: UIColor = UIColor(hue: CGFloat(195) / CGFloat(360), saturation: 0.4, brightness: 1.0, alpha: 1.0)

    @IBOutlet weak var questionLabel: UILabel?
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!

    var buttons: [UIButton] = []

    // external data
    var quizState: QuizState?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupButtons()
        refreshView()
    }

    func loadData(from state: QuizState) {
        Log.info(self, "loading state:    \(state)")
        Log.info(self, "for current page: \(state.getCurrentPage())")
        self.quizState = state
    }

    private func setupButtons() {
        let optionalButtons: [UIButton?] = [
            answer1Button,
            answer2Button,
            answer3Button,
            answer4Button,
        ]

        self.buttons = optionalButtons.flatMap({ $0 })

        Log.info(self, "button count: \(buttons.count)")

        for index in 0..<buttons.count {
            buttons[index].tag = index
        }
    }

    private func refreshView() {
        if let question = self.quizState?.getCurrentQuestion() {
            questionLabel?.text = question.text

            for index in 0..<buttons.count {
                buttons[index].setTitle(question.answers[index], for: UIControlState.normal)
            }
        }
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let buttonIndex = sender.tag

        quizState?.guess(index: buttonIndex)
        visuallySelectButton(at: buttonIndex)
    }

    internal func visuallySelectButton(at targetIndex: Int, with color: UIColor? = nil) {
        buttons.forEach({
            $0.backgroundColor = UIColor.clear
        })

        buttons[targetIndex].backgroundColor = color ?? selectedColor
    }
}
