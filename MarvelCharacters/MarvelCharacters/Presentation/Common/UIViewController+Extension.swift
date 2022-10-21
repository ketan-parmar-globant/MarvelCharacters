//
//  UIViewController+Extension.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController {
    func openSafariViewController(url: String) {
        if let url = URL(string: url) {
            let safariViewController = SFSafariViewController(url: url)
            self.present(safariViewController, animated: true, completion: nil)
        }
    }
}
