class Book
  attr_accessor :title, :author, :category
  def initialize(title,author,category)
    @title = title
    @author = author
    @category = category.to_sym
  end
end