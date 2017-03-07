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
import SDWebImage
class PullRequestViewController : UIViewController, UITableViewDelegate{

    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var openPR: UILabel!
    @IBOutlet weak var closedPR: UILabel!
    var bag = DisposeBag()
    var viewModel = PullRequestViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        
        navItem.title = viewModel.repository?.name
        
        
    }

    override func viewDidLoad() {
        
        let tableObserver = viewModel.pullRequests.asObservable()
        
        tableObserver.bindTo(table.rx.items(cellIdentifier: "cell", cellType: PullRequestTableViewCell.self)){ (r,e,c) in
            
            c.lbPRTitle.text = e.title
            c.lbPRDescription.text = e.body
            c.lbLogin.text = e.owner.login
            c.ivOwner.sd_setImage(with: URL(string: e.owner.photo)!)
            self.viewModel.getOwner(login: e.owner.login , handler : { owner in
                c.lbUserName.text = owner.name})
                                }.addDisposableTo(bag)
        
        self.viewModel.openPR.asObservable().map{ "\($0) Opened" }.bindTo(openPR.rx.text).addDisposableTo(bag)
        self.viewModel.closedPR.asObservable().map{ "\($0) Closed" }.bindTo(closedPR.rx.text).addDisposableTo(bag)
        
        
        table.rx.itemSelected.subscribe{ event in
           let pr = self.viewModel.pullRequests.value[event.element!.item]
            
            UIApplication.shared.open(URL(string: pr.url)!, options : [:], completionHandler: nil)
            
            
            }.addDisposableTo(bag)
        

        
        
    }

    }
