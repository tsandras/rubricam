require 'test_helper'

class PersonnagesControllerTest < ActionController::TestCase
  setup do
    @personnage = personnages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personnages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personnage" do
    assert_difference('Personnage.count') do
      post :create, personnage: { per_apparence: @personnage.per_apparence, per_astuce: @personnage.per_astuce, per_background: @personnage.per_background, per_bonus: @personnage.per_bonus, per_charisme: @personnage.per_charisme, per_date_mort: @personnage.per_date_mort, per_date_naissance: @personnage.per_date_naissance, per_description: @personnage.per_description, per_dexterite: @personnage.per_dexterite, per_force: @personnage.per_force, per_intelligence: @personnage.per_intelligence, per_manipulation: @personnage.per_manipulation, per_nom: @personnage.per_nom, per_paradygme: @personnage.per_paradygme, per_perception: @personnage.per_perception, per_points_conscience: @personnage.per_points_conscience, per_points_courage: @personnage.per_points_courage, per_points_dynamique: @personnage.per_points_dynamique, per_points_entropique: @personnage.per_points_entropique, per_points_maitrise: @personnage.per_points_maitrise, per_points_statique: @personnage.per_points_statique, per_prenom: @personnage.per_prenom, per_vigueur: @personnage.per_vigueur, per_volonte: @personnage.per_volonte, per_xps: @personnage.per_xps }
    end

    assert_redirected_to personnage_path(assigns(:personnage))
  end

  test "should show personnage" do
    get :show, id: @personnage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personnage
    assert_response :success
  end

  test "should update personnage" do
    put :update, id: @personnage, personnage: { per_apparence: @personnage.per_apparence, per_astuce: @personnage.per_astuce, per_background: @personnage.per_background, per_bonus: @personnage.per_bonus, per_charisme: @personnage.per_charisme, per_date_mort: @personnage.per_date_mort, per_date_naissance: @personnage.per_date_naissance, per_description: @personnage.per_description, per_dexterite: @personnage.per_dexterite, per_force: @personnage.per_force, per_intelligence: @personnage.per_intelligence, per_manipulation: @personnage.per_manipulation, per_nom: @personnage.per_nom, per_paradygme: @personnage.per_paradygme, per_perception: @personnage.per_perception, per_points_conscience: @personnage.per_points_conscience, per_points_courage: @personnage.per_points_courage, per_points_dynamique: @personnage.per_points_dynamique, per_points_entropique: @personnage.per_points_entropique, per_points_maitrise: @personnage.per_points_maitrise, per_points_statique: @personnage.per_points_statique, per_prenom: @personnage.per_prenom, per_vigueur: @personnage.per_vigueur, per_volonte: @personnage.per_volonte, per_xps: @personnage.per_xps }
    assert_redirected_to personnage_path(assigns(:personnage))
  end

  test "should destroy personnage" do
    assert_difference('Personnage.count', -1) do
      delete :destroy, id: @personnage
    end

    assert_redirected_to personnages_path
  end
end
