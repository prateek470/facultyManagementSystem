require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'creating new user' do
    it 'should call new' do
      get :new, {:user => {:id => '5', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf'}}
    end
    it 'should add the user to the user database' do
      post :create, {:user => {:id => '5', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf'}}
      response.should redirect_to login_path
      User.destroy(User.find_by(faculty_name: 'Shell Dylan').id)
    end
    it 'should redirect to sign_up as user information is incomplete' do
      post :create, {:user => {:id => '6', :faculty_name=> 'Davis Tim', :faculty_id=>'9'}}
      response.should redirect_to signup_path
    end
    it 'should have the user already in the user database' do
      post :create, {:user => {:id => '3', :faculty_name=> 'Keyser John', :faculty_id=> '25', :email => 'john@tamu.edu', :password => 'asdf'}}
      response.should redirect_to signup_path
    end
  end
end