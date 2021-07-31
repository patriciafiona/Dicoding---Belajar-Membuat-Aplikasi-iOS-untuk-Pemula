//
//  ViewController.swift
//  Travel ID
//
//  Created by Patricia Fiona on 28/07/21.
//

import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var scrollContainer: UIView!
    @IBOutlet weak var homeBannerImage: UIView!
    @IBOutlet weak var homeBannerSubContainer: UIImageView!
    
    @IBOutlet weak var category01: UIButton!
    @IBOutlet weak var category02: UIButton!
    @IBOutlet weak var category03: UIButton!
    @IBOutlet weak var category04: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBannerCorner()
        setCategoryColor()
        setProfileStyle(img: profileImage)
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        setBannerCorner()
    }
    
    private func setCategoryColor(){
        let catButtons = [category01, category02, category03, category04]
        
        for btn in catButtons{
            btn!.applyGradient(colours: [.systemTeal, .blue])
            btn!.layer.cornerRadius = 10
            btn!.clipsToBounds = true
        }
        
    }
    
    private func setProfileStyle(img: UIImageView){
        var currentHeight: CGFloat?
        
        let group = DispatchGroup()
            group.enter()

            DispatchQueue.main.async {
                currentHeight = img.frame.height
                group.leave()
            }
        
        group.notify(queue: .main) {
            img.layer.cornerRadius = currentHeight! / 2.0
        }
        
    }

    private func setBannerCorner(){
        //get width from scroll container and update it
        var currentWidth: CGFloat?
        
        let group = DispatchGroup()
            group.enter()

            DispatchQueue.main.async {
                currentWidth = self.scrollContainer.frame.size.width
                group.leave()
            }
        
        group.notify(queue: .main) {
            self.homeBannerImage.frame.size.width = currentWidth!
            
            //Container Radius
            DetailPlaceViewController.init().setImageRounded(self.homeBannerImage)
            
            //SubCountainer Radius
            let rectShape02 = CAShapeLayer()
            rectShape02.bounds = self.homeBannerSubContainer.frame
            rectShape02.position = self.homeBannerSubContainer.center
            rectShape02.path = UIBezierPath(roundedRect: self.homeBannerSubContainer.bounds, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 50, height: 50)).cgPath
            self.homeBannerSubContainer.layer.mask = rectShape02
        }
        
    }

}

