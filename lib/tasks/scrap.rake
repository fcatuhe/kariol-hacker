namespace :scrap do
  desc 'Scrap Swapcard Autonomy API'
  task swapcard_autonomy: :environment do
    url = 'https://api.swapcard.com/graphql/v1/a5744043-2c1a-11e7-bf14-0242ac190003'
    search_terms = ('aa'..'zz').to_a

    search_terms.each do |search_term|
      puts "Processing '#{search_term}'"
      payload = {
        variables: {
          first: 1000,
          id: 'RXZlbnRfMTIwNzg=',
          after: nil,
          filters: [],
          search: search_term
        }
      }
      rest_response = RestClient.post(
        url,
        payload.to_json,
        accept: :json,
        Authorization: "Bearer #{ENV['bearer']}"
      )
      response = JSON.parse rest_response

      total_edges = response.dig('data', 'elements', 'pageInfo', 'totalEdges')
      puts "#{total_edges} elements"
      if total_edges >= 1000
        puts "WARNING: split '#{search_term}' search, more than 1000 elements"
      end
      next_cursor = response.dig('data', 'elements', 'pageInfo', 'nextCursor')

      prospects = response.dig('data', 'elements', 'nodes')
      prospects.each do |prospect|
        swapcard_autonomy = SwapcardAutonomy.find_or_initialize_by(sc_id: prospect['id'])
        swapcard_autonomy.update(
          sc_id: prospect['id'],
          first_name: prospect['firstName'],
          last_name: prospect['lastName'],
          job_title: prospect['jobTitle'],
          second_job_title: prospect['secondJobTitle'],
          photo_thumbnail: prospect['photoThumbnail'],
          biography: prospect['biography'],
          organization: prospect['organization'],
          email: prospect['email'],
          website_url: prospect['websiteUrl'],
          company_name: prospect.dig('company', 'name'),
          swapcard_json: prospect
        )
        print "#{prospect['id']} #{prospect['firstName']} #{prospect['lastName']} - "
      end
      puts "\n\n"
    end
  end
end
