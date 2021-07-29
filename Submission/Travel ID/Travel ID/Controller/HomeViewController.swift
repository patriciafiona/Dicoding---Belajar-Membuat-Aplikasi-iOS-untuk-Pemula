//
//  ViewController.swift
//  Travel ID
//
//  Created by Patricia Fiona on 28/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeBanner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBannerCorner()
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        setBannerCorner()
    }

    private func setBannerCorner(){
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.homeBanner.frame
        rectShape.position = self.homeBanner.center
        rectShape.path = UIBezierPath(roundedRect: self.homeBanner.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: 100, height: 100)).cgPath

        self.homeBanner.layer.backgroundColor = UIColor.green.cgColor
        self.homeBanner.layer.mask = rectShape
    }

}

