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
class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var bag = DisposeBag()
    let viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        viewModel.repositories.asObservable().bindTo(table.rx.items(cellIdentifier: "cell", cellType: RepositoryTableViewCell.self)){ (r,e,c) in
            
            c.lbRepositoryName.text = "\(e.name)"
       
            
            }.addDisposableTo(bag)
        
        viewModel.checkRepositories()
        
    
    }

    

}

