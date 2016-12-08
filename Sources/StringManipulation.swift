//
//  StringManipulation.swift
//  SwiftStyler
//
//  Created by Daniele Margutti on 08/12/2016.
//  Copyright © 2016 Daniele Margutti. All rights reserved.
//

import Foundation

/// Sum two MarkupString and produce a new string sum of both passed.
/// Remember: [Style] associated with lhs will be merged with [Style] associated with rhs string and
/// may be replaced when name is the same between two Styles.
///
/// - Parameters:
///   - lhs: left MarkupString
///   - rhs: right MarkupString
/// - Returns: a new MarkupString with the content of both lhs and rhs strings and with merged styles
public func + (lhs: MarkupString, rhs: MarkupString) -> MarkupString {
	let concatenate = MarkupString(lhs.content + rhs.content, nil) // concatenate the content
	concatenate.styles = lhs.styles + rhs.styles // sum styles between lhs and rhs (rhs may replace existing lhs's styles)
	return concatenate
}

/// Sum between two NSMutableAttributedStrings
///
/// - Parameters:
///   - lhs: left attributed string
///   - rhs: right attributed stirng
/// - Returns: a new instance sum of left and side instances
public func + (lhs: NSMutableAttributedString, rhs: NSMutableAttributedString) -> NSMutableAttributedString {
	let final = NSMutableAttributedString(attributedString: lhs)
	final.append(rhs)
	return final
}

public func + (lhs: String, rhs: NSMutableAttributedString) -> NSMutableAttributedString {
	let final = NSMutableAttributedString(string: lhs)
	final.append(rhs)
	return final
}

public func + (lhs: NSMutableAttributedString, rhs: String) -> NSMutableAttributedString {
	let final = NSMutableAttributedString(attributedString: lhs)
	final.append(NSMutableAttributedString(string: rhs))
	return final
}

public extension NSMutableAttributedString {
	
	/// Append a plain string with given attributes to an existing NSMutableAttributedString (self)
	///
	/// - Parameters:
	///   - string: string to append
	///   - style: style to apply to the entire string before appending it to self
	public func append(string: String, style: Style) {
		self.append(string.with(style))
	}
	
	
	/// Append a MarkupString instance to an exesting NSMutableAttributedString (self)
	///
	/// - Parameter string: string to append
	public func append(string: MarkupString) {
		self.append(string.text)
	}
	
}
