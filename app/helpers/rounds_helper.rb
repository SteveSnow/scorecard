module RoundsHelper
  def hole_name(short)
    name=''
    case short[1].downcase
      when 'r'
        course_name=' Red'
      when 'b'
        course_name=' Blue'
      when 'w'
        course_name=' White'
    end
    name=short[0]+course_name
  end

end
