class Segment
  attr_reader :color, :controlPoint1, :controlPoint2, :controlPoint3, :controlPoint4
  def initialize(color, pt1, pt2, pt3, pt4)
    @color = color
  	@controlPoint1 = CGPointMake(pt1[0], pt1[1])
    @controlPoint2 = CGPointMake(pt2[0], pt2[1])
    @controlPoint3 = CGPointMake(pt3[0], pt3[1])
  	@controlPoint4 = CGPointMake(pt4[0], pt4[1])
	end
end
