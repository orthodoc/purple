require "spec_helper"

describe PatientsController do

  describe "routing" do

    it "routes to #index" do
      get("/patients").should route_to("patients#index")
    end

    it "routes to #new" do
      get("/patients/new").should route_to("patients#new")
    end

    it "routes to #create" do
      post("/patients").should route_to("patients#create")
    end

  end

end
