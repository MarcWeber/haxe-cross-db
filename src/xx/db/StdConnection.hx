package xx.db;
using Lambda;

// ConnectionInterface based on sys.db.Connection for non js backends
// TODO: optimize for PHP
class StdConnection implements xx.db.ConnectionInterface {

  public var connection: sys.db.Connection;

  public function new(c) {
    this.connection = c;
  }

  public function request(sql: String){
    return xx.ContUtil.cont({
      this.connection.request(sql);
      null;
    });
  }

  public function queryRows(sql: String): Cont<Array<Dynamic>> {
    return xx.ContUtil.cont({
      var r = this.connection.request(sql);
      r.results().array();
    });
  }

  public function queryFirstCol(sql: String): Cont<Array<Dynamic>>{
    return xx.ContUtil.cont({
      var r = this.connection.request(sql);
      var first = r.getFieldsNames()[0];
      r.results().map(function(x){ Reflect.field(x, first); }).array();
    });
  }
  public function queryValue(sql: String): Cont<Dynamic>{
    return xx.ContUtil.cont({
      var r = this.connection.request(sql);
      var first = r.getFieldsNames()[0];
      r.results().map(function(x){ Reflect.field(x, first); });
    });
  }

  public function quote( name : String ) : String{
    return this.connection.quote(name);
  }
  public function quote_name( name : String ) : String {
    return name;
  }

  // result might throw an exception
  public function lastInsertId():Cont<Int>{
    return xx.ContUtil.cont({
      this.connection.lastInsertId();
    });
  }
}
