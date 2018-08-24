# Listing dependency
require 'nokogiri'
require 'net/http'
require 'json'

class Onboarding
    attr_accessor :url

    # Create the object
    def initialize(url = 'localhost')
        @url = url
    end

    def access
        # Cast to uri
        uri = URI(@url)

        # Test the connection
        r = Net::HTTP.get_response(uri)

        #if response is 301, try to access the redirect uri
        if r.code == "301"
            uri = URI.parse(r.header['location'])
            r = Net::HTTP.get_response(uri)
        end

        # Get the content
        content = Net::HTTP.get(uri)

        # Print the content
        return content
    end

    def is_valid_json(json)
        JSON.parse(json)
        return true
    rescue JSON::ParserError => e
        return false
    end

    def is_valid_xml(xml)
        return Nokogiri::XML(xml).errors.empty?
    end

    def is_valid_html(html)
        if html.include? "</html>"
            # return Nokogiri::HTML(html).errors.empty?
            return !is_valid_json(html) && !is_valid_xml(html)
        else
            return false    
        end
    end

    
end