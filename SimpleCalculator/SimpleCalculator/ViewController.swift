//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Patricia Fiona on 21/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var width: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        if let h = Double(height.text ?? "0"), let w = Double(width.text ?? "0"){
            result.text = String(h * w)
        }else{
            result.text = "Hasil Tidak Valid"
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        result.text = ""
        height.text = ""
        width.text = ""
    }
}

