//
//  DetailPlaceViewController.swift
//  Travel ID
//
//  Created by Patricia Fiona on 30/07/21.
//

import UIKit

class DetailPlaceViewController: UIViewController {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var gradientTranparent: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeNation: UILabel!
    
    var place: Places?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplayData()
    }
    
    override func viewWillLayoutSubviews() {
        setImageRounded(gradientTranparent)
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        setImageRounded(gradientTranparent)
    }
    
    private func setDisplayData(){
        if let data = place {
            placeName.text = place?.name
            placeNation.text = place?.address
            FetchImageURL().setDetailImageToImageView(imageContainer: placeImage, imageUrl: "\(String(describing: data.image))")
            setImageRounded(gradientTranparent)
        }
    }
    
    func setImageRounded(_ obj: AnyObject){
        let rectShape = CAShapeLayer()
        rectShape.bounds = obj.frame
        rectShape.position = obj.center
        rectShape.path = UIBezierPath(roundedRect: obj.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
        obj.layer.mask = rectShape
    }

}
