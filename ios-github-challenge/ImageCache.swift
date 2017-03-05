//
//  ImageCache.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 5/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import RxSwift
import RxCocoa
import SDWebImage
//import UIKit

extension SDWebImageManager{

    func cacheImage(url : URL) -> Observable<UIImage>{
    
        return Observable.create{ observer in
          let _ =  SDWebImageManager.shared().imageDownloader?.downloadImage(with: url, options: SDWebImageDownloaderOptions.continueInBackground , progress: nil, completed:{ img, data, error, success in
            
               if error != nil{
                    observer.onError(error!)
                }
            
                    observer.onNext(img!)
            } )
    
            return Disposables.create()

    }   
        
    }

}
