require 'pp'
require 'optparse'





### 1. CONSTANTS : #############################################################
HOOKS = [ { type: :kidnapped,        name: 'Kidnapped',         best_followed_by: :development  },
          { type: :coronet_blue,     name: 'Coronet blue',      best_followed_by: :cliffhanger  },
          { type: :cliffhanger,      name: 'Cliffhanger',       best_followed_by: :development  },
          { type: :development,      name: 'Development',       best_followed_by: :cliffhanger  },
          { type: :discovery,        name: 'Discovery',         best_followed_by: :cliffhanger  },
          { type: :crisis,           name: 'Crisis',            best_followed_by: :development  },
          { type: :revelation,       name: 'Revelation',        best_followed_by: :cliffhanger  },
          { type: :murder,           name: 'Murder',            best_followed_by: :both         },
          { type: :false_accusation, name: 'False accusation',  best_followed_by: :cliffhanger  },
          { type: :looming_threat,   name: 'Looming threat',    best_followed_by: :cliffhanger  } ]

CLIFFHANGERS  = [ { type: :chase,         name: 'Chase'         },
                  { type: :pursuit,       name: 'Pursuit'       },
                  { type: :race,          name: 'Race'          },
                  { type: :fistfight,     name: 'Fistfight'     },
                  { type: :dogfight,      name: 'Dogfight'      },
                  { type: :confrontation, name: 'Confrontation' },
                  { type: :duel,          name: 'Duel'          },
                  { type: :battle,        name: 'Battle'        },
                  { type: :monster,       name: 'Monster'       },
                  { type: :ambush,        name: 'Ambush'        },
                  { type: :obstacles,     name: 'Obstacles'     },
                  { type: :contest,       name: 'Contest'       },
                  { type: :skirmish,      name: 'Skirmish'      } ]

DEVELOPMENTS  = [ { type: :warning,             name: 'Warning'               },
                  { type: :hidden_weakness,     name: 'Hidden weakness'       },
                  { type: :revelation,          name: 'Revelation'            },
                  { type: :advantage_revealed,  name: 'Advantage revealed'    },
                  { type: :clue,                name: 'Clue'                  },
                  { type: :retreat,             name: 'Retreat'               },
                  { type: :hesitation,          name: 'Hesitation'            },
                  { type: :mistaken_identity,   name: 'Mistaken identity'     },
                  { type: :villain_s_monologue, name: "Villain\'s_monologue"  },
                  { type: :secret_meeting,      name: 'Secret meeting'        },
                  { type: :personal_stake,      name: 'Personal stake'        },
                  { type: :second_chance,       name: 'Second chance'         },
                  { type: :gain_mastery,        name: 'Gain mastery'          },
                  { type: :alliance,            name: 'Alliance'              },
                  { type: :betrayal,            name: 'Betrayal'              },
                  { type: :sabotage,            name: 'Sabotage'              },
                  { type: :foreshadowing,       name: 'Foreshadowing'         },
                  { type: :not_what_it_seems,   name: 'Not what it seems'     },
                  { type: :strange_bedfellows,  name: 'Strange bedfellows'    },
                  { type: :turnabout,           name: 'Turnabout'             },
                  { type: :romance,             name: 'Romance'               },
                  { type: :lie_revealed,        name: 'Lie_revealed'          },
                  { type: :hazardous_quest,     name: 'Hazardous quest'       },
                  { type: :puzzle,              name: 'Puzzle'                },
                  { type: :framed,              name: 'Framed'                },
                  { type: :obsession,           name: 'Obsession'             },
                  { type: :back_from_the_dead,  name: 'Back from the dead'    },
                  { type: :rescuers,            name: 'Rescuers'              },
                  { type: :vengeance,           name: 'Vengeance'             } ]

CLIMAX  = [ { type: :final_revelation,  name: 'Final revelation' },
            { type: :final_battle,      name: 'Final battle' } ]

RESOLUTIONS = [ { type: :happy_ending,        name: 'Happy ending'        },
                { type: :villain_is_killed,   name: 'Villains is killed'  },
                { type: :villain_surrenders,  name: 'Villain surrenders'  },
                { type: :villain_escapes,     name: 'Villain escapes'     },
                { type: :heroes_captured,     name: 'Heroes captured'     },
                { type: :heroes_escape,       name: 'Heroes escape'       },
                { type: :ending_cliffhanger,  name: 'Ending cliffhanger'  },
                { type: :greater_threat,      name: 'Greater threat'      } ]





### 2. TOOLS : #################################################################
def progress(beat_chart,index)
  ( index + 1 ).to_f / beat_chart.length
end

class Array
  def at_f(f)
    at( ( f * length ).round )
  end
end





### 3. USER INPUT : ############################################################

### 3.1 Parsing the options:
options = { context:  'contexts/république_française.rb',   # default values
            offset:   0 }
OptionParser.new do |opts|
  opts.banner = "Usage: beat_chart.rb [options]"

  opts.on("-lLENGTH", "--length=LENGTH", "Beat chart length") do |l|
    options[:length]  = l.to_i
  end

  opts.on("-cCONTEXT", "--context=CONTEXT", "The story context as a .rb file") do |c|
    options[:context] = c
  end

  opts.on("-oOFFSET", "--offset=OFFSET", "Offset to the progess counter") do |o|
    options[:oofset]  = o.to_i
  end
end.parse!


### 3.2 Checking that options are valid:
if options[:length] < 3
  puts "Beat chart to short. Main sequence must be longer than 2."
  exit(0)
end

if File::exist?('./' + options[:context]) then
  require './' + options[:context]

else
  puts "Context file #{options[:context]} does not exist."
  exit(0)

end





### 4. BUILDING THE BEAT CHART : ###############################################

### 4.1 HOOK : #################################################################
new_beat_chart  = [ HOOKS.sample.dup ]

if new_beat_chart.first[:type] == :cliffhanger
  new_beat_chart.first[:type] = CLIFFHANGERS.sample[:type]
end

if new_beat_chart.first[:type] == :development
  new_beat_chart.first[:type] = DEVELOPMENTS.sample[:type] 
end


### 4.2 MAIN : #################################################################
next_beat_type  = case new_beat_chart.first[:best_followed_by]
                  when :cliffhanger then  CLIFFHANGERS
                  when :development then  DEVELOPMENTS
                  when :both        then  [ DEVELOPMENTS, CLIFFHANGERS ].sample
                  end

options[:length].times do |i|
  new_beat_chart << next_beat_type.sample.dup
  next_beat_type  = next_beat_type == DEVELOPMENTS ? CLIFFHANGERS : DEVELOPMENTS 
end
  

### 4.3 CLIMAX : ###############################################################
new_beat_chart << CLIMAX[next_beat_type == DEVELOPMENTS ? 0 : 1].dup


### 4.4 RESOLUTION : ###########################################################
new_beat_chart << RESOLUTIONS.sample





### 5. PLACES : ################################################################
visited_places  = []
new_beat_chart.each.with_index do |beat,index|
  place = PLACES.sample
  place = PLACES.sample while visited_places.include? place[:type]
  visited_places << place[:type]

  #puts "#{index} -> #{visited_places}"
  #puts "#{progress(new_beat_chart, index)} -> #{place}"

  beat[:place]  = DICTIONARY[place[:type]][:en]
end





### 5. PRINT OUT : #############################################################
new_beat_chart.each { |beat| puts "- #{beat[:name]} at #{beat[:place]}" }
