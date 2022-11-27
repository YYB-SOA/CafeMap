# frozen_string_literal: true

require_relative '../../helpers/acceptance_helper'
require_relative 'pages/home_page'

describe 'Homepage Acceptance Tests' do
  include PageObject::PageFactory

  before do
    DatabaseHelper.wipe_database
    # @headless = Headless.new
    @browser = Watir::Browser.new
  end

  after do
    @browser.close
    # @headless.destroy
  end

  describe 'Visit Home page' do
    it '(HAPPY) should not see projects if none created' do
      # GIVEN: user has no projects
      # WHEN: they visit the home page
      visit HomePage do |page|
        # THEN: they should see basic headers, no projects and a welcome message
        _(page.h1(id: 'main_header').text).must_equal 'CafeMap'
        _(page.text_field(id: 'region').present?).must_equal true
        _(page.button(id: 'repo-form-submit').present?).must_equal true
      end
    end

    it '(HAPPY) should not see cafes they did not request' do
      # GIVEN: a project exists in the database but user has not requested it
      info = CafeMap::CafeNomad::InfoMapper.new(CAFE_TOKEN).load_several
      CafeMap::Repository::For.entity(info).create(info)

      # WHEN: user goes to the homepage
      visit HomePage do |page|
        # THEN: they should not see any projects
        _(page.table(id: 'projects_table').exists?).must_equal false
      end
    end
  end
end
