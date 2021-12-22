//
//  ViewController.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 15/12/2021.
//

import UIKit
import Combine

class UniversityListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let universityViewModel = UniversityViewModel(network: NetworkManager())
    var cancellable:AnyCancellable?
    let urlAPI = "http://universities.hipolabs.com/search?country=United+Kingdom"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        universityViewModel.getUniversities(url: urlAPI)
        cancellable = universityViewModel.$universities.sink(receiveValue: { universities in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable?.cancel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let universityDomainViewController = segue.destination as? UniversityDomainViewController
        universityDomainViewController?.university = sender as? Universities
    }

}

extension UniversityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityViewModel.numberOfUniversities
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "universityNameCell") as? UniversityTableViewCell else {
            return UITableViewCell()
        }
        let currentUniversityCell = universityViewModel.getAUniversity(index: indexPath.row)
        
        cell.universityNameLabel.text = currentUniversityCell.name
        
        return cell
    }
}

extension UniversityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUniversityCell = universityViewModel.getAUniversity(index: indexPath.row)
        performSegue(withIdentifier: "goToUniversityDetails", sender: selectedUniversityCell)
    }
}

