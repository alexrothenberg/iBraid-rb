class RightOverCenterToBottomStroke < Stroke
  def drawStroke(top, leftColor, centerColor, rightColor)
  	controlPoint1 = CGPointMake(center - 1,     top + 40 - 1 + 10)
    controlPoint2 = controlPoint1
    controlPoint3 = controlPoint1
  	controlPoint4 = CGPointMake(right + 60,        top + 40 + 100)
  	drawStrand(controlPoint1, controlPoint2, controlPoint3, controlPoint4, centerColor)

    bottomOfCenter = center - 70
  	controlPoint1 = CGPointMake(right  - 1,      top + 10 - 1 + 10)
  	controlPoint2 = CGPointMake(right  + 15,     top + 10 + 25)
  	controlPoint3 = CGPointMake(right  + 5,      top + 50)
  	controlPoint4 = CGPointMake(bottomOfCenter,  top + 50 + 100)
  	drawStrand(controlPoint1, controlPoint2, controlPoint3, controlPoint4, rightColor)

    x = left - 100
    controlPoint3StartX = left - 30
    controlPoint3EndX   = left - 5
    if x < controlPoint3StartX
      controlPoint3CurrentX = controlPoint3StartX
    elsif x > controlPoint3EndX
      controlPoint3CurrentX = controlPoint3EndX
    else
      controlPoint3CurrentX = x
    end
    controlPoint1 = CGPointMake(left + 1,             top+40-1+10   )
    controlPoint2 = CGPointMake(left - 15,           top+40 + 25)
    controlPoint3 = CGPointMake(controlPoint3CurrentX,      top+40 + 40)
    controlPoint4 = CGPointMake(x,                          top+40 + 110)
  	drawStrand(controlPoint1, controlPoint2, controlPoint3, controlPoint4, leftColor)

    # NSLog("#{self} (#{controlPoint1.x}, #{controlPoint1.y}), (#{controlPoint2.x}, #{controlPoint2.y}), (#{controlPoint3.x}, #{controlPoint3.y}), (#{controlPoint4.x}, #{controlPoint4.y})")

    return [leftColor, rightColor, centerColor]
  end
  
  def touchAtLocation(location)
    bottomOfLeft = left - 100
    (location.x > bottomOfLeft - 40) && (location.x < bottomOfLeft + 40)
  end

  def touchUpAtLocation(location)
    bottomOfCenter = center - 70
    braidHappened = (x >=  bottomOfCenter)
    self.x = left - 100 unless braidHappened
    braidHappened
  end

  def nextStrokes
    [ RightOverCenterStroke.new(bounds), LeftOverCenterToBottomStroke.new(bounds) ]
  end
end
