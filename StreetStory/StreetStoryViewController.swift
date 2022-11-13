//
//  StreetStoryViewController.swift
//  StreetStory
//
//  Created by Zhaolian Zhou on 13/11/2022.
//

import UIKit

class StreetStoryViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var storyLabel: UITextView!
    
    public var storyTitle: String = ""
    public var storyContent: String = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = storyTitle
        storyLabel.text = storyContent
    }
}
