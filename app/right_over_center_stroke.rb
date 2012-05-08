class RightOverCenterStroke < Stroke
  def segments
    [ Segment.new(center_color, [center - 1, top + 40 - 1 + 10], [center -  1, top + 40 - 1 + 10], [center - 1, top + 40 - 1 + 10], [right,  top + 40 + 40]),
      Segment.new(right_color,  [right  - 1, top + 10 - 1 + 10], [right  + 10, top + 10 + 20    ], [right  + 5, top + 10 + 35    ], [center, top + 10 + 70])
    ]
  end

  def after_colors
    return [left_color, right_color, center_color]
  end
end