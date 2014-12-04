require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrganisationsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Organisation. As you add validations to Organisation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrganisationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all organisations as @organisations" do
      organisation = Organisation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:organisations)).to eq([organisation])
    end
  end

  describe "GET show" do
    it "assigns the requested organisation as @organisation" do
      organisation = Organisation.create! valid_attributes
      get :show, {:id => organisation.to_param}, valid_session
      expect(assigns(:organisation)).to eq(organisation)
    end
  end

  describe "GET new" do
    it "assigns a new organisation as @organisation" do
      get :new, {}, valid_session
      expect(assigns(:organisation)).to be_a_new(Organisation)
    end
  end

  describe "GET edit" do
    it "assigns the requested organisation as @organisation" do
      organisation = Organisation.create! valid_attributes
      get :edit, {:id => organisation.to_param}, valid_session
      expect(assigns(:organisation)).to eq(organisation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Organisation" do
        expect {
          post :create, {:organisation => valid_attributes}, valid_session
        }.to change(Organisation, :count).by(1)
      end

      it "assigns a newly created organisation as @organisation" do
        post :create, {:organisation => valid_attributes}, valid_session
        expect(assigns(:organisation)).to be_a(Organisation)
        expect(assigns(:organisation)).to be_persisted
      end

      it "redirects to the created organisation" do
        post :create, {:organisation => valid_attributes}, valid_session
        expect(response).to redirect_to(Organisation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organisation as @organisation" do
        post :create, {:organisation => invalid_attributes}, valid_session
        expect(assigns(:organisation)).to be_a_new(Organisation)
      end

      it "re-renders the 'new' template" do
        post :create, {:organisation => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested organisation" do
        organisation = Organisation.create! valid_attributes
        put :update, {:id => organisation.to_param, :organisation => new_attributes}, valid_session
        organisation.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested organisation as @organisation" do
        organisation = Organisation.create! valid_attributes
        put :update, {:id => organisation.to_param, :organisation => valid_attributes}, valid_session
        expect(assigns(:organisation)).to eq(organisation)
      end

      it "redirects to the organisation" do
        organisation = Organisation.create! valid_attributes
        put :update, {:id => organisation.to_param, :organisation => valid_attributes}, valid_session
        expect(response).to redirect_to(organisation)
      end
    end

    describe "with invalid params" do
      it "assigns the organisation as @organisation" do
        organisation = Organisation.create! valid_attributes
        put :update, {:id => organisation.to_param, :organisation => invalid_attributes}, valid_session
        expect(assigns(:organisation)).to eq(organisation)
      end

      it "re-renders the 'edit' template" do
        organisation = Organisation.create! valid_attributes
        put :update, {:id => organisation.to_param, :organisation => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested organisation" do
      organisation = Organisation.create! valid_attributes
      expect {
        delete :destroy, {:id => organisation.to_param}, valid_session
      }.to change(Organisation, :count).by(-1)
    end

    it "redirects to the organisations list" do
      organisation = Organisation.create! valid_attributes
      delete :destroy, {:id => organisation.to_param}, valid_session
      expect(response).to redirect_to(organisations_url)
    end
  end

end
