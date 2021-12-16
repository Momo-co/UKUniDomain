//
//  ViewController.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 15/12/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let universityViewModel = UniversityViewModel()
    var cancellable:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        universityViewModel.getUniversities()
        cancellable = universityViewModel.$universities.sink(receiveValue: { universities in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        tableView.dataSource = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable?.cancel()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityViewModel.numberOfUniversities
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell") as? UniversityTableViewCell else {
            return UITableViewCell()
        }
        let currentUniversityCell = universityViewModel.getAUniversity(index: indexPath.row)
        
        cell.universityNameLabel.text = currentUniversityCell.name
        
        return cell
    }
}

