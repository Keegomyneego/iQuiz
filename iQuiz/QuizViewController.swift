//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var quizId: Int? {
        didSet {
            if let qId = quizId {
                quiz = MockDBModel.getQuiz(at: qId)
            }
        }
    }

    private var quiz: QuizModel? = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // UI based on Nib
//        Bundle.main.loadNibNamed("QuizViewController", owner: self, options: nil)
    }

    //
    // MARK: - Navigation
    //

    func loadData(fromTheQuizWith thisDopeAssQuizId: Int) {
        self.quizId = thisDopeAssQuizId
    }

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing for segue \(segue.identifier)")
        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "CellSelected": SegueAction(to: QuestionViewController.self) {
                    questionVC in

                    print("successly prepared to segue to \(type(of: questionVC))")

                    guard let quiz = self.quiz else {
                        return
                    }

                    // Start with the first question
                    questionVC.loadData(from: quiz.questions[0])
                }
            ]
        )
    }
}
