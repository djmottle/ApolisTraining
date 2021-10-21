//
//  Results.swift
//  NewYorkFetch
//
//  Created by David Mottle on 10/15/21.
//

import UIKit
import Foundation

struct HeadlineModel: Codable {
    var results: [Headline]?
}

struct Headline: Codable {
    let title: String
    let byline: String
    let published_date: String
    let url: URL
}
