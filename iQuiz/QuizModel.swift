//
//  QuizModel.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

class QuizModel {

    let title: String
    let description: String
    let questions: [QuestionModel]

    init?(from jsonObject: Any) {
        guard
            let props = jsonObject as? [String : AnyObject],
            let title = props["title"] as? String,
            let description = props["desc"] as? String,
            let questions = (props["questions"] as? [AnyObject])?
                .map({ QuestionModel(from: $0) }) as? [QuestionModel]
            else { return nil }

        self.title = title
        self.description = description
        self.questions = questions
    }

}
