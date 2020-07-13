import ZombieDiceLibrary

class Console : IOProcessor {
    func write(_ items: Any) {
        print(items)
    }

    func writeSeparator() {
        print("===")
    }

    func read() -> String? {
        return readLine()
    }
}