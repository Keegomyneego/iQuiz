//
//  MockDBModel.swift
//  iQuiz
//
//  Created by Keegs on 11/13/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

class MockDBModel {

    private static let quizJSON = try? JSONSerialization.jsonObject(with: quizJSONString.data(using: String.Encoding.nonLossyASCII)!)

    static func getSubject(at index: Int) -> String {
        return subjectInfo[index]["Subject"] ?? ""
    }

    static func getSubjectDescription(at index: Int) -> String {
        return subjectInfo[index]["Description"] ?? ""
    }

    static func getSubjectCount() -> Int {
        return subjectInfo.count
    }

    static func getQuiz(at index: Int) -> QuizModel? {
        Log.info(self, "getQuiz(at: \(index))")

        guard let quizzes = quizJSON as? [Any] else {
            Log.error(self, because: "unable to parse \(quizJSON) as? [Any]")
            return nil
        }

        guard quizzes.count > index else {
            Log.error(self, because: "unable to retrieve quiz at index \(index) of range 0..<\(quizzes.count)")
            return nil
        }

        return QuizModel(from: quizzes[index])
    }

    private static let subjectInfo: [[String : String]] = [
        [
            "Subject": "Science",
            "Description": "The study of structure and behavior of the natural world."
        ],
        [
            "Subject": "Marvel Super Heroes",
            "Description": "Benevolent fictional characters with superhuman powers."
        ],
        [
            "Subject": "Mathematics",
            "Description": "The study of number, quantity, and space."
        ]
    ]

    private static let quizJSONString: String =
        "[" +
        "    { \"title\":\"Science!\"," +
        "      \"desc\":\"Because SCIENCE!\"," +
        "      \"questions\":[" +
        "        {" +
        "          \"text\":\"What is fire?\"," +
        "          \"answer\":\"1\"," +
        "          \"answers\":[" +
        "            \"One of the four classical elements\"," +
        "            \"A magical reaction given to us by God\"," +
        "            \"A band that hasn't yet been discovered\"," +
        "            \"Fire! Fire! Fire! heh-heh\"" +
        "          ]" +
        "        }" +
        "      ]" +
        "    }," +
        "    { \"title\":\"Marvel Super Heroes\", \"desc\": \"Avengers, Assemble!\"," +
        "      \"questions\":[" +
        "        {" +
        "          \"text\":\"Who is Iron Man?\"," +
        "          \"answer\":\"1\"," +
        "          \"answers\":[" +
        "            \"Tony Stark\"," +
        "            \"Obadiah Stane\"," +
        "            \"A rock hit by Megadeth\"," +
        "            \"Nobody knows\"" +
        "          ]" +
        "        }," +
        "        {" +
        "          \"text\":\"Who founded the X-Men?\"," +
        "          \"answer\":\"2\"," +
        "          \"answers\":[" +
        "            \"Tony Stark\"," +
        "            \"Professor X\"," +
        "            \"The X-Institute\"," +
        "            \"Erik Lensherr\"" +
        "          ]" +
        "        }," +
        "        {" +
        "          \"text\":\"How did Spider-Man get his powers?\"," +
        "          \"answer\":\"1\"," +
        "          \"answers\":[" +
        "            \"He was bitten by a radioactive spider\"," +
        "            \"He ate a radioactive spider\"," +
        "            \"He is a radioactive spider\"," +
        "            \"He looked at a radioactive spider\"" +
        "          ]" +
        "        }" +
        "      ]" +
        "    }," +
        "    { \"title\":\"Mathematics\", \"desc\":\"Did you pass the third grade?\"," +
        "      \"questions\":[" +
        "         {" +
        "           \"text\":\"What is 2+2?\"," +
        "           \"answer\":\"1\"," +
        "           \"answers\":[" +
        "             \"4\"," +
        "             \"22\"," +
        "             \"An irrational number\"," +
        "             \"Nobody knows\"" +
        "           ]" +
        "         }" +
        "      ]" +
        "   }" +
    "]"
}
