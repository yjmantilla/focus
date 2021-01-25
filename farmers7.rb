bpm = 60
use_bpm bpm#*5
space = 0.2#*5 #jugar con esto para transicion , relog ,tiempo
#aceleracion y decrecimiento
use_random_seed 137#0#142857
base_rhythm = true
base_rhythm_amp = 1
chord_base = false
random_drums = false
random_drums_amp = 0.5
melody = false
max_focus = 17
focus = max_focus
focus_= false
INTRO_TIME = 30
stop_intro = false
up = "C:/Users/user/Desktop/attention/cuero.wav"
down = "C:/Users/user/Desktop/attention/palo.wav"
MARK = :elec_tick
base_rhythm_end = false
random_drums_end = false
melody_end = false
chord_base_end = false
chord_base_synth = :sine #:hollow #:piano
chord_base_amp = 0.05
melody_synth = :hollow #:sine #:pluck
melody_amp = 1


define :eleven do |up,down,a|
  4.times do
    1.times do
      sample MARK#,amp:10*a #up,amp:3*a
      sleep space
      sample down,amp:a
      sleep space
      sample down,amp:a
      sleep space
    end
    2.times do
      sample up,amp:a
      sleep space
      sample down,amp:a
      sleep space
      sample down,amp:a
      sleep space
    end
    
    1.times do
      sample up,amp:a
      sleep space
      sample down,amp:a
      sleep space
    end
  end
end

define :seven do |up,down,a|
  4.times do
    1.times do
      sample MARK#,amp:10*a
      sleep space
      sample down,amp:a
      sleep space
    end
    1.times do
      sample up,amp:a
      sleep space
      sample down,amp:a
      sleep space
    end
    
    1.times do
      sample up,amp:a
      sleep space
      sample down,amp:a
      sleep space
      sample down,amp:a
      sleep space
      
    end
  end
end

define :four do |up,down,a|
  4.times do
    sample MARK#, amp:10*a
    sleep space
    sample down,amp:a
    sleep space
    sample up,amp:a
    sleep space
    sample down,amp:a
    sleep space
    sample MARK #,amp:10*a
    sleep space
    sample down,amp:a
    sleep space
    sample up,amp:a
    sleep space
    sample down,amp:a
    sleep space
    
  end
end

define :five do |up,down,a|
  4.times do
    sample MARK#, amp:10*a
    sleep space
    sample down,amp:a
    sleep space
    sample down,amp:a
    sleep space
    sample up,amp:a
    sleep space
    sample down,amp:a
    sleep space
  end
end



in_thread do
  eleven up,down,base_rhythm_amp
  seven up,down,base_rhythm_amp
  random_drums = true
  four up,down,base_rhythm_amp
  five up,down,base_rhythm_amp
  cue:start_chord_base
  
  loop do
    
    if base_rhythm
      eleven up,down,base_rhythm_amp
      seven up,down,base_rhythm_amp
      four up,down,base_rhythm_amp
      five up,down,base_rhythm_amp
    else
      sleep space
    end
    if stop_intro
      base_rhythm_end = true
      stop
    end
    
  end
end
mode = 1
in_thread do
  use_synth chord_base_synth
  first_chord_base = true
  loop do
    mode = 1
    4.times do
      4.times do
        if chord_base
          play :A,amp:chord_base_amp
          sleep space
          play :C,amp:chord_base_amp
          sleep space
          play :E,amp:chord_base_amp
          sleep space
        else
          sleep 3*space
        end
        if stop_intro
          chord_base_end = true
          stop
        end
        
        
      end
      4.times do
        if chord_base
          play :C,amp:chord_base_amp
          sleep space
          play :E,amp:chord_base_amp
          sleep space
          play :G,amp:chord_base_amp
          sleep space
        else
          
          sleep 3*space
        end
        if stop_intro
          chord_base_end = true
          stop
        end
        
      end
    end
    mode = 2
    4.times do
      4.times do
        if chord_base
          play :A,amp:chord_base_amp
          sleep space
          play :Db,amp:chord_base_amp
          sleep space
          play :E,amp:chord_base_amp
          sleep space
        else
          sleep 3*space
        end
        if stop_intro
          chord_base_end = true
          stop
        end
        
      end
      4.times do
        if chord_base
          play :Db,amp:chord_base_amp
          sleep space
          play :E,amp:chord_base_amp
          sleep space
          play :Ab,amp:chord_base_amp
          sleep space
        else
          sleep 3*space
        end
        if stop_intro
          chord_base_end = true
          stop
        end
        
      end
    end
    if first_chord_base
      cue:start_melody
      first_chord_base = false
      
    end
    
  end
end


