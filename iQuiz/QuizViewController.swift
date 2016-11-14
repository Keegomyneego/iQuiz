//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    private var quiz: QuizModel? = nil {
        willSet {
            print("setting to: \(newValue)")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // UI based on Nib
//        Bundle.main.loadNibNamed("QuizViewController", owner: self, options: nil)
    }

    //
    // MARK: - Navigation
    //

    public func loadData(fromTheQuizWith thisDopeAssQuizId: Int) {
        self.quiz = MockDBModel.getQuiz(at: thisDopeAssQuizId)
        Log.info(self, "just loaded data at \(thisDopeAssQuizId) and got: \(self.quiz)")
    }

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Log.info(self, "preparing for segue \(segue.identifier)")

        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "EmbedChildVC": SegueAction(to: UINavigationController.self) {
                    navVC in

                    guard let questionVC = navVC.viewControllers.first as? QuestionViewController else {
                        return
                    }

                    Log.info(self, "successfully prepared to segue to \(type(of: questionVC)) with quiz \(self.quiz)")

                    guard let quiz = self.quiz else {
                        return
                    }

                    Log.info(self, "questions[0]: \(quiz.questions[0])")

                    // Start with the first question
                    questionVC.loadData(from: quiz.questions[0])
                }
            ]
        )
    }
}
