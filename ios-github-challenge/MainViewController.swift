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
    var viewModel = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.repositories.asObservable().scan([Repository](), accumulator: {
            (current : [Repository], new : [Repository]) -> [Repository] in (current + new).sorted(by: { $0.0.stars > $0.1.stars})   })
            .bindTo(table.rx.items(cellIdentifier: "cell", cellType: RepositoryTableViewCell.self)){ (r,e,c) in
            
            c.lbRepositoryName.text = e.name
            c.lbRepositoryDesc.text = e.description
            c.lbUserLogin.text = e.owner.login
            c.lbUserName.text = e.owner.name
            c.lbForks.text = "\(e.forks)"
            c.lbStars.text = "\(e.stars)"
            
            c.ivOwner.sd_setImage(with: URL(string: e.owner.photo)!)
            
            
            }.addDisposableTo(bag)
    
            viewModel.currentPage = 1

    
    }

    

}

