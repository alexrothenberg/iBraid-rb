class Stroke
  attr_reader :top, :colors, :strandWidth
  attr_accessor :x
  def initialize(top, colors)
    @top = top
    @colors = colors
    @strandWidth = 30
    # @debugging = true
  end
  
  def bounds
    @bounds ||= UIScreen.mainScreen.applicationFrame # kinda hardcoding...
  end

  def sideSpace
	  (bounds.size.width - 3*strandWidth)/2;
	end

  def left
    0.5*strandWidth + sideSpace
  end

  def center
    1.5*strandWidth + sideSpace
  end

  def right
    2.5*strandWidth + sideSpace
  end
  
  def bottom
    top+30
  end
  def left_color
    colors[0]
  end
  def center_color
    colors[1]
  end
  def right_color
    colors[2]
  end
  
  def draw(context)
    segments.each do |segment|
    	drawStrand(context, segment.controlPoint1, segment.controlPoint2, segment.controlPoint3, segment.controlPoint4, segment.color)
    end
  end

  def drawStrand(context, controlPoint1, controlPoint2, controlPoint3, controlPoint4, strand_color)
    cgBounds = self.bounds;

    UIColor.clearColor
    # //      self.opaque = NO;
    # //      CGRect cgBounds = NSRectToCGRect(nsBounds);
    # // self.opaque = NO;

    CGContextSetFillColorWithColor(context, UIColor.clearColor.CGColor)
    CGContextFillRect(context, bounds)

    CGContextMoveToPoint(context, controlPoint1.x, controlPoint1.y);
    CGContextAddCurveToPoint(context,
                             controlPoint2.x, controlPoint2.y,
                             controlPoint3.x, controlPoint3.y,
                             controlPoint4.x, controlPoint4.y
                            )

    # Draw it
    CGContextSetLineWidth(context, 30.0)
    CGContextSetStrokeColorWithColor(context, strand_color.CGColor)
    CGContextStrokePath(context)

    if (@debugging)
      # Put the control points as dots
      drawControlPoint(controlPoint1,context)
      drawControlPoint(controlPoint2,context)
      drawControlPoint(controlPoint3,context)
      drawControlPoint(controlPoint4,context)
    end
  end

  def drawControlPoint(controlPoint, context)
    cgControlPointRect = controlPointRectForPoint(controlPoint)
    CGContextSetRGBFillColor(context, 0.5, 0.5, 0.5, 1.0)
    CGContextFillRect(context, cgControlPointRect)
    CGContextSetLineWidth(context, 1.0)
    CGContextStrokeRect(context, cgControlPointRect)
  end

  CONTROL_POINT_SIZE = 8.0;
  def controlPointRectForPoint(currentPoint)
	  CGRectMake(
			   currentPoint.x - 0.5 * CONTROL_POINT_SIZE,
			   currentPoint.y - 0.5 * CONTROL_POINT_SIZE,
			   CONTROL_POINT_SIZE,
			   CONTROL_POINT_SIZE)
	end
end