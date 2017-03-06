//
//  PullRequestViewController.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 6/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class PullRequestViewController : UIViewController, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    var bag = DisposeBag()
    var viewModel = PullRequestViewModel()
    
    
    override func viewDidLoad() {
        
        let tableObserver = viewModel.pullRequests.asObservable()
        
        tableObserver.bindTo(table.rx.items(cellIdentifier: "cell", cellType: PullRequestTableViewCell.self)){ (r,e,c) in
            
            c.lbPRTitle.text = e.title
            c.lbPRDescription.text = e.body
            c.lbLogin.text = e.owner.login
            c.lbUserName.text = e.owner.name
        
    }.addDisposableTo(bag)
    
    }

    }
