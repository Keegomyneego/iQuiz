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
        print("Disecting jsonObject: \(jsonObject)")
        guard
            let props = jsonObject as? [String : Any],
            let title = props["title"] as? String,
            let description = props["desc"] as? String,
            let questions = (props["questions"] as? [Any])?
                .map({ QuestionModel(from: $0) }) as? [QuestionModel]
            else {
                Log.error(QuizModel.self, because: "failed to parse from jsonObject: \(jsonObject)")
                return nil
        }

        self.title = title
        self.description = description
        self.questions = questions
    }

}
