//
//  SubjectTableViewController.swift
//  iQuiz
//
//  Created by Keegs on 11/3/16.
//  Copyright © 2016 Keegan Farley. All rights reserved.
//

import UIKit

class SubjectTableViewController: UITableViewController {

    var data: [String] = [
        "Mathematics",
        "Marvel Super Heroes",
        "Science"
    ]

    var descriptions: [String] = [
        "The study of number, quantity, and space.",
        "Benevolent fictional characters with superhuman powers.",
        "The study of structure and behavior of the natural world."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self

        self.tableView.register(UINib(nibName: "SubjectTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SubjectCell")
    }

    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //
    // UITableViewDataSource delegate methods
    //

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)

        if let subjectCell = cell as? SubjectTableViewCell {
            let index = indexPath.row

            subjectCell.titleLabel.text = data[index]
            subjectCell.descriptionLabel.text = descriptions[index]
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
