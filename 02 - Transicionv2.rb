use_bpm 60
drop = "C:/Users/user/Desktop/attention/Gota.wav"
space = 1.5

in_thread do
  20.times  do
    with_fx :reverb, room: 1 do
      with_fx :echo, mix: 0.3, phase: 0.25 do
        sample drop, rate: 0.45, start: 0.3 #0.12
      end
      
    end
    sleep space = [0.9*space,0.15].max
  end
end


in_thread do
  30.times  do
    with_fx :reverb, room: 1 do
      with_fx :echo, mix: 0.3, phase: 0.25 do
        sample :elec_tick
      end
      
    end
    sleep space = [0.9*space,0.15].max
  end
end
sleep 8
sample :misc_cineboom