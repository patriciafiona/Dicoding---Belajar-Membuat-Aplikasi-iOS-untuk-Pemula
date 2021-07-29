//
//  PlacesTableViewController.swift
//  Travel ID
//
//  Created by Patricia Fiona on 28/07/21.
//

import UIKit

class PlacesTableViewController: UITableViewController {

    struct PropertyKeys {
        static let placesCell = "PlacesCell"
        static let showPlacesDetail = "ShowPlacesDetail"
    }
    
    private let url = "https://tourism-api.dicoding.dev/list"
    var placesSpace = APIData(){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("Data: \(self.placesSpace)")
            }
        }
    }
    
    override func viewDidLoad() {
        FetchData().fetchData(urlForFetchingData: url, completionHandler: {
            placesArray in self.placesSpace = placesArray
        })
        
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesSpace.places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.placesCell, for: indexPath) as! PlacesTableViewCell
        
        let places = placesSpace.places[indexPath.row]
        cell.placeName?.text = places.name
        cell.placeDetail.text = places.description
        cell.placeLikes.text = "\(String(describing: Int(places.like!) ))"
        FetchImageURL().setImageToImageView(imageContainer: cell.placesImage, imageUrl: "\(String(describing: places.image))")
        FetchImageURL().setImageToImageView(imageContainer: cell.placeBackground, imageUrl: "\(String(describing: places.image))")
        
        //make rounded
        cell.placesImage.clipsToBounds = true
        cell.placesImage.layer.cornerRadius = 20
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
