namespace :send do
  desc 'Send connection request Swapcard Autonomy API'
  task swapcard_autonomy: :environment do
    url = 'https://api.swapcard.com/graphql/v1/ae0064dd-35a5-11e7-addb-0242ac1f0003'

    prospects = ('aa'..'zz').to_a

    prospects.each do |prospect|
      puts "Sending to #{prospect}"
      payload = {
        variables: {
          to: 'TODO',
          messageData: {
            textMessage: "TODO",
            channel: 'ASK_CONNECTION'
          }
        }
      }
      rest_response = RestClient.post(
        url,
        payload.to_json,
        accept: :json,
        Authorization: "Bearer #{ENV['BEARER']}"
      )
      response = JSON.parse rest_response
      puts response
    end
  end
end
