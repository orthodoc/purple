require 'spec_helper'

describe PatientsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @patient = FactoryGirl.create(:patient)
  end

  %w(admin secretary).each do |role|

    context "for #{role}" do
      before (:each) do
        if role == "admin"
          @user.add_role :admin
        elsif role == "secretary"
          @user.add_role :secretary
        end
        sign_in @user
        get :index
      end

      it { should route(:get, patients_path).to(action: :index) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }

    end
  end

  context "for a user" do
    before (:each) do
      sign_out @user
      get :index
    end

    it { should redirect_to(root_path) }
    it { should_not render_template(:index) }
    it { should set_the_flash[:alert].to("You are not permitted to do this!") }
  end

  %w(admin secretary).each do |role|

    context "for #{role}" do
      before(:each) do
        if role == "admin"
          @user.add_role :admin
        elsif role == "secretary"
          @user.add_role :secretary
        end
        sign_in @user
        get :new
        @patient = FactoryGirl.build(:patient)
      end

      it { should route(:get, "/patients/new").to(action: :new) }
      it { should respond_with(:success) }
    end

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

end
