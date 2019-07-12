require 'spec_helper.rb'

describe "Library"do
  before :all do
    lib_arr = [
      Book.new("JavaScript: The Good Parts", "Douglas Crocford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new("JavaScrip Patterns","Stoyan Stefanov", :development),
      Book.new("Responsive Web Design", "Ethan Marcotte", :design),
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_arr
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        lib.books.length.should == 0

      end
    end

    context "with yaml file name parameter" do
      it "has five books" do
        @lib.books.length == 5
      end
    end
  end

  it "return all the books in given category" do
    @lib.get_books_in_category(:development).length.should == 2
    # @lib.shoud have(0).get_books_in_category :development
  end

  it "accepts new books" do
    @lib.add_book(Book.new("Designing for the Web", "Mark Boulton", :design ))
    @lib.get_book("Designing for the Web").should be_an_instance_of Book
  end
end