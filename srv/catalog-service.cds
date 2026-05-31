using my.bookshop from '../db/schema';

// service CatalogService {
//   entity Books as projection on bookshop.Books;
//   entity Authors as projection on bookshop.Authors;
// }


service CatalogService {
  entity Books as projection on bookshop.Books;
  entity Authors as projection on bookshop.Authors;
  entity Reviews as projection on bookshop.Reviews;
}