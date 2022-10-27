//
//  ReusableView.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import UIKit

protocol ReusableView : AnyObject {
    static var identifier : String { get }
    static var nib: UINib { get }
}
