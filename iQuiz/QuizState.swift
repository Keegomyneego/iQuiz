//
//  QuizState.swift
//  iQuiz
//
//  Created by Keegs on 11/14/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import Foundation

class QuizState {

    // Quiz State
    private let quiz: QuizModel
    private let finalQuestionIndex: Int
    private var score: Int = 0

    // Current Question State
    private var currentQuestionIndex: Int
    private var isAnswering: Bool
    private var currentGuessIndex: Int?
    private var indexOfTruth: Int

    enum Page {
        case Question
        case Answer
        case Finish
    }

    // Constructors

    private init(quiz: QuizModel) {
        self.quiz = quiz
        self.currentQuestionIndex = 0
        self.finalQuestionIndex = quiz.questions.count - 1
        self.isAnswering = true
        self.indexOfTruth = quiz.questions[0].answer
    }

    private init(copyFrom state: QuizState) {
        self.quiz = state.quiz
        self.finalQuestionIndex = state.finalQuestionIndex
        self.score = state.score

        self.currentQuestionIndex = state.currentQuestionIndex
        self.isAnswering = state.isAnswering
        self.currentGuessIndex = state.currentGuessIndex
        self.indexOfTruth = state.indexOfTruth
    }

    static func create(from quiz: QuizModel) -> QuizState {
        return QuizState(quiz: quiz)
    }

    // Getters

    func currentGuessIsRight() -> Bool {
        return currentGuessIndex == indexOfTruth
    }

    func getCurrentGuess() -> Int? {
        return currentGuessIndex
    }

    func getCurrentQuestion() -> QuestionModel {
        guard currentQuestionIndex < quiz.questions.count else {
            return quiz.questions.last!
        }

        return quiz.questions[currentQuestionIndex]
    }

    func getCurrentPage() -> Page {
        guard currentQuestionIndex <= finalQuestionIndex else {
            return .Finish
        }

        return isAnswering
            ? .Question
            : .Answer
    }

    // Chainable Mutators

    func guess(index: Int) {
        Log.info(self, "guessing at index \(index)")
        currentGuessIndex = index
    }

    func iterate() -> QuizState {
        // prepare to show answer
        if isAnswering {
            isAnswering = false
            if currentGuessIsRight() {
                score += 1
            }
        }

        // prepare for next question
        else {
            isAnswering = true
            currentGuessIndex = nil
            currentQuestionIndex += 1
        }

        return self
    }

    // Warning: this may not be that robust
    func rewind() -> QuizState {
        if isAnswering {
            isAnswering = false
            currentQuestionIndex -= 1
        }

        else {
            isAnswering = true
        }
        
        return self
    }
}
