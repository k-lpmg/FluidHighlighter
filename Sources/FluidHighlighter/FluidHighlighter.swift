import UIKit

public class FluidHighlighter<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol FluidHighlighterCompatible {
    associatedtype FluidHighlighterCompatibleType
    var fh: FluidHighlighterCompatibleType { get }
}

public extension FluidHighlighterCompatible {
    var fh: FluidHighlighter<Self> {
        return FluidHighlighter(self)
    }
}

extension UIView: FluidHighlighterCompatible {}
