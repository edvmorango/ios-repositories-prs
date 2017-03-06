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

extension UIScrollView{
    
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool{
            return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }

}


class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    var bag = DisposeBag()
    var viewModel = MainViewModel()
    static let startLoadingOffset: CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.repositories.asObservable()
            .bindTo(table.rx.items(cellIdentifier: "cell", cellType:            RepositoryTableViewCell.self)){ (r,e,c) in
            c.lbRepositoryName.text = e.name
            c.lbRepositoryDesc.text = e.description
            c.lbUserLogin.text = e.owner.login
            c.lbUserName.text = e.owner.name
            c.lbForks.text = "\(e.forks)"
            c.lbStars.text = "\(e.stars)"
            c.ivOwner.sd_setImage(with: URL(string: e.owner.photo)!)
            self.viewModel.getOwner(name: e.owner.login , handler :{ owner in
                    c.lbUserName.text = owner.name
                })
            }.addDisposableTo(bag)
    
            viewModel.currentPage = 1
            table.rx.itemSelected.subscribe{ event in
            
            
            self.performSegue(withIdentifier: "pullRequest", sender: self.viewModel.repositories.value[event.element!.item] )
            
            }.addDisposableTo(bag)
        
        table.rx.contentOffset.throttle(1.5, scheduler: MainScheduler.instance).subscribe{ _ in
            if self.table.isNearBottomEdge(){
                
                self.viewModel.currentPage += 1
                print(self.viewModel.currentPage)
            }
        }.addDisposableTo(bag)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pullRequest"{
            
          let rep  =  sender as! Repository
          let vc = segue.destination as! PullRequestViewController
            vc.viewModel.repository = rep
            
        }
        
        
    }
    

}

