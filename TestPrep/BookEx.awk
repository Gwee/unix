#!/usr/bin/awk -f
function get_books_from_author(author,bookArray) {
    while (getline < "books.txt") {
        split($0,bookArray,":")
        if ( bookArray[3] == author ){
                print $0 > "books_output"
            }
        }

    }
function check_if_book_exists(id,bookArray){
    flag="true"
    while (getline < "check_books") {
        split($0,bookArray,":")
        if(id==bookArray[1] && bookArray[5]=="-"){
            if (bookArray[4]=="-"){
                
                flag="true"
            }else{
                
                flag="false"
            }
        }
    }
    close("check_books")
    return flag
}
BEGIN	{
    author=ARGV[1]
    get_books_from_author(author)
    system("sort -u books_output > check_books")
    while (getline < "books_output") {
        split($0,bookArray,":")
        id=bookArray[1];book=bookArray[2]
        if (check_if_book_exists(id)=="true"){
        print book
        }
    }

}
