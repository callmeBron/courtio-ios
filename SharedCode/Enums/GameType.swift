import Foundation

enum GameType {
    case squash
    case pickleball
    case paddel
    case racketball
    case tennis
    
    var minimumPoints: Int {
        return switch self {
        case .squash:
            11
        default:
            0
        }
    }
    var winMargin: Int {
        return switch self {
        case .squash:
            2
        default:
            0
        }
    }
}
