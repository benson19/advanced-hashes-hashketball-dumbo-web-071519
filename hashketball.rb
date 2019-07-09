require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },        
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },        
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },        
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },        
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },        
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 
        },        
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }   
hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(players_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |players|
          players.each do |name, val|
             #puts "name #{name}"
             #puts "val #{val}"
             if name == players_name
              return val[:points] 
             end
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |players|
          players.each do |name, val|
             if name == players_name
              return val[:shoe] 
             end
          end
        end
      end
    end
  end  
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        names << data
      end
    end
  end 
names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players 
          #puts attribute
          data.each do |players|
            players.each do |name, val|
              #puts name
               numbers << val[:number]
            end
          end
        end
      end
    end
  end 
numbers  
end

def player_stats(players_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |players|
          players.each do |name, val|
             if name == players_name
             val 
             end
          end
        end
      end
    end
  end    
end

def big_shoe_rebounds
  bigShoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |players|
          players.each do |name, val|
            if val[:shoe] > bigShoe
              bigShoe = val[:shoe]
              rebounds = val[:rebounds]
             end
          end
        end
      end
    end
  end    
rebounds
end  

def most_points_scored
  mostPoints = 0
  mostVP = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |players|
          players.each do |name, val|
            if val[:points] > mostPoints
              mostPoints = val[:points]
              mostVP = name
             end
          end
        end
      end
    end
  end    
mostVP
end

def all_stats
  stats = []
  homeStats = team_stats(:home)
  awayStats = team_stats(:away)
  stats = homeStats + awayStats
stats
end

def team_stats(loc)
  game_hash.each do |location, team_data|
    if location == loc
      team_data.each do |attribute, data|
        if attribute == :players 
        data
        end
      end
    end
  end  
end

def winning_team
  homeTeam = game_hash[:home][:team_name]
  awayTeam = game_hash[:away][:team_name]
  homeScore = 0
  awayScore = 0

  homeStats = team_stats(:home)
  awayStats = team_stats(:away)

  winner = ""
  #puts "home #{homeStats}"
  #puts "away #{awayStats}"

  homeStats.each do |players|
    players.each do |name, val|
      homeScore += val[:points]
    end
  end

  awayStats.each do |players|
    players.each do |name, val|
      awayScore += val[:points]
    end
  end

  homeScore > awayScore ? winner = homeTeam : winner = awayTeam
winner 
end

def array_of_players
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        #puts attribute
        data.each do |players|
          players.each do |name, val|
            #puts name
             names << name
          end
        end
      end
    end
  end 
names  
end

def player_with_longest_name
  players = array_of_players.sort_by { 
    |word| word.length 
  }
  return players[players.length - 1 ]
end

def most_steals 
  maxSteals = 0
  playersName = ""
  all_stats.each do |players|
    players.each do |name, val|
      #puts val[:steals]
      if val[:steals] > maxSteals
        maxSteals = val[:steals]
        playersName = name
        #puts val[:steals]
      else 
        maxSteals = maxSteals
      end
    end
  end
playersName
end

def long_name_steals_a_ton?
  name = player_with_longest_name
  steals = most_steals
  val = name == steals ? true : false
val
end