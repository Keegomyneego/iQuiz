//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class AnswerViewController: QuestionViewController {

    // external data
//    private var quizState: QuizState? {
//        didSet {
//            Log.info(self, ">>>> did set")
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        disableAnswerButtons()
        highlightAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func disableAnswerButtons() {
        self.buttons.forEach({
            $0.isUserInteractionEnabled = false
        })
    }

    private func highlightAnswer() {
        guard let state = quizState else {
            Log.error(self, because: "quiz state is nil!")
            return
        }

        Log.info(self, "highlighting answer, state.getCurrentGuess(): \(state.getCurrentGuess())")

        let correctColor = UIColor(hue: CGFloat(76) / CGFloat(360), saturation: 0.47, brightness: 0.86, alpha: 1.0)
        let incorrectColor = UIColor(hue: CGFloat(347) / CGFloat(360), saturation: 0.24, brightness: 0.96, alpha: 1.0)

        let theAnswerIndex = state.getCurrentQuestion().answer
        visuallySelectButton(at: theAnswerIndex,
                             with: correctColor)

        if let theGuessIndex = state.getCurrentGuess() {
            Log.info(self, "highlighting guess")
            visuallySelectButton(at: theGuessIndex,
                                 with: state.currentGuessIsRight()
                                    ? correctColor
                                    : incorrectColor
            )
        }
    }

    override func visuallySelectButton(at targetIndex: Int, with color: UIColor?) {
        buttons[targetIndex].backgroundColor = color ?? selectedColor
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
