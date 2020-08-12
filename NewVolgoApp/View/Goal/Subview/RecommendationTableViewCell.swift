//
//  RecommendationTableViewCell.swift
//  NewVolgoApp
//
//  Created by Denny Alfath on 12/08/20.
//  Copyright © 2020 Denny Alfath. All rights reserved.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {

    //Set constant for cell reusable identifier to avoid typo
    static let identifier = "RecommendationTableViewCell"
    
    //Set static method for the Nib name to avoid typo
    static func nib() -> UINib {
        return UINib(nibName: "RecommendationTableViewCell", bundle: nil)
    }
    
    @IBAction func advCareerTapped(_ sender: UIButton) {
    }
    
    @IBAction func devNewGoalTapped(_ sender: UIButton) {
    }
    
    @IBAction func exploreIntTapped(_ sender: UIButton) {
    }
    
    @IBAction func funExpTapped(_ sender: UIButton) {
    }
    
    @IBAction func selfConfidenceTapped(_ sender: UIButton) {
    }
    
    @IBAction func socInteractionTapped(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
