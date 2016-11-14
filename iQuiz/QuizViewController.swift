//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    private static let transitionSpeed: TimeInterval = 0.4

    // external data
    private var quizState: QuizState? = nil
//    private var quiz: QuizModel? = nil

    // internal data
    private var currentChildViewController: UIViewController!

    @IBOutlet weak var nextButton: UIButton!

    //
    // MARK: - Navigation
    //

    public func loadData(fromTheQuizWith thisDopeAssQuizId: Int) {
        let quiz = MockDBModel.getQuiz(at: thisDopeAssQuizId)!
        self.quizState = QuizState.create(from: quiz)
    }

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "EmbedChildVC": SegueAction(to: QuestionViewController.self) {
                    questionVC in

                    guard let quizState = self.quizState else {
                        Log.error(self, because: "quiz state is nil, can't segue to its first question")
                        return
                    }

                    // Start with the first question
                    questionVC.loadData(from: quizState)

                    // Store as child vc
                    self.currentChildViewController = questionVC
                }
            ]
        )
    }

    @IBAction func nextPressed(_ sender: UIButton) {

        guard let currentState = self.quizState else {
            return
        }

        guard let mainStoryboardName = Bundle.main.infoDictionary?["UIMainStoryboardFile"] as? String else {
            Log.error(self, because: "unable to get main storyboard")
            return
        }

        let mainStoryboard = UIStoryboard(name: mainStoryboardName, bundle: Bundle.main)

        // Set the next VC to go to

        var nextVC: UIViewController
        var actionText: String

        switch currentState.peekNextPage() {

        case .Question:
            nextVC = mainStoryboard.instantiateViewController(withIdentifier: "QuestionVC")
            actionText = "Submit"

        case .Answer:
            nextVC = mainStoryboard.instantiateViewController(withIdentifier: "AnswerVC")
            actionText = "Next"

        case .Finish:
            nextVC = mainStoryboard.instantiateViewController(withIdentifier: "FinishedVC")
            actionText = "You're done bro!"
        }

        // Load state into it

        let quizComponentVC = nextVC as! QuizComponentViewController
        let nextState = currentState.peekNextState()

        quizComponentVC.loadData(from: nextState)

        // Transition to it

        self.addChildViewController(nextVC)
        self.nextButton?.setTitle(actionText, for: .normal)
        let sameFrame = currentChildViewController.view.frame

        Log.info(self, "transitioning to \(type(of: nextVC))")
        Log.info(self, "| current page: \(quizState?.getCurrentPage())")

        self.transition(from: currentChildViewController,
                        to: nextVC,
                        duration: QuizViewController.transitionSpeed,
                        options: UIViewAnimationOptions.transitionFlipFromRight,
                        animations: nil,
                        completion:
            { success in
                Log.info(self, "transition successful? \(success)")
                self.nextButton?.setTitle(actionText, for: .normal)
                self.currentChildViewController = nextVC
                self.currentChildViewController.view.frame = sameFrame
        })
    }
}
