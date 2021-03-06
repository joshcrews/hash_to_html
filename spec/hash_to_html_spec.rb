require 'spec_helper'

describe Hash do

  describe "to_html" do

    context "non-nested hash" do

      it "should create a single ul" do
        sample_hash = {:name => 'Josh', :book => 'Bible'}
        result = "<ul>\n<li>Name: Josh</li>\n<li>Book: Bible</li>\n</ul>\n"
        sample_hash.to_html.should == result
      end
      
    end

    context "single nesting hash" do

      it "should create a couple nested ul" do
        sample_hash = {
          :name => 'Biology', 
          :teachers => {:primary => 'Mr. Henderson', :assistant => 'Mr. Davis'}, 
          :schedule => {:monday => "11am", :wednesday => "1pm"}
        }
        result = "<ul>\n<li>Name: Biology</li>\n<li>Teachers: <ul>\n<li>Primary: Mr. Henderson</li>\n<li>Assistant: Mr. Davis</li>\n</ul>\n</li>\n<li>Schedule: <ul>\n<li>Monday: 11am</li>\n<li>Wednesday: 1pm</li>\n</ul>\n</li>\n</ul>\n"
        sample_hash.to_html.should == result
      end

    end

    context "double nesting hash" do

      it "should create some double nested ul's" do
        sample_hash = {
          :name => 'Biology', 
          :teachers => {
            :primary => {
              :name => 'Mr. Henderson',
              :title => 'Senior Professor'
            }, 
            :assistant => {
              :name => 'Mr. Davis',
              :title => 'Graduate Assistant'
            },
          }, 
          :schedule => {:monday => "11am", :wednesday => "1pm"}
        }
        result = "<ul>\n<li>Name: Biology</li>\n<li>Teachers: <ul>\n<li>Primary: <ul>\n<li>Name: Mr. Henderson</li>\n<li>Title: Senior Professor</li>\n</ul>\n</li>\n<li>Assistant: <ul>\n<li>Name: Mr. Davis</li>\n<li>Title: Graduate Assistant</li>\n</ul>\n</li>\n</ul>\n</li>\n<li>Schedule: <ul>\n<li>Monday: 11am</li>\n<li>Wednesday: 1pm</li>\n</ul>\n</li>\n</ul>\n"
        sample_hash.to_html.should == result
      end

    end

  end
  
end