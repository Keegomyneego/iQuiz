//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // external data
    private var quiz: QuizModel? = nil

    //
    // MARK: - Navigation
    //

    public func loadData(fromTheQuizWith thisDopeAssQuizId: Int) {
        self.quiz = MockDBModel.getQuiz(at: thisDopeAssQuizId)
    }

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "EmbedChildVC": SegueAction(to: UINavigationController.self) {
                    navVC in

                    guard let questionVC = navVC.viewControllers.first as? QuestionViewController else {
                        Log.error(self, (
                            expected: "embedded child vc to be a \(type(of: QuestionViewController.self))",
                            actual: "\(type(of: navVC.viewControllers.first))"
                        ))
                        return
                    }

                    guard let quiz = self.quiz else {
                        Log.error(self, because: "quiz is nil, can't segue to its first question")
                        return
                    }

                    // Start with the first question
                    questionVC.loadData(from: quiz.questions[0])
                }
            ]
        )
    }
}
