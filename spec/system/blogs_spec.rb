require 'rails_helper'
RSpec.describe 'Blogs', type: :system do
  example 'index' do
    visit blogs_path
  end

  example 'new' do
    visit new_blog_path

    fill_in 'blog[name]', with: 'test'

    click_button 'Create Blog'
  end
end