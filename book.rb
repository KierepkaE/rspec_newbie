class Book
  def initialize(title,author,category)
    @title = title
    @author = author
    @category = category.to_sym
  end
end