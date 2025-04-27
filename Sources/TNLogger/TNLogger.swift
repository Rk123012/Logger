// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  TNLogger.swift
//  TNWallpaper
//
//  Created by Rezaul Karim on 21/4/25.
//  Copyright © 2025 Technonext. All rights reserved.
//

import Foundation
import SwiftUI

public enum TNLogger {
    
    case info
    case debug
    case verbose
    case severe
    case warning
    case error
    
    fileprivate var prefix : String {
        switch self {
        case .info:
            return "INFO ℹ️"
        case .warning:
            return "WARNING ⚠️"
        case .error:
            return "ERROR ‼️"
        case .debug:
            return "DEDUG 💬"
        case .verbose:
            return "VERBOSE 🔬"
        case .severe:
            return "SEVERE 🔥"
        }
    }
    public static let dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    struct Context {
        let file : String
        let function : String
        let line : Int
        var description : String{
            return "\(Date().getTimeInString(format: dateFormat)) \((file as NSString).lastPathComponent) : \(line) \(function)"
        }
    }
    
    public static func info(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func info(_ str : String, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .info, str: str, shouldLogContext: shouldLogContext, context: context)
    }
    public static func warning(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func error(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func error(_ str : String, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .error, str: str, shouldLogContext: shouldLogContext, context: context)
    }
    public static func debug(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .debug, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func verbose(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .verbose, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    public static func severe(_ str : StaticString, shouldLogContext : Bool = true, file : String = #file, function : String = #function, line : Int = #line){
        let context = Context(file: file, function: function, line: line)
        TNLogger.handleLog(level: .severe, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    fileprivate static func handleLog(level : TNLogger, str : String, shouldLogContext : Bool = true, context : Context){
        let logComponents = ["[\(level.prefix)]", str]
        var fullString = logComponents.joined(separator: " : ")
        if shouldLogContext {
            fullString = "\(context.description) \n\(fullString)"
        }
        TNLogger.printInfo(information: fullString)
    }
    
    public static func printInfo(information : Any?) {
        if let info = information {
            #if DEV
            print("\(info)")
            #elseif QA
            print("\(info)")
            #endif
        }
    }
    
}
