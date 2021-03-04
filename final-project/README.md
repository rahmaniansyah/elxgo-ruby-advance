# final-project app

How to run :

```
bundle install
```

How to run rspec :
- Make sure you in the root folder

```
#example
#final-project-app/

#then run

rspec spec/

```
or you can show it with message

```
rspec -f d spec/
```
------------------

**What this app can do?**
- it is an application for library wich store book and do some command

To start the app
first run:
```
ruby main.rb
```
then some example of command when running the app
```
build_library|2|1|3
Shelf 1 with 1 rows and 3 columns is added
Shelf 2 with 1 rows and 3 columns is added

put_book|9780747532743|Harry Potter 1|J. K. Rowling
Allocated address: 010101

put_book|9780807281918|Harry Potter 2|J. K. Rowling
Allocated address: 010102

put_book|9780545582933|Harry Potter 3|J. K. Rowling
Allocated address: 010103

put_book|9780132350884|Clean Code|Robert Cecil Martin 
Allocated address: 020101
 
put_book|9780201485677|Refactoring|Martin Fowler, Kent Beck
Allocated address: 020102

take_book_from|020102
Slot 020102 is free

take_book_from|010102
Slot 010102 is free

put_book|9780132350884|Clean Code|Robert Cecil Martin
Allocated address: 020103

put_book|9780807281918|Harry Potter 2|J. K. Rowling
Allocated address: 010102

put_book|9780321146533|TDD: By Example|Kent Beck
Allocated address: 020102

take_book_from|999999
Invalid code!

find_book|9780807281918
Found the book at 020102

find_book|000
Book not found!

put_book|9780739330944|Eragon 1|Christopher Paolini
All shelves are full!

list_books
010101: 9780747532743 | Harry Potter 1 | J. K. Rowling
010102: 9780132350884 | Clean Code | Robert Cecil Martin
010103: 9780739330944 | Eragon 1 | Christopher Paolini
020101: 9780545582933 | Harry Potter 3 | J. K. Rowling
020102: 9780807281918 | Harry Potter 2 | J. K. Rowling
020103: 9780201485677 | Refactoring | Martin Fowler, Kent Beck

search_books_by_title|Harry Potter
010101: 9780747532743 | Harry Potter 1 | J. K. Rowling
020101: 9780545582933 | Harry Potter 3 | J. K. Rowling
020102: 9780807281918 | Harry Potter 2 | J. K. Rowling

search_books_by_author|Kent Beck
020103: 9780201485677 | Refactoring | Martin Fowler, Kent Beck

search_books_by_author|Tolkienfalse
Book not found!
```
When you want to stop the program
```
exit
```

