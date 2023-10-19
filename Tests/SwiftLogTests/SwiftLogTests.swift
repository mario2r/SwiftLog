import XCTest
@testable import SwiftLog

final class SwiftLogTests: XCTestCase {
    func testLevelLogType() throws {
        XCTAssertEqual(Level.trace.logType, .debug)
        XCTAssertEqual(Level.verbose.logType, .debug)
        XCTAssertEqual(Level.debug.logType, .debug)
        XCTAssertEqual(Level.info.logType, .info)
        XCTAssertEqual(Level.warning.logType, .default)
        XCTAssertEqual(Level.error.logType, .error)
        XCTAssertEqual(Level.critical.logType, .fault)
        XCTAssertEqual(Level.none.logType, .default)
    }

    func testIconLogType() throws {
        XCTAssertEqual(Level.trace.icon, "🗯")
        XCTAssertEqual(Level.verbose.icon, "🗯")
        XCTAssertEqual(Level.debug.icon, "🔹")
        XCTAssertEqual(Level.info.icon, "ℹ️")
        XCTAssertEqual(Level.warning.icon, "⚠️")
        XCTAssertEqual(Level.error.icon, "‼️")
        XCTAssertEqual(Level.critical.icon, "💣")
        XCTAssertEqual(Level.none.icon, "")
    }

    func testEquatable() throws {
        XCTAssertEqual(Level.trace, Level.trace)
        XCTAssertGreaterThan(Level.debug, Level.trace)
        XCTAssertLessThan(Level.trace, Level.debug)
    }

    func testLoggerDate() throws {
        let logger = Logger()
        XCTAssertEqual(logger.outputLevel, .none)
        logger.setOutputLevel(.debug)
        XCTAssertEqual(logger.outputLevel, .debug)

        logger.verbose("Verbose")
        logger.debug("Debug")
        logger.info("Info")
        logger.warning("Warning")
        logger.error("Error")
        logger.critical("Critical")
    }
}
