//
//  CViewCollectionViewCell.swift
//  MyAnimeDatabase
//
//  Created by Developer on 24/07/2019.
//  Copyright © 2019 Developer. All rights reserved.
//gb

import UIKit

class CView: UIViewController {
    
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var prenom: UILabel!
    @IBOutlet weak var anime: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet var desc: UITextView!
    @IBOutlet var picture: UIImageView!
    
    var input : MyAnimeDatabase.PersonnageElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nom.text = input.nom
        self.prenom.text = input.prenom
        self.anime.text = input.anime
        self.age.text = String(input.age)
        self.desc.text = input.personnageDescription
        if let url = NSURL(string : input.photo[0].url) {
            if let data = NSData(contentsOf: url as URL) {
                picture.contentMode = UIView.ContentMode.scaleAspectFit
                picture.image = UIImage(data: data as Data)
            }
        }
    }
    
}
