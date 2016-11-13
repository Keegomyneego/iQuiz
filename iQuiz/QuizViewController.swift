//
//  QuizViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/12/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - Navigation
    //

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing for segue \(segue.identifier)")
        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "Next": SegueAction(to: QuizViewController.self) {
                    quizVC in

                    print("successly prepared to segue to \(type(of: quizVC))")
                }
            ]
        )
    }
}
