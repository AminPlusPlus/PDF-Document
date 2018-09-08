//
//  TablePDFVC.swift
//  PdfDocument
//
//  Created by Aminjoni Abdullozoda on 9/8/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class TablePDFVC: UITableViewController {
    
    var documents : [Document] = []
    var sendDocument : Document?

    override func viewDidLoad() {
        super.viewDidLoad()

        //models
        let doc1 = Document(title: "Work Agreements", url_location: "https://www.tamuk.edu/studentorganizations/studentorganizations_files/pdf%20format/Sample%20Letter%20of%20Agreement.pdf")
        let doc2 = Document(title: "Flat Agreement", url_location: "https://www.tenancy.govt.nz/assets/Forms-templates/Flat-house-sharing-agreement.pdf")
        
        //insert to array
        documents.append(doc1)
        documents.append(doc2)
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return documents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pdfcell", for: indexPath)

        cell.textLabel?.text = documents[indexPath.row].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        sendDocument = documents[indexPath.row]
        
        performSegue(withIdentifier: "pdfview", sender: nil)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pdfview", let destination = segue.destination as? PDFViewVC
        {
            destination.document = sendDocument!
        }
    }
    
 

}
