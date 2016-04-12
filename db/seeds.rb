# Adds in holes for white with ids 1-9
Hole.create(name:'1w',par:4)
Yardage.create(hole_id:0,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'2w',par:3)
Yardage.create(hole_id:1,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'3w',par:4)
Yardage.create(hole_id:2,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'4w',par:5)
Yardage.create(hole_id:3,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'5w',par:4)
Yardage.create(hole_id:4,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'6w',par:4)
Yardage.create(hole_id:5,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'7w',par:5)
Yardage.create(hole_id:6,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'8w',par:3)
Yardage.create(hole_id:7,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'9w',par:4)
Yardage.create(hole_id:8,black:500,blue:400,white:300,red:200,gold:100)

# Adds in holes for blue with ids 10-18
Hole.create(name:'1b',par:5)
Yardage.create(hole_id:9,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'2b',par:4)
Yardage.create(hole_id:10,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'3b',par:4)
Yardage.create(hole_id:11,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'4b',par:4)
Yardage.create(hole_id:12,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'5b',par:3)
Yardage.create(hole_id:13,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'6b',par:5)
Yardage.create(hole_id:14,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'7b',par:4)
Yardage.create(hole_id:15,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'8b',par:3)
Yardage.create(hole_id:16,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'9b',par:4)
Yardage.create(hole_id:17,black:500,blue:400,white:300,red:200,gold:100)

# Adds in holes for red with ids 19-27
Hole.create(name:'1r',par:4)
Yardage.create(hole_id:18,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'2r',par:4)
Yardage.create(hole_id:19,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'3r',par:3)
Yardage.create(hole_id:20,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'4r',par:5)
Yardage.create(hole_id:21,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'5r',par:4)
Yardage.create(hole_id:22,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'6r',par:3)
Yardage.create(hole_id:23,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'7r',par:5)
Yardage.create(hole_id:24,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'8r',par:4)
Yardage.create(hole_id:25,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'9r',par:3)
Yardage.create(hole_id:26,black:500,blue:400,white:300,red:200,gold:100)


# Create test rounds:
case Rails.env
when "development"
  member = Member.create! :fname => 'Steve', :lname => 'Snow',:email => 'steven.snow@outlook.com', :password => 'topsecret', :password_confirmation => 'topsecret'

  wb_par_round=Round.create(track:'wb',member_id:member.id)
  wb_par_round.scores.each do |s|
      s.update(strokes:s.hole.par,member_id:member.id)
  end

  br_par_round=Round.create(track:'br',member_id:member.id)
  br_par_round.scores.each do |s|
    s.update(strokes:s.hole.par)
    s.update(strokes:s.hole.par,member_id:member.id)
  end

  rw_par_round=Round.create(track:'rw',member_id:member.id)
  rw_par_round.scores.each do |s|
    s.update(strokes:s.hole.par,member_id:member.id)
  end

  wb_over_par_round=Round.create(track:'wb',member_id:member.id)
  wb_over_par_round.scores.each do |s|
      s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  br_over_par_round=Round.create(track:'br',member_id:member.id)
  br_over_par_round.scores.each do |s|
    s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  rw_over_par_round=Round.create(track:'rw',member_id:member.id)
  rw_over_par_round.scores.each do |s|
    s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  wb_incomplete_round=Round.create(track:'wb',member_id:member.id)
  wb_incomplete_round.scores.each do |s|
      s.update(strokes:s.hole.par+1,member_id:member.id)
      if s.hole.id==16
        exit
      end
  end
end
