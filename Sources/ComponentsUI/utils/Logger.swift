import Foundation
import os

final class Logger: LoggerContract {
#if DEBUG
    var outputLevel: Level = .verbose
#else
    var outputLevel: Level = .none
#endif
    
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

extension Level {
    var logType: OSLogType {
        switch self {
        case .verbose:
            return .debug
        case .debug:
            return .debug
        case .info:
            return .info
        case .warning:
            return .default
        case .error:
            return .error
        case .critical:
            return .fault
        case .none:
            return .default
        }
    }
}

public nonisolated(unsafe) var logger: LoggerContract = Logger()

public enum Level: Int, CaseIterable, Comparable {
    case critical
    case debug
    case error
    case info
    case none
    case verbose
    case warning
    
    var icon: String {
        switch self {
        case .critical: return "💣"
        case .debug: return "🧑🏼‍💻"
        case .error: return "🚨"
        case .info: return "ℹ️"
        case .none: return ""
        case .verbose: return "💬"
        case .warning: return "⚠️"
        }
    }
    public static func < (lhs: Level, rhs: Level) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

public protocol LoggerContract {
    var outputLevel: Level { get }
    func critical(_ object: Any)
    func debug(_ object: Any)
    func error(_ object: Any)
    func info(_ object: Any)
    func setOutputLevel(_ level: Level)
    func verbose(_ object: Any)
    func warning(_ object: Any)
}
