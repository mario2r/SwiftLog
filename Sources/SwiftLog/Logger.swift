// The Swift Programming Language
// https://docs.swift.org/swift-book

import os
import Foundation

public var logger: LoggerProtocol = Logger()

public enum Level: Int, CaseIterable, Comparable {
    case trace
    case verbose
    case debug
    case info
    case warning
    case error
    case critical
    case none

    var icon: String {
        switch self {
        case .verbose, .trace: return "🗯"
        case .debug: return "🔹"
        case .info: return "ℹ️"
        case .warning: return "⚠️"
        case .error: return "‼️"
        case .critical: return "💣"
        case .none: return ""
        }
    }

    public static func < (lhs: Level, rhs: Level) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    var logType: OSLogType {
        switch self {
        case .trace, .verbose, .debug: return .debug
        case .info: return .info
        case .warning: return .default
        case .error: return .error
        case .critical: return .fault
        case .none: return .default
        }
    }
}

public protocol LoggerProtocol {
    var outputLevel: Level { get }

    func setOutputLevel(_ level: Level)
    func verbose(_ object: Any)
    func debug(_ object: Any)
    func info(_ object: Any)
    func warning(_ object: Any)
    func error(_ object: Any)
    func critical(_ object: Any)
}

final class Logger: LoggerProtocol {
    var outputLevel: Level = .none
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        dateFormatter.locale = .current
        return dateFormatter
    }()
    private var dateString: String {
        dateFormatter.string(from: Date())
    }

    func setOutputLevel(_ outputLevel: Level) {
        self.outputLevel = outputLevel
    }

    func verbose(_ object: Any) {
        log(object, level: .verbose)
    }

    func debug(_ object: Any) {
        log(object, level: .debug)
    }

    func info(_ object: Any) {
        log(object, level: .info)
    }

    func warning(_ object: Any) {
        log(object, level: .warning)
    }

    func error(_ object: Any) {
        log(object, level: .error)
    }

    func critical(_ object: Any) {
        log(object, level: .critical)
    }

    private func log(_ object: Any, level: Level) {
        if level >= outputLevel {
            os_log("%s %s > %s", type: level.logType, level.icon, dateString, "\(object)")
        }
    }
}
