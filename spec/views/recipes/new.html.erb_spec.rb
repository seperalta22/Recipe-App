# spec/views/recipes/new.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'recipes/new.html.erb', type: :view do
  before do
    assign(:recipe, Recipe.new)
    render
  end

  it 'displays the Create Recipe form' do
    expect(rendered).to have_selector('h1', text: 'Create Recipe')

    expect(rendered).to have_selector('form[action="/recipes"][method="post"]') do
      expect(rendered).to have_selector('label[for="recipe_name"]', text: /Name/i)
      expect(rendered).to have_selector('input[type="text"][id="recipe_name"]')

      expect(rendered).to have_selector('label[for="recipe_preparation_time"]', text: /Preparation Time/i)
      expect(rendered).to have_selector('input[type="number"][id="recipe_preparation_time"]')

      expect(rendered).to have_selector('label[for="recipe_cooking_time"]', text: /Cooking Time/i)
      expect(rendered).to have_selector('input[type="number"][id="recipe_cooking_time"]')

      expect(rendered).to have_selector('label[for="recipe_description"]', text: /Description/i)
      expect(rendered).to have_selector('textarea[id="recipe_description"]')

      expect(rendered).to have_selector('input[type="submit"][value="Create"]')
    end
  end
end
