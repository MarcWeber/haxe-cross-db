import xx.Cont;
import xx.ContinuationM;
import xx.db.ConnectionInterface;

class Mock implements ConnectionInterface {

  public function new() {
  }

  public function request(s: String): Cont<CVoid>{
    return ContinuationM.ret(null);
  }

  public function queryRows(s: String):Cont<Array<Map<String,Dynamic>>> {
    throw "not implemented";
  }
  public function queryFirstCol(s: String): Cont<Array<Dynamic>> {
    throw "not implemented";
  }
  public function queryValue(s: String): Cont<Dynamic>{
    throw "not implemented";
  }

  public function quote( s : String ) : String {
    return s;
  }

  public function quote_name( s : String ) : String {
    return s;
  }

  public function lastInsertId():Cont<Int> {
    return ContinuationM.ret(10);
  }
}

class Test {
  static function main() {
    var c: ConnectionInterface = new Mock();

    ContinuationM.dO({
        a <= c.request("abc");
        b <= c.lastInsertId();
        return b;
    })(function(r){
      trace(r());
    });
  }
}
