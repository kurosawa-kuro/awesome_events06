module ResponseDebugger
    def print_response_details
      puts ""
      puts "Status: #{response.status}"
      puts "Headers: #{response.headers.select { |k, v| ['Content-Type', 'X-Frame-Options'].include? k }}"
      puts "Request Params: #{response.request.params.inspect}"
  
      if response.body.present?
        puts "Body: #{JSON.pretty_generate(JSON.parse(response.body))}"
      else
        puts "Body: Empty"
      end
    end
end