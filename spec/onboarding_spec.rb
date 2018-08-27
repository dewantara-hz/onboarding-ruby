require 'onboarding'

describe Onboarding do
    context "Testing JSON validator" do

        it "should detect when the content IS json" do
            onboarding = Onboarding.new
            onboarding.url = "https://jsonplaceholder.typicode.com/todos/1"
            content = onboarding.access
            expect(onboarding.is_valid_json(content)).to be true
        end

        it "should detect when the content IS NOT json" do
            onboarding = Onboarding.new
            onboarding.url = "https://www.w3schools.com/xml/note.xml"
            content = onboarding.access
            expect(onboarding.is_valid_json(content)).to be false
        end
    end

    context "Testing XML validator" do

        it "should detect when the content IS xml" do
            onboarding = Onboarding.new
            onboarding.url = "https://www.w3schools.com/xml/note.xml"
            content = onboarding.access
            expect(onboarding.is_valid_xml(content)).to be true
        end

        it "should detect when the content IS NOT xml" do
            onboarding = Onboarding.new
            onboarding.url = "http://google.com/"
            content = onboarding.access
            expect(onboarding.is_valid_xml(content)).to be false
        end
    end

    context "Testing HTML validator" do

        it "should detect when the content IS html" do
            onboarding = Onboarding.new
            onboarding.url = "http://google.com/"
            content = onboarding.access
            expect(onboarding.is_valid_html(content)).to be true
        end

        it "should detect when the content IS NOT html" do
            onboarding = Onboarding.new
            onboarding.url = "https://jsonplaceholder.typicode.com/todos/1"
            content = onboarding.access
            expect(onboarding.is_valid_html(content)).to be false
        end
    end
end