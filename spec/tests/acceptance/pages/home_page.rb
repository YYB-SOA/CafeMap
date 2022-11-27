# frozen_string_literal: true

# Page object for home page
class HomePage
  include PageObject

  page_url CafeMap::App.config.APP_HOST

  div(:warning_message, id: 'flash_bar_danger')
  div(:success_message, id: 'flash_bar_success')

  h1(:title_heading, id: 'main_header')
  text_field(:region_input, id: 'region')
  button(:add_button, id: 'repo-form-submit')

  def search_new_region(region)
    self.region_input = region
    add_button
  end
end
