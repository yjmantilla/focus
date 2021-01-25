use_bpm 75
facebook1 = "C:/Users/user/Desktop/attention/Facebook 1.wav"
facebook2 = "C:/Users/user/Desktop/attention/Face.wav"
twitter = "C:/Users/user/Desktop/attention/Twitter.wav"

sample facebook1
sleep 2
sample :ambi_glass_rub, amp:0.75
in_thread do
  sleep 4
  26.times do
    with_fx :reverb, room: 0.5 do
      sample :drum_heavy_kick
      sleep 1
      sample :drum_snare_hard
      sleep 1
      sample :drum_heavy_kick
      sleep 1
      sample :drum_snare_hard
      sleep 1
    end
  end
end

in_thread do
  sleep 80
  with_fx :reverb, room: 0.5 do
    50.times do
      sample :drum_cymbal_closed
      sleep 0.5
    end
    
  end
end



in_thread do
  50.times do
    with_fx :reverb, room: 0.5 do
      sample :drum_cymbal_pedal
      sleep 0.5
      sample :drum_cymbal_closed
      sleep 1
    end
  end
end

#bajos
in_thread do
  sleep 4
  
  7.times do
    
    use_synth :fm
    play :A2
    sleep 4
    play :e2
    sleep 4
    play :d2
    sleep 1.5
    play :c2
    sleep 1.5
    play :b1
    sleep 1
    play :a1
    play :a2
    sleep 4
  end
end



# melodia a1
in_thread do
  sleep 20
  3.times do
    with_fx :reverb do
      use_synth :piano
      play_pattern_timed [:a, :a, :b, :a, :e, :fs, :g, :e, :d, :d, :e, :c, :b3, :a3, :a3, :b3, :a3], [0.5, 0.5, 0.5, 2.5, 0.5, 0.5, 0.5, 2.5, 0.5, 0.5, 0.5, 1.5, 1, 0.5, 0.5, 0.5, 2.5,]
    end
  end
  
end

# melodia a1.2

in_thread do
  sleep 80
  
  2.times do
    with_fx :reverb do
      use_synth :piano
      play_pattern_timed [:a, :a, :b, :a, :e, :fs, :g, :e, :d, :d, :e, :c, :b3, :a3, :a3, :b3, :a3], [0.5, 0.5, 0.5, 2.5, 0.5, 0.5, 0.5, 2.5, 0.5, 0.5, 0.5, 1.5, 1, 0.5, 0.5, 0.5, 2.5,]
    end
  end
end

# melodia a2
in_thread do
  sleep 50
  3.times do
    use_synth :piano
    play_pattern_timed [:a4, :b4, :c5, :d5, :e5, :e5, :e5, :e5, :f5, :e5, :e5, :d5, :c5, :b4, :e5, :b4, :c5, :a], [0.5, 0.5, 0.5, 0.5, 2, 0.5, 0.5, 0.5, 0.5, 2, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5]
  end
end

# melodia b1
in_thread do
  sleep 36
  7.times do
    use_synth :hoover
    play (scale :A, :minor).choose, amp: 0.3
    sleep 2
    
  end
end

# melodia b1.2
in_thread do
  sleep 80
  15.times do
    use_synth :hoover
    play (scale :A, :minor).choose, amp: 0.3
    sleep 2
    
  end
end

# melodia b2
in_thread do
  sleep 80
  sample facebook1
  30.times do
    use_synth :pluck
    play (scale :A, :minor_pentatonic).tick, amp: 0.25
    sleep 1
    
  end
end

# anillos 1
in_thread do
  sleep 20
  68.times do
    use_synth :piano
    play [(chord :A3, :minor), (chord :e3, :minor), (chord :d3, :major), (chord :c3, :major)].ring.tick, attack: 0, release: 1
    sleep 1
  end
end

# anillos 2
in_thread do
  sleep 80
  32.times do
    use_synth :piano
    play [(chord :A3, :minor), (chord :e3, :minor), (chord :d3, :major), (chord :c3, :major)].ring.tick, attack: 0, release: 1
    sleep 1
  end
end

in_thread do
  sleep 79
  sample :elec_filt_snare, amp: 1.3
end

in_thread do
  sleep 4
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 5, rate: 1.83
  end
  sleep 8
end

in_thread do
  sleep 14
  sample :guit_e_slide, rate: 0.5
  sleep 63
  sample twitter, amp: 1.5
end

in_thread do
  sleep 4
  sample :ambi_glass_hum
  sleep 109
  sample facebook2, amp: 2
end