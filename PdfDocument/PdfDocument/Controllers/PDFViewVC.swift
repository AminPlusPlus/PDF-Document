//
//  ViewController.swift
//  PdfDocument
//
//  Created by Aminjoni Abdullozoda on 9/8/18.
//  Copyright © 2018 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewVC: UIViewController
{
    
    var document : Document?
    
    @IBOutlet weak var pdfView : PDFView!
    @IBOutlet weak var signatureView : SignatureView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //session
        let dataTask =  URLSession.shared.dataTask(with: URL(string: (document?.url_location)!)!) { (data, urlresponce, err) in
            
            if err == nil , let doc = PDFDocument(data: data!)
            {
               
                DispatchQueue.main.async {
                self.pdfView.document = doc
                self.pdfView.autoScales = true
                }
                
            }
        }
        
        dataTask.resume()
        
        //title
        navigationItem.title = document!.title
    }
    
    
    @IBAction func addSignature (_ sender : UIBarButtonItem )
    {
        if sender.title == "add Signature"
        {
            signatureView.isHidden = false
            sender.title = "add to document"
        } else
        {
            signatureView.isHidden = true
            sender.title = "add Signature"
        }
    }

    @IBAction func Clean()
    {
        signatureView.cleanSignature()
    }
    

}

