//
//  DetailViewController.swift
//  DicodingApps
//
//  Created by Patricia Fiona on 23/07/21.
//  Copyright © 2021 Dicoding Indonesia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descDetail: UILabel!
    
    // Digunakan untuk menampung data sementara
    var detail: (title: String?, desc: String?, image: UIImage?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Digunakan untuk mengubah konten setiap kali membuka halaman detail
        titleDetail.text = detail.title
        descDetail.text = detail.desc
        imageDetail.image = detail.image
    }

}
