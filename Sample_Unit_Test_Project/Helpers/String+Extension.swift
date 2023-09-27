//
//  String+Conveniences.swift
//  Handyapp Global LTD
//
//  Created by Raivis Olehno on 18/09/2018.
//  Copyright © 2022 Handyapp Global LTD. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var lastPathComponent: String {
        return String(split(separator: "/").last ?? "")
    }
    
    var isValidEmailAddress: Bool {
        guard let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        let range = NSMakeRange(0, (self as NSString).length)
        let matches = dataDetector.matches(in: self,
                                           options: [],
                                           range: range)
        
        if matches.count == 1,
           let match = matches.first?.url {
            return match.scheme == "mailto"
        }
        else {
            return false
        }
    }
    
    var isValidUKPostcode: Bool {
        
        let regex = "^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {0,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$"
        
        let validationString = self.trimmingCharacters(in: .whitespaces)
        
        return validationString.conformsToRegex(regex)
    }
    
    var isValidIRPostcode: Bool {
        
        let regex = "(?:^[AC-FHKNPRTV-Y][0-9]{2}|D6W)[ -]?[0-9AC-FHKNPRTV-Y]{4}$"
        
        return self.conformsToRegex(regex)
    }
    
    var isValidPassword: Bool {
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        return self.conformsToRegex(regex)
    }
    
    var isValidUKPhoneNumber: Bool {
        let regex = "^(((\\+44\\s?\\d{4}|\\(?0\\d{4}\\)?)\\s?\\d{3}\\s?\\d{3})|((\\+44\\s?\\d{3}|\\(?0\\d{3}\\)?)\\s?\\d{3}\\s?\\d{4})|((\\+44\\s?\\d{2}|\\(?0\\d{2}\\)?)\\s?\\d{4}\\s?\\d{4}))(\\s?\\#(\\d{4}|\\d{3}))?$"
        return conformsToRegex(regex)
    }
    
    var isValidEmail: Bool {
        return conformsToRegex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
    
    var isValidPhoneNumber: Bool {
        let regex = "^\\+?[ 0-9]{6,}$"
        return conformsToRegex(regex)
    }
	
	var toDate: Date? {
		let format = DateFormatter()
		format.dateFormat = "MM/dd/yyyy"
		return format.date(from: self)
	}
    
    func isValidDate() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let date = dateFormatter.date(from: self) {
            let dateString = dateFormatter.string(from: date)
            return self == dateString
        } else {
            return false
        }
    }
    
    func conformsToRegex(_ regex: String) -> Bool {
        return range(of: regex, options: .regularExpression) != nil
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: [], range: nil)
    }
    
    func removeInstancesOf(target: String) -> String {
        return self.replace(target: target, withString:"")
    }
    
    var hasCharacters: Bool {
        return !withoutWhiteSpace.isEmpty
    }
    
    var withoutWhiteSpace: String {
        let testString = removeInstancesOf(target: " ")
        return testString.trimmingCharacters(in: .whitespaces)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
	
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var letters: String {
        return components(separatedBy: CharacterSet.letters.inverted).joined()
    }
    
    var containsDigitsAndLetters: Bool {
        let hasDigits = self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
        let hasLetters = self.rangeOfCharacter(from: CharacterSet.letters) != nil
        return self != "" && hasDigits && hasLetters
    }
    
    var asURL: URL? { return URL(string:self) }
}

