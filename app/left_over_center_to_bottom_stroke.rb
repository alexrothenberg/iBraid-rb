class LeftOverCenterToBottomStroke < Stroke
  def segments
    x = right + 100
    controlPoint3StartX = right + 30
    controlPoint3EndX   = right + 5
    pt3CurrentX = if x > controlPoint3StartX
      controlPoint3StartX
    elsif x < controlPoint3EndX
      controlPoint3EndX
    else
      x
    end

    [ Segment.new(center_color, [center+ 1, top + 40 - 1 + 10], [center +  1, top + 40 - 1 + 10], [center + 1,  top + 40 - 1 + 10], [left   - 60, top + 40 + 100]),
      Segment.new(left_color,   [left  + 1, top + 10 - 1 + 10], [left   - 15, top + 10 + 25    ], [left   - 5,  top + 50         ], [center + 70, top + 50 + 100]),
      Segment.new(right_color,  [right - 1, top + 40 - 1 + 10], [right  + 15, top + 40 + 25    ], [pt3CurrentX, top + 40 + 40    ], [x,           top + 40 + 110])
    ]
  end

  def after_colors
    [center_color, left_color, right_color]
  end
  
  def touchAtLocation(location)
    bottomOfRight = right + 100
    (location.x > bottomOfRight - 40) && (location.x < bottomOfRight + 40);
  end
  
  def touchUpAtLocation(location)
    bottomOfCenter = center + 70
    braidHappened = (x <=  bottomOfCenter)
    self.x = right + 100 unless braidHappened
    braidHappened
  end

  def next_strokes
    [ LeftOverCenterStroke, RightOverCenterToBottomStroke ]
  end

  
end