class RightOverCenterToBottomStroke < Stroke
  def segments
    x = left - 100
    controlPoint3StartX = left - 30
    controlPoint3EndX   = left - 5
    pt3CurrentX = if x < controlPoint3StartX
      controlPoint3StartX
    elsif x > controlPoint3EndX
      controlPoint3EndX
    else
      x
    end
    [ Segment.new(center_color, [center - 1, top + 40 - 1 + 10], [center -  1, top + 40 - 1 + 10], [center - 1, top + 40 - 1 + 10], [right  + 60, top + 40 + 100]),
      Segment.new(right_color,  [right  - 1, top + 10 - 1 + 10], [right  + 15, top + 10 + 20    ], [right  + 5, top + 10 + 35    ], [center - 70, top + 50 + 100]),
      Segment.new(left_color,   [left  + 1, top + 40 - 1 + 10], [left   - 15, top + 40 + 25    ], [pt3CurrentX,  top + 80         ], [x, top + 50 + 100])
    ]
  end

  def after_colors
    [left_color, right_color, center_color]
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

  def next_strokes
    [RightOverCenterStroke, LeftOverCenterToBottomStroke]
  end
end
