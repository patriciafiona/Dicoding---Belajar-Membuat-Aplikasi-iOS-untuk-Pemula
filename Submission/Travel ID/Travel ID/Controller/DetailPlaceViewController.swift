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
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placeDetail: UILabel!
    
    @IBOutlet weak var ReviewTableView: UITableView!
    
    var place: Places?
    var didLayout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplayData()
        
        ReviewTableView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        setImageRounded(gradientTranparent)
        
        if !self.didLayout {
            self.didLayout = true // only need to do this once
            self.ReviewTableView.reloadData()
        }
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        setImageRounded(gradientTranparent)
    }
    
    private func setDisplayData(){
        if let data = place {
            placeName.text = place?.name
            placeAddress.text = place?.address
            placeDetail.text = place?.description
            
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
    
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        let index = (sender as AnyObject).selectedSegmentIndex
        
        switch index{
        case 0:
            // Show review
            ReviewTableView.isHidden = false
            break
        case 1:
            // show galery
            ReviewTableView.isHidden = true
            break
        case 2:
            // show map
            ReviewTableView.isHidden = true
            break
        default:
            print("Segment index Index out of range")
            break
        }
    }
    

}

extension DetailPlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filteredTableData = reviews.filter {
            $0.placeID == place?.id
        }
        return filteredTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewTableViewCell {
        
            let filteredTableData = reviews.filter {
                $0.placeID == place?.id
            }
            let review = filteredTableData[indexPath.row]
            cell.reviewTitle.text = review.title
            cell.reviewDetail.text = review.description
            cell.reviewUsername.text = review.username
            cell.reviewProfile.image = review.photo
        
            // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
            cell.reviewProfile.layer.cornerRadius = cell.reviewProfile.frame.height / 2
            cell.reviewProfile.clipsToBounds = true
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
