class LeftOverCenterStroke < Stroke
  def segments
    [ Segment.new(center_color, [center+ 1, top + 40 - 1 + 10], [center +  1, top + 40 - 1 + 10], [center + 1, top + 40 - 1 + 10], [left,   top + 40 + 40]),
      Segment.new(left_color,   [left  + 1, top + 10 - 1 + 10], [left   - 10, top + 10 + 20    ], [left   - 5, top + 10 + 35    ], [center, top + 10 + 70])
    ]
  end
  
  def after_colors
    [center_color, left_color, right_color]
  end
    
end





