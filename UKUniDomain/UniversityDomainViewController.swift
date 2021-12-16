//
//  UniversityDomainViewController.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 16/12/2021.
//

import UIKit

class UniversityDomainViewController: UIViewController {
    
    @IBOutlet weak var universityNameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var university: Universities?

    override func viewDidLoad() {
        super.viewDidLoad()
        universityNameLabel.text = university?.name
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension UniversityDomainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return university?.webPages.count ?? 0
        case 1:
            return university?.domains.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell") as? DomainTableViewCell else {
                return UITableViewCell()
            }
            
            let webPage = university?.webPages[indexPath.row]
            cell.universityDetailLabel.text = webPage
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell") as? DomainTableViewCell else {
                return UITableViewCell()
            }
            
            let domain = university?.domains[indexPath.row]
            cell.universityDetailLabel.text = domain
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension UniversityDomainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Websites"
        case 1:
            return "Domains"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
