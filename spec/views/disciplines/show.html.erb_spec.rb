require 'rails_helper'

RSpec.describe "disciplines/show", :type => :view do
  before(:each) do
    @discipline = assign(:discipline, Discipline.create!(
      :nom => "Nom",
      :description => "MyText",
      :niveau => 1,
      :nom_discipline => "Nom Discipline"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Nom Discipline/)
  end
end
