//
//  ViewController.swift
//  health-engine
//
//  Created by Farahani, Reza(AWF) on 19/04/2017.
//  Copyright © 2017 Farahani, Reza(AWF). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

@IBOutlet weak var flickrImageCollectionView: UICollectionView!

 var displayImages: [DisplayImage] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
    flickrImageCollectionView.delegate = self
    flickrImageCollectionView.dataSource = self
    
    //call flickr search
    let latitude: Double = 33.8688
    let longitude: Double = 151.2093
        
        //run in a different queue
    FoundImage.flickrImage(byLocatoin: (latitude, longitude)) { foundImages in
    
        
        for case let foundImage in foundImages {
            self.displayImages.append(DisplayImage.makeDisplayImage(foundImage: foundImage))
        }
        //add in man queue
        self.flickrImageCollectionView.reloadData()
    }
    
}


    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return displayImages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = flickrImageCollectionView.dequeueReusableCell(withReuseIdentifier: "flickerImageCell", for: indexPath) as! FlickrImageCollectionViewCell
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 3
        
        let data = try? Data(contentsOf: displayImages[indexPath.row].thumbnailUrl)
        
        cell.mFlickrImage.image = UIImage(data: data!)
        cell.mFlickrImage.contentMode = .scaleToFill
        return cell
    }
}




