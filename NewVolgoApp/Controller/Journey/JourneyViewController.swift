//
//  JourneyViewController.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class JourneyViewController: UIViewController{
    
    @IBOutlet weak var contentViewCell: UIView!
    
    var journeys = [Journey]()
    var journeyModel = JourneyModel()
    var journeyTitle = UILabel()
    var journeyDesc = UITextView()
    
    //var image = [UIImage(named: "img-child"), UIImage(named: "img-adult")]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadJourney()
    }
    
    
    
    func loadJourney() {
        if let loadedJourney = journeyModel.retrieve() {
            journeys = loadedJourney
        }
    }
    
}

extension JourneyViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You Tapped Me")
    }
}

extension JourneyViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journeys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320.0, height: 596.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JourneyCollectionViewCell
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, d MMM yyyy"
        
        cell.imgImage.image = UIImage(data: journeys[indexPath.row].image!)
        cell.labelTitle.text = journeys[indexPath.row].title
        cell.labelTextField.text = journeys[indexPath.row].desc
        if let date = journeys[indexPath.row].date {
            cell.labelDate.text = df.string(from: date)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "journeyToAddJourney" {
            let destinationVC = segue.destination as! AddJourneyViewController
            destinationVC.delegate = self
        }
    }
}

extension JourneyViewController: AddJourneyViewControllerDelegate {
    func updateJourney(journey: Journey) {
        journeys.append(journey)
        collectionView.reloadData()
    }
}

extension UIImage {
    // image with rounded corners
    public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0 && radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
