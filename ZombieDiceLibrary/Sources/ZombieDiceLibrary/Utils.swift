public class Utils {
    
    static func getSideLabel(side: SideType) -> String {

        switch side {
        case SideType.Brain:
            return "\u{1f9e0}"
        case SideType.Steps:
            return "\u{1f463}"
        case SideType.Gun:
            return "\u{1f4a5}"
        }
    }

    public static func askYesNo(question: String, ioProcessor: IOProcessor) -> Bool {
        
        var response: String
        repeat {
            ioProcessor.write(question + "[y/n]", terminator: " ")
            response = ioProcessor.read()!
        } while response != "y" && response != "n"

        return response == "y" ? true : false
    } 
}