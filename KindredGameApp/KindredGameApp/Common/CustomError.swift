import Foundation

// This list out all possible errors.
enum CustomErrorType : String {
    case errDefault
    case errNoInternet
    case errConnectionTimeout
    case errNoDataFound
    
    var rawValue: String {
        get {
            switch self {
            case .errDefault:
                return "There is something went wrong, Try again later"
            case .errNoInternet:
                return "Please check your internet connection and try again"
            case .errConnectionTimeout:
                return "Connection timeout"
            case .errNoDataFound:
                return "No data available."
            }
        }
    }
}
// CustomError is an generic error class used for all error purpose
class CustomError :Error {
    
    /// define which type of error is this,
    var errorType:CustomErrorType!
    
    //  initilize method
    convenience init(_ type:CustomErrorType) {
        self.init()
        errorType = type
    }
}

