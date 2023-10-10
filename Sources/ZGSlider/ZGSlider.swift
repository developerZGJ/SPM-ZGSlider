import UIKit

public class ZGSlider: UISlider {
    
    public var sliderHeight: CGFloat = 1

    private var thumbBound_x: CGFloat = 10
    private var thumbBound_y: CGFloat = 20
    private var lastBounds = CGRect.zero

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let result = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        lastBounds = result
        return result
    }
    
    public override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.trackRect(forBounds: bounds)
        layer.cornerRadius = sliderHeight/2
        return CGRect.init(x: rect.origin.x, y: (bounds.size.height-sliderHeight)/2, width: bounds.size.width, height: sliderHeight)
    }
    

    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var result = super.point(inside: point, with: event)
        if !result && point.y > -10 {
            if point.x >= (lastBounds.origin.x - thumbBound_x),
                point.x <= (lastBounds.origin.x + lastBounds.size.width + thumbBound_x),
               point.y < (lastBounds.size.height + thumbBound_y){
                result = true
            }
        }
        return result
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
