//
//  QuestionModel.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

class QuestionModel {

    let text: String
    let answer: Int
    let answers: [String]

    init?(from jsonObject: Any) {
        guard
            let props = jsonObject as? [String : AnyObject],
            let text = props["title"] as? String,
            let answer = props["desc"] as? Int,
            let answers = props["questions"] as? [String]
            else { return nil }

        self.text = text
        self.answer = answer
        self.answers = answers
    }
}
