package db;
import mw.Continuation;

// minimal interface required to run the db operations {{{1
// TODO move into its own module?
interface ConnectionInterface {
  // result might throw an exception
  // function request(s : String): Cont<mw.db.ResultSetInterface>;

  // shortcuts:
  function request(s: String): Cont<Void>; // insert / delete / .., no result expected.


  function queryRows(s: String): Cont<Array<Map<String,Dynamic>>>;
  function queryFirstCol(s: String): Cont<Array<Dynamic>>;
  function queryValue(s: String): Cont<Dynamic>;

  function quote( s : String ) : String;
  function quote_name( s : String ) : String;

  // result might throw an exception
  function lastInsertId():Cont<Int>;
}
