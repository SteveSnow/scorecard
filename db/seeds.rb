# Adds in holes for white with ids 1-9
Hole.create(name:'1w',par:4)
Yardage.create(hole_id:1,black:307,blue:295,white:284,red:242,gold:247)
Hole.create(name:'2w',par:3)
Yardage.create(hole_id:2,black:178,blue:152,white:140,red:117,gold:120)
Hole.create(name:'3w',par:4)
Yardage.create(hole_id:3,black:436,blue:410,white:395,red:312,gold:316)
Hole.create(name:'4w',par:5)
Yardage.create(hole_id:4,black:510,blue:500,white:480,red:390,gold:401)
Hole.create(name:'5w',par:4)
Yardage.create(hole_id:5,black:476,blue:434,white:394,red:334,gold:339)
Hole.create(name:'6w',par:4)
Yardage.create(hole_id:6,black:425,blue:412,white:375,red:344,gold:351)
Hole.create(name:'7w',par:5)
Yardage.create(hole_id:7,black:595,blue:542,white:528,red:413,gold:421)
Hole.create(name:'8w',par:3)
Yardage.create(hole_id:8,black:243,blue:206,white:185,red:145,gold:153)
Hole.create(name:'9w',par:4)
Yardage.create(hole_id:9,black:411,blue:392,white:374,red:313,gold:323)

# Adds in holes for blue with ids 10-18
Hole.create(name:'1b',par:5)
Yardage.create(hole_id:10,black:514,blue:494,white:465,red:429,gold:434)
Hole.create(name:'2b',par:4)
Yardage.create(hole_id:11,black:393,blue:364,white:364,red:329,gold:336)
Hole.create(name:'3b',par:4)
Yardage.create(hole_id:12,black:383,blue:371,white:371,red:317,gold:321)
Hole.create(name:'4b',par:4)
Yardage.create(hole_id:13,black:391,blue:378,white:378,red:325,gold:328)
Hole.create(name:'5b',par:3)
Yardage.create(hole_id:14,black:187,blue:155,white:141,red:124,gold:132)
Hole.create(name:'6b',par:5)
Yardage.create(hole_id:15,black:514,blue:502,white:502,red:416,gold:423)
Hole.create(name:'7b',par:4)
Yardage.create(hole_id:16,black:402,blue:365,white:355,red:306,gold:312)
Hole.create(name:'8b',par:3)
Yardage.create(hole_id:17,black:159,blue:159,white:143,red:137,gold:144)
Hole.create(name:'9b',par:4)
Yardage.create(hole_id:18,black:419,blue:400,white:400,red:337,gold:337)

# Adds in holes for red with ids 19-27
Hole.create(name:'1r',par:4)
Yardage.create(hole_id:19,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'2r',par:4)
Yardage.create(hole_id:20,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'3r',par:3)
Yardage.create(hole_id:21,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'4r',par:5)
Yardage.create(hole_id:22,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'5r',par:4)
Yardage.create(hole_id:23,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'6r',par:3)
Yardage.create(hole_id:24,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'7r',par:5)
Yardage.create(hole_id:25,black:500,blue:400,white:300,red:200,gold:100)
Hole.create(name:'8r',par:4)
Yardage.create(hole_id:26,black:500,blue:666,white:300,red:200,gold:100)
Hole.create(name:'9r',par:3)
Yardage.create(hole_id:27,black:500,blue:400,white:300,red:200,gold:100)


# Create test rounds:
case Rails.env
when "development"
  member = Member.create! :fname => 'Steve', :lname => 'Snow',:email => 'steven.snow@outlook.com', :password => 'topsecret', :password_confirmation => 'topsecret'

  wb_par_round=Round.create(track:'wb',member_id:member.id,tee:'blue')
  wb_par_round.scores.each do |s|
      s.update(strokes:s.hole.par,member_id:member.id)
  end

  br_par_round=Round.create(track:'br',member_id:member.id,tee:'black')
  br_par_round.scores.each do |s|
    s.update(strokes:s.hole.par)
    s.update(strokes:s.hole.par,member_id:member.id)
  end

  rw_par_round=Round.create(track:'rw',member_id:member.id,tee:'white')
  rw_par_round.scores.each do |s|
    s.update(strokes:s.hole.par,member_id:member.id)
  end

  wb_over_par_round=Round.create(track:'wb',member_id:member.id,tee:'red')
  wb_over_par_round.scores.each do |s|
      s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  br_over_par_round=Round.create(track:'br',member_id:member.id,tee:'gold')
  br_over_par_round.scores.each do |s|
    s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  rw_over_par_round=Round.create(track:'rw',member_id:member.id,tee:'blue')
  rw_over_par_round.scores.each do |s|
    s.update(strokes:s.hole.par+1,member_id:member.id)
  end

  wb_incomplete_round=Round.create(track:'wb',member_id:member.id,tee:'blue')
  wb_incomplete_round.scores.each do |s|
      s.update(strokes:s.hole.par+1,member_id:member.id)
      if s.hole.id==16
        exit
      end
  end
end