in_thread do
  loop do
    if (random_drums)
      if one_in(11)
        sample :drum_heavy_kick,amp:random_drums_amp
      end
      if one_in(7)
        sample :drum_cymbal_closed,amp:random_drums_amp
      end
      if one_in(4)
        sample :drum_snare_soft, amp:random_drums_amp
      end
      if one_in(5)
        sample :drum_cymbal_pedal, amp:random_drums_amp
      end
      if one_in(17)
        sample :ambi_swoosh, amp:random_drums_amp
      end
      
      
    end
    sleep space
    if stop_intro
      random_drums_end = true
      stop
    end
    
  end
end


in_thread do
  use_synth melody_synth
  first_melody = true
  loop do
    if stop_intro
      melody_end = true
      stop
    end
    
    if melody
      if (mode==1)
        play :A,amp:melody_amp
        sleep 2*space
        play :A,amp:melody_amp
        sleep 2*space
        play :B,amp:melody_amp
        sleep 2*space
        play :A,amp:melody_amp
        sleep 2*space
        
        sleep space*4
        
        play :E,amp:melody_amp
        sleep 2*space
        play :Gb,amp:melody_amp
        sleep 2*space
        play :G,amp:melody_amp
        sleep 2*space
        play :E,amp:melody_amp
        sleep 6*space
        
        play :D,amp:melody_amp
        sleep 2*space
        play :D,amp:melody_amp
        sleep 2*space
        play :E,amp:melody_amp
        sleep 2*space
        play :C,amp:melody_amp
        sleep 4*space
        play :B3,amp:melody_amp
        sleep 2*space
        play :A3,amp:melody_amp
        sleep 12*space
      end
      if (mode == 2)
        if one_in(2)
          play :E,amp:melody_amp
          sleep 2*space
          play :D,amp:melody_amp
          sleep 2*space
          play :Db,amp:melody_amp
          sleep 2*space
          play :B3,amp:melody_amp
          sleep 2*space
          
          sleep space*4
          
          play :D,amp:melody_amp
          sleep 2*space
          play :Db,amp:melody_amp
          sleep 2*space
          play :B,amp:melody_amp
          sleep 2*space
          play :A,amp:melody_amp
          sleep 6*space
          
          play :Db,amp:melody_amp
          sleep 2*space
          play :B,amp:melody_amp
          sleep 2*space
          play :A,amp:melody_amp
          sleep 2*space
          play :Ab,amp:melody_amp
          sleep 6*space
          play :E4,amp:melody_amp
          play :A4,amp:melody_amp
          sleep 12*space
          
        else
          
          play :Ab,amp:melody_amp
          sleep 2*space
          play :Ab,amp:melody_amp
          sleep 2*space
          play :B,amp:melody_amp
          sleep 2*space
          play :Ab,amp:melody_amp
          sleep 2*space
          
          sleep space*4
          
          play :E,amp:melody_amp
          sleep 2*space
          play :Gb,amp:melody_amp
          sleep 2*space
          play :G,amp:melody_amp
          sleep 2*space
          play :E,amp:melody_amp
          sleep 6*space
          
          play :Db,amp:melody_amp
          sleep 2*space
          play :Db,amp:melody_amp
          sleep 2*space
          play :E,amp:melody_amp
          sleep 2*space
          play :Cb4,amp:melody_amp
          play :Gb5,amp:melody_amp
          sleep 6*space
          play :Ab4,amp:melody_amp
          play :B5,amp:melody_amp
          sleep 12*space
          if first_melody
            cue :start_focus
            first_melody = false
          end
          
        end
        
        
      end
      sleep space
    else
      sleep space
    end
  end
end

in_thread do
  
  loop do
    if stop_intro
      stop
    end
    
    if focus_
      if one_in(focus)
        base_rhythm = !base_rhythm
        
      end
      if one_in(focus)
        chord_base = !chord_base
        
      end
      if one_in(focus)
        random_drums = !random_drums
        
      end
      if one_in(focus)
        melody = !melody
      end
    end
    
    sleep space
    
  end
end

in_thread do
  
  loop do
    if focus_
      #focus = rand(2..max_focus)
      puts focus
      #max_focus = max_focus - 10
      #puts max_focus
      if focus > 2
        focus = focus - 1
        
      elsif base_rhythm || chord_base || random_drums || melody == false
        stop_intro = true
        cue :intro_cooldown
        stop
      end
      
      sleep 3
    else
      sleep space
      
    end
    
  end
end

in_thread do
  sync:start_melody
  melody = true
end

in_thread do
  sync :start_focus
  focus_ = true
end
in_thread do
  sync:start_chord_base
  chord_base = true
end

in_thread do
  sync :intro_cooldown
  loop do
    if melody_end && random_drums_end && chord_base_end && base_rhythm_end
      cue :transition
      stop
    else
      #bpm = bpm + 0.5*bpm
      #use_bpm bpm
      space = [0.9*space,0.073].max
      puts space
    end
    sleep 1
    
  end
end


in_thread do
  sync :transition
  puts 'next part'
end
