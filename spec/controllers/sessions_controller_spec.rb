require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'create' do
    before :each do
      get :new
      @users = [double(:id => '1', :faculty_id => '25', :faculty_name => 'Keyser John', :email => 'john@tamu.edu', :password => 'password')]
      session[:email] = @users[0].email
      session[:password] = @users[0].password
    end
    it 'should create a session when a professor logs in' do
      @faculty = [double(:id => '25', :faculty_name => 'Keyser John', :permission => 'Admin'), double(:id => '4', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf')]
      post :create, {:session => {:id => '5', :faculty_name => 'Shell Dylan', :faculty_id => '40', :email => 'mm@gmail.com', :password => 'asdf'}}
    end
    it 'should throw an error if no permission is set' do
      @faculty = [double(:id => '4', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf')]
      post :create, {:session => {:id => '5', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf'}}
      response.should redirect_to '/login'
    end
  end
  describe 'destroy' do
    before :each do
      session[:user_id] = '1'
      session[:permission] = 'User'
    end
    it 'should delete the current user and redirect to home' do
      get :destroy
      session[:user_id].should == nil
      response.should redirect_to root_path
    end
  end
end