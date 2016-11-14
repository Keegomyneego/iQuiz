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
        guard let props = (jsonObject as? [String : Any]) else {
            Log.error(QuestionModel.self, because: "failed to parse from jsonObject: \(jsonObject)")
            return nil
        }

        guard let text = props["text"] as? String else {
            Log.error(QuestionModel.self, because: "failed to parse from jsonObject: \(jsonObject)")
            return nil
        }

        guard let answer = Int(props["answer"] as? String ?? "") else {
            Log.error(QuestionModel.self, because: "failed to parse from jsonObject: \(jsonObject)")
            return nil
        }

        guard let answers = props["answers"] as? [String] else {
            Log.error(QuestionModel.self, because: "failed to parse from jsonObject: \(jsonObject)")
            return nil
        }

        self.text = text
        self.answer = answer
        self.answers = answers
    }
}
