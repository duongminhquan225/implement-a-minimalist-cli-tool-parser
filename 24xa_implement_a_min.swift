import Foundation

// Define a struct to hold the CLI options
struct Options {
    let help: Bool
    let version: Bool
    let input: String?
}

// Define a function to parse the CLI arguments
func parseArguments(_ arguments: [String]) -> Options? {
    var options = Options(help: false, version: false, input: nil)
    var iterator = arguments.makeIterator()
    
    while let argument = iterator.next() {
        if argument == "-h" || argument == "--help" {
            options.help = true
        } else if argument == "-v" || argument == "--version" {
            options.version = true
        } else if argument.starts(with: "-") {
            print("Unknown option: \(argument)")
            return nil
        } else {
            options.input = argument
        }
    }
    
    return options
}

// Define a function to print the help message
func printHelp() {
    let helpMessage = """
    Usage: 24xa_implement_a_min [options] <input>

    Options:
    -h, --help       Show this help message
    -v, --version    Show the version number
    """
    print(helpMessage)
}

// Define a function to print the version number
func printVersion() {
    let version = "1.0"
    print("Version: \(version)")
}

// Define the main function
func main() {
    let arguments = CommandLine.arguments
    guard let options = parseArguments(arguments) else {
        print("Error: Invalid arguments")
        return
    }
    
    if options.help {
        printHelp()
    } else if options.version {
        printVersion()
    } else if let input = options.input {
        print("Input: \(input)")
    }
}

// Call the main function
main()