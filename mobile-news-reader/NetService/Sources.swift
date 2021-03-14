//
//  Sources.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

struct Sources {
    let status: String
    let sources: [Source]
    
}

extension Sources: Decodable {}
