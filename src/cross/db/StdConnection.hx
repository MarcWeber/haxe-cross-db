package cross.db;

// ConnectionInterface based on std.* for non js backends
class StdConnection {

  public var connection: sys.
  public function new(arg) {
  }
  function request(s: String){
  }

  function queryRows(s: String): Cont<Array<Map<String,Dynamic>>> {
    //TODO
  }
  function queryFirstCol(s: String): Cont<Array<Dynamic>>{
    // TODO
  }
  function queryValue(s: String): Cont<Dynamic>{
    // TODO
  }

  function quote( s : String ) : String{
    // TODO
  }
  function quote_name( s : String ) : String {
    // TODO
  }

  // result might throw an exception
  function lastInsertId():Cont<Int>{
    // TODO
  }
}
