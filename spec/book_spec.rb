require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new "Title", "Author", :category
  end
  describe "#new" do
    it "return a new book object" do
      @book.should be_an_instance_of Book
    end

    it "throws an ArgumentError when given fewer than 3 parameters" do
      lambda{Book.new "Title", "Author"}.should raise_exception ArgumentError

    end
  end
end

