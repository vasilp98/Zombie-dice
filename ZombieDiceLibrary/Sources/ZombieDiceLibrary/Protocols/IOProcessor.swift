public protocol IOProcessor {
    func write(_ items: Any)

    func writeSeparator()

    func read() -> String?
}