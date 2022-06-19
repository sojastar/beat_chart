require 'pp'
require 'optparse'





### 1. CONSTANTS : #############################################################
HOOKS = [ { type: :kidnapped,         best_followed_by: :development },
          { type: :coronet_blue,      best_followed_by: :cliffhanger },
          { type: :cliffhanger,       best_followed_by: :development },
          { type: :development,       best_followed_by: :cliffhanger },
          { type: :discovery,         best_followed_by: :cliffhanger },
          { type: :crisis,            best_followed_by: :development },
          { type: :revelation,        best_followed_by: :cliffhanger },
          { type: :murder,            best_followed_by: :both },
          { type: :false_accusation,  best_followed_by: :cliffhanger },
          { type: :looming_threat,    best_followed_by: :cliffhanger } ]

CLIFFHANGERS  = [ { type: :chase },
                  { type: :pursuit },
                  { type: :race },
                  { type: :fistfight },
                  { type: :dogfight },
                  { type: :confrontation },
                  { type: :duel },
                  { type: :battle },
                  { type: :monster },
                  { type: :ambush },
                  { type: :obstacles },
                  { type: :contest },
                  { type: :skirmish } ]

DEVELOPMENTS  = [ { type: :warning },
                  { type: :hidden_weakness },
                  { type: :revelation },
                  { type: :advantage_revealed },
                  { type: :clue },
                  { type: :retreat },
                  { type: :hesitation },
                  { type: :mistaken_identity },
                  { type: :villain_s_monologue },
                  { type: :secret_meeting },
                  { type: :personal_stake },
                  { type: :second_chance },
                  { type: :gain_mastery },
                  { type: :alliance },
                  { type: :betrayal },
                  { type: :sabotage },
                  { type: :foreshadowing },
                  { type: :not_what_it_seems },
                  { type: :strange_bedfellows },
                  { type: :turnabout },
                  { type: :romance },
                  { type: :lie_revealed },
                  { type: :hazardous_quest },
                  { type: :puzzle },
                  { type: :framed },
                  { type: :obsession },
                  { type: :back_from_the_dead },
                  { type: :rescuers },
                  { type: :vengeance } ]

CLIMAX  = [ { type: :final_revelation },
            { type: :final_battle } ]

RESOLUTIONS = [ { type: :happy_ending },
                { type: :villain_is_killed },
                { type: :villain_surrenders },
                { type: :villain_escapes },
                { type: :heroes_captured },
                { type: :heroes_escape },
                { type: :ending_cliffhanger },
                { type: :greater_threat } ]





### 2. USER INPUT : ############################################################
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: beat_chart.rb [options]"

  opts.on("-lLENGTH", "--length=LENGTH", "Beat chart length") do |l|
    options[:length] = l.to_i
  end
end.parse!

if options[:length] < 3
  puts "Beat chart to short. Main sequence must be longer than 2."
  exit(0)
end





### 3. BUILDING THE BEAT CHART : ###############################################

## 3.1 HOOK : ##################################################################
new_beat_chart  = [ HOOKS.sample ]

if new_beat_chart.first[:type] == :cliffhanger
  new_beat_chart.first[:type] = CLIFFHANGERS.sample[:type]
end

if new_beat_chart.first[:type] == :development
  new_beat_chart.first[:type] = DEVELOPMENTS.sample[:type] 
end


### 3.2 MAIN : #################################################################
next_beat = case new_beat_chart.first[:best_followed_by]
            when :cliffhanger then  CLIFFHANGERS
            when :development then  DEVELOPMENTS
            when :both        then  [ DEVELOPMENTS, CLIFFHANGERS ].sample
            end

options[:length].times do |i|
  new_beat_chart << next_beat.sample
  next_beat = if next_beat == DEVELOPMENTS  then  CLIFFHANGERS
              else                                DEVELOPMENTS
              end
end
  

### 3.3 CLIMAX : ###############################################################
new_beat_chart << if next_beat == DEVELOPMENTS then CLIMAX[0]
                  else                              CLIMAX[1]
                  end


### 3.4 RESOLUTION : ###########################################################
new_beat_chart << RESOLUTIONS.sample





### 4. PRINT OUT : #############################################################
new_beat_chart.each { |beat| puts "- #{beat[:type].to_s.split('_').join(' ')}" }
