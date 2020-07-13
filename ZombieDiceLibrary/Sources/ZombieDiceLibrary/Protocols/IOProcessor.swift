public protocol IOProcessor {
    func write(_ items: Any, separator: String, terminator: String)

    func writeSeparator()

    func read() -> String?
}