require 'pry'

def game_hash
    hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => %w[Black White],
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
            :colors => %w[Turquoise Purple],
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
end

def num_points_scored(player)
    points = 0
    game = game_hash
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |playa, stats|
                    if playa == player
                        points = stats[:points]
                    end
                end
            end
        end
    end
    points
end

def shoe_size(player)
    shoe_size = 0
    game = game_hash
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |playa, stats|
                    if playa == player
                        shoe_size = stats[:shoe]
                    end
                end
            end
        end
    end
    shoe_size
end

def team_colors(team)
    colors = []
    game = game_hash
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "team_name"
                if data == team
                    blue = true
                    colors = game[location][:colors]
                end
            end
        end
    end
    colors
end

def team_names
    game = game_hash
    teams = []
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "team_name"
                teams << data
            end
        end
    end
    teams
end

def player_numbers(team)
    game = game_hash
    numbers = []
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "team_name"
                if data == team
                    game[location][:players][0].each do |player, stats|
                            numbers << stats[:number]
                    end
                end
            end
        end
    end
    numbers
end

def player_stats(player)
    game = game_hash
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |playa, stats|
                    if playa == player
                        return stats
                    end
                end
            end
        end
    end
end

def big_shoe_rebounds
    game = game_hash
    largest_shoe = 0
    largest_name = ""
    rebounds = 0
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |playa, stats|
                    if stats[:shoe] > largest_shoe
                        largest_shoe = stats[:shoe]
                        largest_name = playa
                        rebounds = stats[:rebounds]
                    end
                end
            end
        end
    end
    rebounds
end

def most_points_scored
    game = game_hash
    points = 0
    name = ""
    
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |playa, stats|
                    if stats[:points] > points
                        points = stats[:points]
                        name = playa
                    end
                end
            end
        end
    end
    name
end

def winning_team
    game = game_hash
    nets_score = 0
    hornets_score = 0
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "team_name"
                if data == "Brooklyn Nets"
                    game[location][:players][0].each do |player, stats|
                        nets_score += stats[:points]
                    end
                else
                    game[location][:players][0].each do |player, stats|
                        hornets_score += stats[:points]
                    end
                end
            end
        end
    end
    nets_score > hornets_score ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
    game = game_hash
    length = 0
    name = ""
    
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |player, stats|
                    if player.length > length
                        name = player
                        length = player.length
                    end
                end
            end
        end
    end
    name
end

def long_name_steals_a_ton?
    game = game_hash
    steals = 0
    name = ""
    longest_name = player_with_longest_name
    
    game.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute.to_s == "players"
                data[0].each do |player, stats|
                    if stats[:steals] > steals
                        name = player
                        steals = stats[:steals]
                    end
                end
            end
        end
    end
    name == longest_name ? true : false
end
