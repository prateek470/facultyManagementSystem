require 'rails_helper'

RSpec.describe ProfessorHomeController, type: :controller do
  before :all do
    User.create(:id => '2', :faculty_name=> 'Shell Dylan', :faculty_id=> '40', :email => 'mm@gmail.com', :password => 'asdf')
    User.create(:id => '3', :faculty_name=> 'Da Silva Dilma', :faculty_id=> '7', :email => 'nn@gmail.com', :password => 'asdf')
  end
  before :each do
    session[:user_id] = '2'
    session[:permission] = 'User'
  end
  describe 'professorhome' do
    it 'should call the method' do
      get :professorhome
    end
  end
  describe 'professoraddpreference' do
    before :each do
      session[:FacultyName] = '40'
      session[:faculty_id] = '40'
    end
    it 'should add bad preferences to database' do
      session[:semester_id] = '1'
      get :professoraddpreference, :unacceptable_ids=>['15','16']
    end
    it 'should add good professor preferences to database' do
      session[:semester_id] = '1'
      get :professoraddpreference, :preferred_ids=>['1', '2', '3']
    end
    it 'should fail if semester is not set' do
      get :professoraddpreference
    end
  end
  describe 'viewpreferences' do
    it 'should redirect to home if no semester set' do
      post :viewpreferences
      response.should redirect_to professorhome_path
    end
    it 'should do nothing if semester is set' do
      session[:semester_id] = '1'
      post :viewpreferences
    end
  end
  describe 'profsetsession' do
    it 'should set the seesion and redirect to home' do
      post :profsetsession, {:class => {:semester_id => '1'}}
      session[:semester_id].should == '1'
      response.should redirect_to professorhome_path
    end
  end
  after :all do
    User.destroy(User.find_by(faculty_name: 'Shell Dylan').id)
    User.destroy(User.find_by(faculty_name: 'Da Silva Dilma').id)
    Preference.delete_all()
    FacultyPreference.delete_all()
    Faculty.where(:faculty_name => 'Bettati Riccardo').update_all(:preference => '')
    Faculty.where(:faculty_name => 'Shell Dylan').update_all(:preference => '')
  end
end