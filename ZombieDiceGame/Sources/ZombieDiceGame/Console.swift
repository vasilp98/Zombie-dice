import ZombieDiceLibrary

class Console : IOProcessor {
    func write(_ items: Any, separator: String = " ", terminator: String = "\n") {
        print(items, separator: separator, terminator: terminator)
    }

    func writeSeparator() {
        print("===")
    }

    func read() -> String? {
        return readLine()
    }
}