import UIKit

private var normalColorContext: UInt8 = 0
private var highlightedColorContext: UInt8 = 0
private var highlightedOptionsContext: UInt8 = 0
private var highlightedDelayContext: UInt8 = 0
private var highlightedDurationContext: UInt8 = 0

public extension FluidHighlighter where Base: UIView {
    
    // MARK: - Properties
    
    private(set) var normalColor: UIColor? {
        get {
            return objc_getAssociatedObject(base, &normalColorContext) as? UIColor
        }
        set {
            objc_setAssociatedObject(base, &normalColorContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private(set) var highlightedColor: UIColor? {
        get {
            return objc_getAssociatedObject(base, &highlightedColorContext) as? UIColor
        }
        set {
            objc_setAssociatedObject(base, &highlightedColorContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private(set) var highlightedOptions: UIView.AnimationOptions? {
        get {
            return objc_getAssociatedObject(base, &highlightedOptionsContext) as? UIView.AnimationOptions
        }
        set {
            objc_setAssociatedObject(base, &highlightedOptionsContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private(set) var highlightedDelay: TimeInterval {
        get {
            guard let delay = objc_getAssociatedObject(base, &highlightedDelayContext) as? TimeInterval else {return 0.0}
            return delay
        }
        set {
            objc_setAssociatedObject(base, &highlightedDelayContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private(set) var highlightedDuration: TimeInterval {
        get {
            guard let duration = objc_getAssociatedObject(base, &highlightedDurationContext) as? TimeInterval else {return 0.0}
            return duration
        }
        set {
            objc_setAssociatedObject(base, &highlightedDurationContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Public methods
    
    public func enable(normalColor: UIColor, highlightedColor: UIColor, highlightedOptions: UIView.AnimationOptions? = nil, highlightedDelay: TimeInterval = 0.0, highlightedDuration: TimeInterval = 0.5) {
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.highlightedOptions = highlightedOptions
        self.highlightedDelay = highlightedDelay
        self.highlightedDuration = highlightedDuration
        
        base.backgroundColor = normalColor
    }
    
    public func disable() {
        normalColor = nil
        highlightedColor = nil
        highlightedOptions = nil
        highlightedDelay = 0
        highlightedDuration = 0
    }
    
    public func touchDown() {
        guard let highlightedColor = highlightedColor else {return}
        
        base.backgroundColor = highlightedColor
    }
    
    public func touchUp() {
        guard let normalColor = normalColor else {return}
        
        UIView.animate(withDuration: highlightedDuration, delay: highlightedDelay, options: highlightedOptions ?? [], animations: {
            self.base.backgroundColor = normalColor
        })
    }
    
}

extension UIView {
    
    // MARK: - Overridden: UIView
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        fh.touchDown()
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        fh.touchUp()
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first {
            let position = touch.location(in: self)
            isInside(position: position) ? fh.touchDown() : fh.touchUp()
        }
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        fh.touchUp()
    }
    
    // MARK: - Private methods
    
    private func isInside(position: CGPoint) -> Bool {
        let x = position.x
        let y = position.y
        let xIsInFrame = bounds.origin.x <= x && x <= bounds.origin.x + bounds.width*1.5
        let yIsInFrame = bounds.origin.y <= y && y <= bounds.origin.y + bounds.height*1.5
        return xIsInFrame && yIsInFrame
    }
    
}
