class IBraidView < UIView
  attr_reader :strokes
  attr_accessor :braiding
  def initWithFrame(rect)
    super
    self.bounds = UIScreen.mainScreen.applicationFrame # kinda hardcoding...
    setUpPlacardViews
    self
  end

  def setUpPlacardViews
    @leftColor   = UIColor.greenColor
    @centerColor = UIColor.blueColor
    @rightColor  = UIColor.redColor

    @strokes = [
      RightOverCenterStroke.new(bounds),
      LeftOverCenterStroke.new( bounds),
      RightOverCenterStroke.new(bounds),
      LeftOverCenterToBottomStroke.new(bounds)
    ]

    # @strokes = [
    #   LeftOverCenterStroke.new(bounds),
    #   RightOverCenterStroke.new( bounds),
    #   LeftOverCenterStroke.new(bounds),
    #   RightOverCenterToBottomStroke.new(bounds)
    # ]
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext();

    # Draw the background as a white square framed in black
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0)
    CGContextFillRect(context, bounds)

    top = -60
    colors =  [UIColor.redColor, UIColor.greenColor, UIColor.blueColor, nil]

    strokes.each do |element|
      colors = element.drawStroke(top, colors[0], colors[1], colors[2])
      top += 30
    end
  end

  def touchesBegan(touches, withEvent:event)
    touch = touches.anyObject
    location = touch.locationInView(self)

    self.braiding = strokes.last.touchAtLocation(location)
  end

  def touchesMoved(touches, withEvent:event)
    if braiding
      touch = touches.anyObject
      location = touch.locationInView(self)

      stroke = strokes.last
      stroke.x = location.x

      setNeedsDisplay()
    end
  end

  def touchesEnded(touches, withEvent:event)
    if braiding
      touch = touches.anyObject
      location = touch.locationInView(self)
      stroke = strokes.last

      if stroke.touchUpAtLocation(location)
        nextStrokes = stroke.nextStrokes
        strokes.removeLastObject()
        strokes.addObjectsFromArray(nextStrokes)
      end
      setNeedsDisplay()
    end
    self.braiding = false
  end

# //- (bool)inStrand: (int)strandIdx loc:(CGPoint*)location
# //{
# //  NSLog(@"in inStrand?");
# //
# //  bool after_left   = ((*location).x-bottomPoints[strandIdx].x) > 0;
# //  bool before_right = ((*location).x-bottomPoints[strandIdx].x) < 30;
# //
# //
# //  return after_left && before_right;
# //}


end
