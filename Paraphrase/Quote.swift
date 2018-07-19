//
//  Quote.swift
//  Paraphrase
//
//  Created by Paul Hudson on 05/05/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

struct Quote: Codable, Comparable {
    var author: String
    var text: String
    var singleLine: String {
        let formattedText = text.replacingOccurrences(of: "\n", with: " ")
        return "\(author): \(formattedText)"
    }
    var multiLine: String {
        return "\"\(text)\"\n   — \(author)"
    }
    var attributedString: NSAttributedString {
        var textAttributes = [NSAttributedStringKey: Any]()
        var authorAttributes = [NSAttributedStringKey: Any]()
        
        if let quoteFont = UIFont(name: "Georgia", size: 24) {
            let fontMetrics = UIFontMetrics(forTextStyle: .headline)
            textAttributes[.font] = fontMetrics.scaledFont(for: quoteFont)
        }
        if let authorFont = UIFont(name: "Georgia-Italic", size: 16) {
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            authorAttributes[.font] = fontMetrics.scaledFont(for: authorFont)
        }
        
        let finishedQuote = NSMutableAttributedString(string: text, attributes: textAttributes)
        let authorString = NSAttributedString(string: "\n\n\(author)", attributes: authorAttributes)
        finishedQuote.append(authorString)
        
        return finishedQuote
    }
    static func <(lhs: Quote, rhs: Quote) -> Bool {
        return lhs.author < rhs.author
    }
}
