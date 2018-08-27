# Listing dependency
require 'nokogiri'
require 'net/http'
require 'json'

# The main onboarding driver
#
# This class is a simple response validator to determine whether response is valid json, xml, or html
#
class Onboarding
    attr_accessor :url

    # Create the object with default url to localhost
    #
    # Arguments: 
    #   url: (String)
    # 
    def initialize(url = 'localhost')
        @url = url
    end

    # Access the url
    #
    # Example:
    #   >> Onboarding.access
    #   => {}
    # 
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

    # Check whether the string is valid json
    #
    # Example:
    #   >> Onboarding.is_valid_json({})
    #   => true
    #
    # Arguments:
    #   json: (String)
    #
    def is_valid_json(json)
        JSON.parse(json)
        return true
    rescue JSON::ParserError => e
        return false
    end

    # Check whether the string is valid xml
    #
    # Example:
    #   >> Onboarding.is_valid_xml({})
    #   => false
    #
    # Arguments:
    #   xml: (String)
    #
    def is_valid_xml(xml)
        return Nokogiri::XML(xml).errors.empty?
    end

    # Check whether the string is valid html
    #
    # Example:
    #   >> Onboarding.is_valid_json(<html></html>)
    #   => true
    #
    # Arguments:
    #   html: (String)
    #
    def is_valid_html(html)
        if html.include? "</html>"
            return !is_valid_json(html) && !is_valid_xml(html)
        else
            return false    
        end
    end

    
end