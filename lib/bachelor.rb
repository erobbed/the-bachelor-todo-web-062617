require "pry"

def get_first_name_of_season_winner(data, season)
  season_winner = []
  data.each do |season_number, contestants|
    if season_number == season
      contestants.each do |person|
        person.each do |key, value|
          if key == "status" && person["status"] == "Winner"
            season_winner.push(person["name"])
          end
        end
      end
    end
  end
  season_winner.join.split[0]
end

def get_contestant_name(data, occupation)
  job = []
  data.each do |season_number, contestants|
    contestants.each do |person|
      person.each do |key, value|
        if key == "occupation" && person["occupation"] == occupation
          job.push(person["name"])
        end
      end
    end
  end
  job.join
end

def count_contestants_by_hometown(data, hometown)
  home = []
  data.each do |season_number, contestants|
    contestants.each do |person|
      person.each do |key, value|
        if key == "hometown" && person["hometown"] == hometown
          home.push(person["name"])
        end
      end
    end
  end
  home.count
end

def get_occupation(data, hometown)
  job = []
  data.each do |season_number, contestants|
    contestants.each do |person|
      person.each do |key, value|
        if key == "hometown" && person["hometown"] == hometown
          job.push(person["occupation"])
        end
      end
    end
  end
  job[0]
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |season_number, contestants|
    if season_number == season
      contestants.each do |person|
          ages.push(person["age"])
      end
    end
  end
  int_ages = ages.collect do |age|
    age.to_i
  end
  season_average = (int_ages.reduce(:+) / (int_ages.length.to_f)).round
end
