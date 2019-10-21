def game_hash 
  game = {
    :home => {
    	:team_name => 'Brooklyn Nets',
    	:colors => ['Black', 'White'],
    	:players => {
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
    	}
    },
    :away => {
    	:team_name => 'Charlotte Hornets',
    	:colors => ["Turquoise", "Purple"],
    	:players => {
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
    	}
    }
  }
end

def num_points_scored(name)
  puts "num_points_scored"
  pp name
  
  game_hash.each do |side, team|
    puts "game_hash.each..."
    puts side #=> home/away
    puts team #=> team hash data
    
    team.each do |attribute, data|
      puts "team.each..."
      puts "attribute = #{attribute}"
      
      if attribute == :players
        puts "attribute is :players..."
        
        data.each do |player, stats|
          puts player
          puts stats[:points]
          return stats[:points] if player == name
        end #=> END [:players] => data.each
        
      end #=> END if attribute == :players
    end #=> END team.each
  end #=> END game_hash.each
end #=> END num_points_scored

def shoe_size(name)
  puts "shoe_size"
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          puts player
          puts stats[:points]
          return stats[:shoe] if player == name
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    end #=> END team.each
    
  end #=> END game_hash.each
end #=> END shoe_size

def team_colors(team_name)
  puts "team_colors"
  
  game_hash.each do |side, team|
    return game_hash[side][:colors] if team[:team_name] == team_name
  end
  
end

def team_names
  puts "team_names"
  teams = []
  game_hash.each do |side, team|
    teams.push(team[:team_name])
  end
  teams
end

def player_numbers(team_name)
  puts "player_numbers"
  numbers = []
  game_hash.each do |side, team|
    
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            puts player
            puts stats[:number]
            numbers.push(stats[:number])
            pp numbers
          end #=> END [:players] => data.each
        end #=> END if attribute == :players
      end #=> END team.each
    end #=> END if [:team_name] == team_name
  end
  numbers.sort
end

def player_stats(name)
  puts "player_stats"
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        
        data.each do |player, stats|
          puts player
          puts stats
          return stats if player == name
        end #=> END [:players].data.each
        
      end #=> END if attribute == :players
    end #=> END team.each
    
  end #=> END game_hash.each
end #=> END player_stats

def big_shoe_rebounds
  puts "big_shoe_rebounds"
  shoe_sizes = {}
  
  game_hash.each do |side, team|
    
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          #puts player
          #puts stats[:shoe]
          shoe_sizes[:player_name] = player
          shoe_sizes[:player_name][player][:shoe] = stats[:shoe]
          shoe_sizes[:player_name][player][:rebounds] = stats[:rebounds]
        end #=> END [:players] => data.each
      end #=> END if attribute == :players
    
    end #=> END team.each
    
  end #=> END game_hash.each
  puts shoe_sizes
  reverse = shoe_sizes.sort_by {|k, v| -v[:shoe]}
  pp reverse[0][0][:shoe]
  
end