require_relative "./book_store"

class BookStoreRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;

    # Returns an array of BookStore objects.
    sql = "SELECT id, title, author_name FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])

    books = []

    result_set.each do |record|
      book = BookStore.new
      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']
      
      books << book
    end
    return books
  end
end