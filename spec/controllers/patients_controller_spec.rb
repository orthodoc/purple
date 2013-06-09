require 'spec_helper'

describe PatientsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @patient = FactoryGirl.create(:patient)
  end

  context "for a secretary" do
    before(:each) do
      @user.add_role :secretary
      sign_in @user
      get :new
      @patient = FactoryGirl.build(:patient)
    end

    it { should route(:get, "/patients/new").to(action: :new) }
    it { should respond_with(:success) }
  end

  context "for a user" do
    before(:each) do
      sign_out @user
      get :new
      @patient = FactoryGirl.build(:patient)
    end

    it { should redirect_to(root_path) }
    it { should set_the_flash[:alert].to("You are not permitted to do this!") }
    it { should_not render_template(:new) }
  end

  context "for a admin" do
    before(:each) do
      @user.add_role :admin
      sign_in @user
      get :new
      @patient = FactoryGirl.build(:patient)
    end

    it { should route(:get, "/patients/new").to(action: :new) }
    it { should respond_with(:success) }
  end

end
