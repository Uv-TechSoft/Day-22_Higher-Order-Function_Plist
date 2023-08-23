//
//  ViewController.swift
//  PList_Day22
//
//  Created by Imam MohammadUvesh on 08/12/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    //MARK: Variables
    var arrData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "plistdata", withExtension: "plist"), let data = try? Data(contentsOf: url)
        else
        {
            return
        }
        print(url)
        print(data)
        
        guard let tableData = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String] else {return}
        arrData.append(contentsOf: tableData)
        
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
    }
}

//MARK: TablView DataSource
 
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else
        {
            return UITableViewCell()
        }
        cell.textLabel?.text = arrData[indexPath.row]
        return cell
    }
}
