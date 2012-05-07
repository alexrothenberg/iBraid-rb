class RightOverCenterStroke < Stroke
  def drawStroke(top, leftColor, centerColor, rightColor)
  	controlPoint1 = CGPointMake(center-1,     top + 40 - 1 + 10)
    controlPoint2 = controlPoint1
    controlPoint3 = controlPoint1
  	controlPoint4 = CGPointMake(right,        top + 40 + 40)
  	drawStrand(controlPoint1, controlPoint2, controlPoint3, controlPoint4, centerColor)

  	controlPoint1 = CGPointMake(right  - 1,    top+ 10 - 1 + 10)
  	controlPoint2 = CGPointMake(right  + 10,   top + 10 + 20)
  	controlPoint3 = CGPointMake(right  + 5,   top + 10 + 35)
  	controlPoint4 = CGPointMake(center,       top + 10 + 70)
  	drawStrand(controlPoint1, controlPoint2, controlPoint3, controlPoint4, rightColor)

    # NSLog("#{self} (#{controlPoint1.x}, #{controlPoint1.y}), (#{controlPoint2.x}, #{controlPoint2.y}), (#{controlPoint3.x}, #{controlPoint3.y}), (#{controlPoint4.x}, #{controlPoint4.y})")
    
    return [leftColor, rightColor, centerColor, nil]
  end
end