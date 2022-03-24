//This contract uses MIT license standard
//SPDX-License-Identifier:MIT

//Using solidity version in the range of 0.8.0
pragma solidity ^0.8.0;

//This smart contract keeps a simple bookshelf whereby the user can store books using the book_name,
//author_name and assigned book_id
//The user can also query the bookshelf using the assigned bookid or book_name

//Defining a contact Storage
contract my_simple_bookshelf {
    struct book {
        string book_name;
        string author_name;
        uint256 book_id;
    }
    book book_struct;

    mapping(string => book) mapped_book_to_array;
    book[] your_book_array;

    function book_storage(
        string memory b_n,
        string memory a_name,
        uint256 b_id
    ) public {
        book_struct = book(b_n, a_name, b_id);
        your_book_array.push(book_struct);

        mapped_book_to_array[b_n] = book_struct;
    }

    function auto_search_with_name_of_book(string memory b_name)
        public
        view
        returns (book memory)
    {
        return (mapped_book_to_array[b_name]);
    }

    function getBookinfoUsingId(uint256 bk_id)
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        book memory bookie = your_book_array[bk_id - 1];
        return (bookie.book_name, bookie.author_name, bookie.book_id);
    }
}
