require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self 
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.uniq.size
  end

  def say_species 
    "I am a #{self.species}." 
  end

  def buy_fish(name)
    name = Fish.new(name)
    @pets[:fishes] << name
  end

  #! calling on other classes to make instance
  def buy_cat(name)
    name = Cat.new(name)
    @pets[:cats] << name
  end

  def buy_dog(name)
    name = Dog.new(name)
    @pets[:dogs] << name
  end

  #changing other classes instance methods 
  #need an all method from dogs 
  def walk_dogs 
    #binding.pry
    self.pets[:dogs].each do |dog| #
      dog.mood=("happy")
    end
  end
    #gather all dogs
    #change every dogs mood to happy
    #need the self  
  def play_with_cats 
    self.pets[:cats].each do |cat|
      cat.mood=("happy")
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood=("happy")
    end
  end

  def sell_pets
    self.pets.each do |species_key, pet_array|
      pet_array.each do |pet|
        pet.mood=("nervous")
      end
    end
    self.pets=({:fishes => [], :dogs => [], :cats => []})
  end

  def list_pets
    num_fishes = self.pets[:fishes].size
    num_cats = self.pets[:cats].size
    num_dogs = self.pets[:dogs].size
    "I have #{num_fishes} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end



end