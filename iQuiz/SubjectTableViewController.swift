//
//  SubjectTableViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/3/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class SubjectTableViewController: UITableViewController {

    //
    // MARK: - UITableView Controller
    //

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 20

        self.tableView.register(UINib(nibName: "SubjectTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SubjectCell")
    }

    //
    // MARK: - UITableView Methods
    //

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockDBModel.getSubjectCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)

        if let subjectCell = cell as? SubjectTableViewCell {
            let index = indexPath.row

            subjectCell.titleLabel.text = MockDBModel.getSubject(at: index)
            subjectCell.descriptionLabel.text = MockDBModel.getSubjectDescription(at: index)
        }

        return cell
    }

    /// Use height based on constraints in Xib file
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Disables static height and relies on constraints in Xib instead
        return -1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToQuiz(withId: indexPath.row)
    }

    //
    // MARK: - IBActions
    //

    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }

    //
    // MARK: - Navigation
    //

    private func goToQuiz(withId quizId: Int) {
        self.performSegue(withIdentifier: "CellSelected", sender: quizId)
    }

    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        SegueActionMap.handle(segue, from: sender, withActions:
            [
                "CellSelected": SegueAction(to: QuizViewController.self) {
                    quizVC in

                    guard let quizId = sender as? Int else {
                        Log.error(self, because: "can't segue to quiz without a quizId")
                        return
                    }

                    quizVC.loadData(fromTheQuizWith: quizId)
                }
            ]
        )
    }
}

