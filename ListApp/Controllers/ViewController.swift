//
//  ViewController.swift
//  ListApp
//
//  Created by Hakan Hatipoğlu on 19.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = ["Swift", "Kotlin", "C++", "C", "Python", "Java", "C#"]
    // table View'ı tanımlayalım
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count// aşağıdaki methodun kaç kere çalışacağını da belirtiyor
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        //Reussable cell oluşturma
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }


}

