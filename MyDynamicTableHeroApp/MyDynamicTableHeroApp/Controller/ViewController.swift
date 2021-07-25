//
//  ViewController.swift
//  MyDynamicTableHeroApp
//
//  Created by Patricia Fiona on 23/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Menghubungkan heroTableView dengan ke dua metode di bawah
        heroTableView.dataSource = self
        
        // Menghubungkan berkas XIB untuk HeroTableViewCell dengn heroTableView.
        heroTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }
    
}
 
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Digunakan untuk menambahkan total item yang akan muncul di dalam Table View
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Digunakan untuk menghubungkan cell dengan identifier "HeroCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as? HeroTableViewCell {
        
            // Menetapkan nilai hero ke view di dalam cell
            let hero = heroes[indexPath.row]
            cell.nameHero.text = hero.name
            cell.descHero.text = hero.description
            cell.photoHero.image = hero.photo
        
            // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
            cell.photoHero.layer.cornerRadius = cell.photoHero.frame.height / 2
            cell.photoHero.clipsToBounds = true
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
