//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController, QuizComponentViewController {

    // external data
    private var quizState: QuizState?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(from state: QuizState) {
        self.quizState = state
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
