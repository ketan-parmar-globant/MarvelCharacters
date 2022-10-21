//
//  UIImageView+Extension.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import SDWebImage

extension UIImageView{
    func loadImageUsingUrlString(urlString : String?) {
        guard let urlString = urlString else {
            return
        }
        let imageURL = URL(string: urlString)
        self.sd_setImage(with: imageURL)
    }
}
