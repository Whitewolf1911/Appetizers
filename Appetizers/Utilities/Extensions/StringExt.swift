//
//  StringExt.swift
//  Appetizers
//
//  Created by Ali Basoglu on 10.11.2025.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
        // OLD WAY
        //        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        //        return emailPred.evaluate(with: self)
        
        // NEW WAY with RegexBuilder
        let emailRegex = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        return self.wholeMatch(of: emailRegex) != nil
    }

}
