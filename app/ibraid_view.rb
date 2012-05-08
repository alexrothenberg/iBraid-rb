class IBraidView < UIView
  attr_reader :strokes
  attr_accessor :braiding
  def initWithFrame(rect)
    super
    self.bounds = UIScreen.mainScreen.applicationFrame # kinda hardcoding...
    
    @strands = [:redColor, :greenColor, :blueColor].map do |color|
      Strand.new UIColor.send(color)
    end
    @actions = [:right_over, :left_over, :right_over, :left_over]
    
    setUpPlacardViews
    self
  end

  def setUpPlacardViews
    @leftColor   = UIColor.greenColor
    @centerColor = UIColor.blueColor
    @rightColor  = UIColor.redColor
    colors =  [@leftColor, @centerColor, @rightColor]

    @strokes = [RightOverCenterStroke.new(-60, colors)]
    add_stroke(LeftOverCenterStroke)
    add_stroke(RightOverCenterStroke)
    add_stroke(LeftOverCenterToBottomStroke)

    # @strokes = [
    #   LeftOverCenterStroke.new(bounds),
    #   RightOverCenterStroke.new( bounds),
    #   LeftOverCenterStroke.new(bounds),
    #   RightOverCenterToBottomStroke.new(bounds)
    # ]
  end
  
  def add_stroke(stroke_class)
    previous_stroke = strokes.last
    @strokes << stroke_class.new(previous_stroke.bottom, previous_stroke.after_colors)
  end

  def drawRect(rect)
    context = UIGraphicsGetCurrentContext();

    # Draw the background as a white square framed in black
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0)
    CGContextFillRect(context, bounds)
    
    draw_strokes
  end
  
  def draw_strokes
    context = UIGraphicsGetCurrentContext()
    @strokes.each do |stroke|
      stroke.draw(context)
    end
  end



  def touchesBegan(touches, withEvent:event)
    touch = touches.anyObject
    location = touch.locationInView(self)
    strokes.last.x = location.x

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
        next_strokes = stroke.next_strokes
        strokes.pop
        next_strokes.each {|stroke| add_stroke(stroke) }
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
