#!/usr/bin/env ruby

# Put your imports here
require_relative "ice_cream"
require_relative "daimstrut"
require_relative "ben&jerry"

# Extend the String class with int-checking capabilities
class String
  # This is not _exactly_ true, this checks if the current string is an int >= 0
  def is_an_int?
    !/\A\d+\z/.match(self).nil?
  end
end

# Keep storeware classnames in this array!
@wares = [
  IceCream,
  Daimstrut,
  BenAndJerry
]

@in_store_wares = []

@all_wares = []



def print_menu
  puts "\nMenu"
  puts "#--------------------------"
  puts "1. View in-store wares"
  puts "2. Add a ware to the store"
  puts "3. Sell"
  puts "4. View sold wares"
  puts "0. Exit"
end

def print_wares
  if @in_store_wares.empty?
    puts "No wares in store!"
    return
  end

  storewares = {}
  @in_store_wares.each do |ware|
    ware_name = ware.class.to_s

    unless storewares[ware_name].nil?
      storewares[ware_name].push(ware)
    else
      storewares[ware_name] = [ware]
    end
  end

  puts "There are:"
  storewares.each do |key, value|
    puts "#{value.length} #{key}"
  end

  puts "currently in store"
end

def add_to_inventory
  puts "Please select a ware to add:"
  i = 0
  while i < @wares.length
    ware = @wares[i]

    i += 1
    puts "#{i}. #{ware} (retails for #{ware.price})"
  end

  print "\nChoose one: "
  choice = gets.chomp!

  if !choice.is_an_int? || choice.to_i > @wares.length
    puts "Unknown menu selection: #{choice}"
    puts "Nothing added"
    return
  end

  case choice.to_i
  when 0
    puts "Cancelled"
    return
  when 1..@wares.length # .. range
    # Create an instance of the chosen ware
    classname = @wares[choice.to_i - 1]
    ware = classname.new

    # Add it to the in-store wares
    @in_store_wares.push(ware)
    @all_wares.push(ware)
  end
end

def sell_ware
  unless @wares.empty?
    # TODO: Implement
    puts "Please select a ware to sell:"

    i = 0
    while i < @in_store_wares.length
      ware = @in_store_wares[i]

      i += 1
      puts "#{i}. #{ware} (retails for #{ware.price})"
    end

    print "\nChoose one: "
    choice = gets.chomp!

    if !choice.is_an_int? || choice.to_i > @in_store_wares.length
      puts "Unknown menu selection: #{choice}"
      puts "Nothing sold"
      return
    end

    case choice.to_i
    when 0
      puts "Cancelled"
      return
    when 1..@in_store_wares.length
      classname = @wares[0]
      @wares.each_with_index do |element, index|
        if @in_store_wares[choice.to_i - 1] == @wares[index]
          classname = @wares[index]
        end
      end

      ware = classname.new
      ware.sell()
      @all_wares.push(ware)

      @in_store_wares.delete_at(choice.to_i - 1)
    end


  else
    puts "There are no wares to sell! :O"
  end
end

def print_sold_wares
    # TODO: Implement
  sold = false

  @all_wares.each do |ware|
    sold = true if ware.is_sold?
  end

  if sold
    puts "Here are the wares we've sold thus far:"

    @all_wares.each do |ware|
      puts ware if ware.is_sold?
    end

  else
    puts "We haven't sold anything yet!"
  end
end

puts "Welcome to the Super Awesome™ checkout system!"

# Program main loop
loop do
  print_menu()
  print "\nChoose one: "
  option = gets.chomp!

  # Output an empty line, because... well it's pretty! ^^'
  puts

  # If the user put in something else than an integer...
  unless option.is_an_int?
    puts "Menu option must be an integer! Please try again"
    redo
  end

  case option.to_i
  when 0
    puts "Bye!"
    break
  when 1
    print_wares()
  when 2
    add_to_inventory()
  when 3
    sell_ware()
  when 4
    print_sold_wares()
  end
end
