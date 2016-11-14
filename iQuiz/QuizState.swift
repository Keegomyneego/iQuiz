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
        self.currentQuestionIndex = state.currentQuestionIndex
        self.finalQuestionIndex = state.finalQuestionIndex
        self.isAnswering = state.isAnswering
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

    func peekNextPage() -> Page {
        let _ = iterate()
        let nextPage = getCurrentPage()
        let _ = rewind()

        return nextPage
    }

    func peekNextQuestion() -> QuestionModel? {
        let _ = iterate()
        let nextQuestion = getCurrentQuestion()
        let _ = rewind()

        return nextQuestion
    }

    func peekNextState() -> QuizState {
        let _ = iterate()
        let nextState = QuizState(copyFrom: self)
        let _ = rewind()

        return nextState
    }

    // Chainable Mutators

    func guess(index: Int) {
        currentGuessIndex = index
    }

    func iterate() -> QuizState {
        if isAnswering {
            isAnswering = false
        }

        else {
            isAnswering = true
            currentQuestionIndex += 1
        }

        return self
    }

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
