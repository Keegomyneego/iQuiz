//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!

    private var question: QuestionModel?
    private var indexOfTruth: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshView()
    }

    func loadData(from question: QuestionModel) {
        self.question = question

        Log.info("\(type(of: self))", "loaded data")
    }

    private func refreshView() {
        if let question = self.question {
            questionLabel.text = question.text
            indexOfTruth = question.answer
            answer1Button.setTitle(question.answers[0], for: UIControlState.normal)
            answer2Button.setTitle(question.answers[1], for: UIControlState.normal)
            answer3Button.setTitle(question.answers[2], for: UIControlState.normal)
            answer4Button.setTitle(question.answers[3], for: UIControlState.normal)
        }
    }

    @IBAction func nextPressed(_ sender: UIButton) {

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
