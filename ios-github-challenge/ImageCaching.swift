//
//  ImageCaching.swift
//  ios-github-challenge
//
//  Created by José Eduardo Vieira Morango on 4/03/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCaching{
    
    func saveImageToCache(image: UIImage?, url: NSURL)
    func imageFromCacheWithUrl(url: NSURL) -> UIImage?
    
}
