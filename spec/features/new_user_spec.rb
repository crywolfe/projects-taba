require 'spec_helper'

describe 'visiting the site' do
  describe 'a new user visits the homepage' do
  
    it '' do
      visit('/')
      expect(page).to have_content('Cappy App')
    end

    it 'displays a ' do
      visit(root_path)
      expect(page.has_css?('img[alt='giant rat']')).to be_true
    end

    it 'has a sign up link' do
      visit(root_path)
      click_link 'Sign up'
      expect(page).to have_content 'Please enter your name'
      expect(current_path).to eq '/users/new'
    end

    describe 'creating a user' do

      #given I've entered the correct info
      #when I click on sign up
      #then I should go to the homepage
      #and I should see thanks for signing up.

      describe 'signing up with valid credentials' do
        let(:user) { FactoryGirl.build(:user) }
        it 'takes us to the homepage and says thanks for signing up' do
          # user = User.new(email: 'whatever@whatever.com')
          sign_up(user)
          expect(current_path).to eq root_path
          expect(page).to have_content "Thanks for signing up"
        end
      end

      describe 'signing up without an email' do
        let(:user) { FactoryGirl.build(:invalid_user) }
        it 'takes us to the homepage and says you blew it!' do
          sign_up(user)
          expect(current_path).to eq new_user_path
          expect(page).to have_content 'You did not sign up'
        end
      end
    end
  end
end

def sign_up(user)
  visit(root_path)
  click_link 'Sign up'
  fill_in('Email', {:with => user.email})
  click_button('Sign up!')
end

def login(user)
end
