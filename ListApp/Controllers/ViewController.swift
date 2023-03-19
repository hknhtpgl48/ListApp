//
//  ViewController.swift
//  ListApp
//
//  Created by Hakan Hatipoğlu on 19.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [String]()
    var alertController = UIAlertController()
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
    
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
        presentAddAlert()
    }
    
    @IBAction func removeBarButtonPressed(_ sender: UIBarButtonItem) {
        presentAlert(title: "Uyarı!",
                     message: "Listedeki bütün ögeleri silmek istediğinize emin misiniz?",
                     defaultButtonTitle: "Evet",
                     cancelButtonTitle: "Vazgeç") { _ in
            self.data.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func presentAddAlert() {
        presentAlert(title: "Yeni Eleman Ekle",
                     message: nil,
                     defaultButtonTitle: "Ekle",
                     cancelButtonTitle: "Vazgeç",
                     isTextFieldAvaliable: true,
                     defaultButtonHandler: { _ in
                            let text = self.alertController.textFields?.first?.text
                            if text != "" {
                                self.data.append((text)!)
                                self.tableView.reloadData()
                            } else {
                                self.presentWarningAlert()
                            }
                        })
        
    }
    
    func presentWarningAlert() {
        presentAlert(title: "Uyarı!",
                     message: "Liste elemanı boş olamaz." ,
                     cancelButtonTitle: "Tamam")
    }
    
    func presentAlert(title: String?,
                      message: String?,
                      preferredStyle: UIAlertController.Style = .alert,
                      defaultButtonTitle: String? = nil,
                      cancelButtonTitle: String?,
                      isTextFieldAvaliable: Bool = false,
                      defaultButtonHandler: ((UIAlertAction) -> Void)? = nil) {
        //alert oluşturma
        alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        //default button
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle,
                                              style: .default,
                                              handler: defaultButtonHandler)
            alertController.addAction(defaultButton)
        }
        //cancel button
        let cancelButton = UIAlertAction(title: cancelButtonTitle,
                                         style: .cancel)
        
        if isTextFieldAvaliable {
            alertController.addTextField()
        }
        
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true)
    }
    
}

