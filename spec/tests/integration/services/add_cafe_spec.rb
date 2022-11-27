# frozen_string_literal: true

# require_relative '../../../helpers/spec_helper'
# require_relative '../../../helpers/vcr_helper'
# require_relative '../../../helpers/database_helper'

# describe 'AddCafe Service Integration Test' do
#   VcrHelper.setup_vcr

#   before do
#     VcrHelper.configure_vcr_for_cafe(recording: :none)
#   end

#   after do
#     VcrHelper.eject_vcr
#   end

#   describe 'Retrieve and store cafe' do
#     before do
#       DatabaseHelper.wipe_database
#     end

    # it 'HAPPY: should be able to find and save cafe data to database' do
    #   # GIVEN: a valid url request for an cafe:
    #   info = CafeMap::CafeNomad::InfoMapper.new(CAFE_TOKEN).load_several
    #   city_request = CafeMap::Forms::NewCity.new.call(city_name: KEYWORD_FILTER)
      #   puts city_request
      #   puts city_request.success?
      #   puts city_request[:city_name]
      # WHEN: the service is called with the request form object
    #   info_made = CafeMap::Service::AddCafe.new.call(city_request)
    #   puts info_made

      # THEN: the result should report success..
    #   _(info_made.success?).must_equal true

      # ..and provide a info entity with the right details
      #   rebuilt = info_made.value!

      #   _(rebuilt.origin_id).must_equal(project.origin_id)


    # end

    # it 'HAPPY: should find and return existing project in database' do
    #   # GIVEN: a valid url request for a project already in the database:
    #   url_request = CodePraise::Forms::NewProject.new.call(remote_url: GH_URL)
    #   db_project = CodePraise::Service::AddProject.new.call(url_request).value!

    #   # WHEN: the service is called with the request form object
    #   project_made = CodePraise::Service::AddProject.new.call(url_request)

    #   # THEN: the result should report success..
    #   _(project_made.success?).must_equal true

    #   # ..and find the same project that was already in the database
    #   rebuilt = project_made.value!
    #   _(rebuilt.id).must_equal(db_project.id)

    #   # ..and provide a project entity with the right details
    #   _(rebuilt.origin_id).must_equal(db_project.origin_id)
    #   _(rebuilt.name).must_equal(db_project.name)
    #   _(rebuilt.size).must_equal(db_project.size)
    #   _(rebuilt.ssh_url).must_equal(db_project.ssh_url)
    #   _(rebuilt.http_url).must_equal(db_project.http_url)
    #   _(rebuilt.contributors.count).must_equal(db_project.contributors.count)

    #   db_project.contributors.each do |member|
    #     found = rebuilt.contributors.find do |potential|
    #       potential.origin_id == member.origin_id
    #     end

    #     _(found.username).must_equal member.username
    #     # not checking email as it is not always provided
    #   end
    # end

    # it 'BAD: should gracefully fail for invalid project url' do
    #   # GIVEN: an invalid url request is formed
    #   BAD_GH_URL = 'http://github.com/foobar'
    #   url_request = CodePraise::Forms::NewProject.new.call(remote_url: BAD_GH_URL)

    #   # WHEN: the service is called with the request form object
    #   project_made = CodePraise::Service::AddProject.new.call(url_request)

    #   # THEN: the service should report failure with an error message
    #   _(project_made.success?).must_equal false
    #   _(project_made.failure.downcase).must_include 'invalid'
    # end

    # it 'SAD: should gracefully fail for invalid project url' do
    #   # GIVEN: an invalid url request is formed
    #   SAD_GH_URL = 'http://github.com/wfkah4389/foobarsdhkfw2'
    #   url_request = CodePraise::Forms::NewProject.new.call(remote_url: SAD_GH_URL)

    #   # WHEN: the service is called with the request form object
    #   project_made = CodePraise::Service::AddProject.new.call(url_request)

    #   # THEN: the service should report failure with an error message
    #   _(project_made.success?).must_equal false
    #   _(project_made.failure.downcase).must_include 'could not find'
    # end
#   end
# end