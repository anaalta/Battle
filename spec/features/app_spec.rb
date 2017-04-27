require './app.rb'
require 'capybara'

describe Battle do


 it 'expects names of the players to be displayed' do
   visit ('/')
   fill_in('player1', :with => "Paul")
   fill_in('player2', :with => "John")
   click_button('Submit')
   expect(page).to have_content("Paul vs. John")
 end

end
