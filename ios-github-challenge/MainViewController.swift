//
//  ViewController.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 3/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Gloss
import SDWebImage
class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var bag = DisposeBag()
    let viewModel = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        viewModel.repositories.asObservable().bindTo(table.rx.items(cellIdentifier: "cell", cellType: RepositoryTableViewCell.self)){ (r,e,c) in
            
            c.lbRepositoryName.text = "\(e.name)"
            
            
            self.viewModel.fetchImage.asObservable().flatMapLatest{ rep in
                return SDWebImageManager().cacheImage(url : URL(string: e.owner.photo)!)
                }.subscribe(onNext: { img in
                    
                    c.ivOwner.image = img
                    
                }).addDisposableTo(self.bag)
            
            self.viewModel.fetchImage.onNext(e)
            
            
            }.addDisposableTo(bag)
        
        viewModel.checkRepositories()
        
    
    }

    

}

