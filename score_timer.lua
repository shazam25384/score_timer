-- score timer Shazam253 - 2025-11-09 - MIT License
-- graphical score board instead of flooding message history
-- put at mission start
-- install pictures by opening .miz file with archiver, 
-- i.e. 7zip and adding the timer folder to it.

-- you can additionally output the score
-- attention: the flags BlueScore and RedScore need to be initialized before hand!
dbg=false

function score_timer(dbg, t)
  -- get scores
  local blue_score=string.format('%03d',trigger.misc.getUserFlag ('BlueScore'))
  local red_score=string.format('%03d',trigger.misc.getUserFlag ('RedScore'))

  -- get timer, and change it to minutes and seconds
  local dt=timer.getAbsTime() - timer.getTime0()
  local mins=string.format('%03d',math.floor(dt/60))
  local secs=string.format('%02d',math.floor(dt%60))

  -- now convert all numbers to individual strings
  local b1=string.sub(blue_score,1,1)
  local b2=string.sub(blue_score,2,2)
  local b3=string.sub(blue_score,3,3)
  
  local r1=string.sub(red_score,1,1)
  local r2=string.sub(red_score,2,2)
  local r3=string.sub(red_score,3,3)

  local m1=string.sub(mins,1,1)
  local m2=string.sub(mins,2,2)
  local m3=string.sub(mins,3,3)
  local s1=string.sub(secs,1,1)
  local s2=string.sub(secs,2,2)

  -- output pictures
  -- a_out_picture (fn, time to stay, clearview, delay, x [0..2], y [0..2], size, 0 original / 1 window
  net.dostring_in('mission',               "a_out_picture('score_timer/empty.png', 1., false, 0, 0, 2, 10, '1')"    )
  
  net.dostring_in('mission', string.format("a_out_picture('score_timer/0%s.png',   1., false, 0, 0, 2, 10, '1')",b1))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/1%s.png',   1., false, 0, 0, 2, 10, '1')",b2))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/2%s.png',   1., false, 0, 0, 2, 10, '1')",b3))

  net.dostring_in('mission', string.format("a_out_picture('score_timer/4%s.png',   1., false, 0, 0, 2, 10, '1')",r1))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/5%s.png',   1., false, 0, 0, 2, 10, '1')",r2))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/6%s.png',   1., false, 0, 0, 2, 10, '1')",r3))
  
  net.dostring_in('mission', string.format("a_out_picture('score_timer/8%s.png',   1., false, 0, 0, 2, 10, '1')",m1))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/9%s.png',   1., false, 0, 0, 2, 10, '1')",m2))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/10%s.png',   1., false, 0, 0, 2, 10, '1')",m3))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/12%s.png',  1., false, 0, 0, 2, 10, '1')",s1))
  net.dostring_in('mission', string.format("a_out_picture('score_timer/13%s.png',  1., false, 0, 0, 2, 10, '1')",s2))
  
  -- dble check output
  if dbg == true then
    summary='Blue Score ' .. b1 .. b2 ..  b3 .. ' | Red Score ' .. r1 .. r2 .. r3 .. ' |  Time ' .. m1 .. m2 .. m3 .. ':' .. s1 .. s2
    trigger.action.outText(summary, 1., true)
  end
  
  -- call again a second later
  return t+0.5
 end
 
 timer.scheduleFunction(score_timer,dbg,timer.getTime()+1.)