# Write your code here!
require 'pry'
def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: [
        {
          player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: [
        {
          player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  points = nil
  game_hash.each do |location, team_hash|
    team_hash.each do |team_key, team_values|
      if team_key == :players
        team_values.each do |player|
          player.each do |player_key, player_value|
            if player_value == name
              points = player[:points]
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(name)
  shoe = nil
  game_hash.each do |location, team_hash|
    team_hash.each do |team_key, team_values|
      if team_key == :players
        team_values.each do |player|
          player.each do |player_key, player_value|
            if player_value == name
              shoe = player[:shoe]
            end
          end
        end
      end
    end
  end
  shoe
end

def team_colors(team)
  colors = nil
  game_hash.each do |location, team_hash|
    team_hash.each do |team_key, team_values|
      if team_values == team
        colors = team_hash[:colors]
      end
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_hash|
    team_hash.each do |team_key, team_values|
      if team_key == :team_name
        names << team_values
      end
    end
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_hash|
    team_hash.each do |team_key, team_values|
      if team_values == team
        team_hash[:players].each do |player|
          numbers << player[:number]
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats = {}
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player|
      if player[:player_name] == name
        player.each do |player_key, player_value|
          if player_key != :player_name
            stats[player_key] = player_value
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe = 0
  player_hash = nil
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player|
      if shoe_size(player[:player_name]) > shoe
        shoe = shoe_size(player[:player_name])
        player_hash = player
      end
    end
  end
  player_hash[:rebounds]
end

def most_points_scored
  points = 0
  player_hash = nil
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player|
      if num_points_scored(player[:player_name]) > points
        points = num_points_scored(player[:player_name])
        player_hash = player
      end
    end
  end
  player_hash[:player_name]
end

def winning_team
  home = 0
  away = 0
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player|
      if location == :home
        home += player[:points]
      else
        away += player[:points]
      end
    end
  end
  if home > away
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  player_name = ''
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player|
      if player[:player_name].size > name_length
        name_length = player[:player_name].size
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  true
end
