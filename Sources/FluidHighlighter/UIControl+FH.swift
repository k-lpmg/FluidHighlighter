import UIKit

private var touchProxyContext: UInt8 = 0
private var normalColorContext: UInt8 = 0
private var highlightedColorContext: UInt8 = 0
private var selectedColorContext: UInt8 = 0
private var highlightedOptionsContext: UInt8 = 0
private var highlightedDelayContext: UInt8 = 0
private var highlightedDurationContext: UInt8 = 0

public extension FluidHighlighter where Base: UIControl {
    
    // MARK: - Properties
    
    private var touchProxy: TouchProxy? {
        get {
            return objc_getAssociatedObject(base, &touchProxyContext) as? TouchProxy
        }
        set {
            objc_setAssociatedObject(base, &touchProxyContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
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
    
    private(set) var selectedColor: UIColor? {
        get {
            return objc_getAssociatedObject(base, &selectedColorContext) as? UIColor
        }
        set {
            objc_setAssociatedObject(base, &selectedColorContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
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
    
    func controlEnable(normalColor: UIColor,
                       highlightedColor: UIColor,
                       selectedColor: UIColor? = nil,
                       highlightedOptions: UIView.AnimationOptions? = nil,
                       highlightedDelay: TimeInterval = 0.0,
                       highlightedDuration: TimeInterval = 0.5) {
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.selectedColor = selectedColor
        
        self.highlightedOptions = highlightedOptions
        self.highlightedDelay = highlightedDelay
        self.highlightedDuration = highlightedDuration
        
        base.backgroundColor = base.isSelected ? selectedColor ?? normalColor : normalColor
        
        if touchProxy == nil {
            touchProxy = TouchProxy(control: base)
            touchProxy?.addTarget()
        }
    }
    
    func controlDisable() {
        normalColor = nil
        highlightedColor = nil
        highlightedOptions = nil
        highlightedDelay = 0
        highlightedDuration = 0
        
        touchProxy = nil
        touchProxy?.removeTarget()
    }
    
    func refreshBackgroundColor() {
        touchProxy?.refreshBackgroundColor()
    }
    
    // MARK: - Proxy
    
    fileprivate final class TouchProxy {
        
        // MARK: - Properties
        
        private let control: UIControl
        
        // MARK: - Constructor
        
        init(control: UIControl) {
            self.control = control
        }
        
        // MARK: - Public methods
        
        public func addTarget() {
            control.addTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
            control.addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        }
        
        public func removeTarget() {
            control.removeTarget(self, action: #selector(touchDown), for: [.touchDown, .touchDragEnter])
            control.removeTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchDragExit, .touchCancel])
        }
        
        public func refreshBackgroundColor() {
            UIView.animate(withDuration: control.fh.highlightedDuration, delay: control.fh.highlightedDelay, options: control.fh.highlightedOptions ?? [], animations: {
                self.control.backgroundColor = self.control.isSelected ? self.control.fh.selectedColor ?? self.control.fh.normalColor : self.control.fh.normalColor
            })
        }
        
        // MARK: - Private selector
        
        @objc private func touchDown() {
            control.backgroundColor = control.fh.highlightedColor
        }
        
        @objc private func touchUp() {
            refreshBackgroundColor()
        }
        
    }
    
}
