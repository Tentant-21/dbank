import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  /*Variable*/
  stable var currenValue : Float = 300;
  currenValue := 300;
    Debug.print(debug_show (currenValue));


  var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  /*Constant*/
  let id = 1728397946131973;

  // Debug.print(debug_show(id));

  // Crear una funcion puede ser usada unicamente dentro del "Actor" que estemos utilizando. Para poder usar la funcion fuera de este necesitariamos crearla como publica, colocando "public", antes del nombre de la funcion
  public func topUp(amount : Float) {
    currenValue += amount;
    Debug.print(debug_show (currenValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currenValue - amount;
    if (tempValue >= 0) {
      currenValue -= amount;
      Debug.print(debug_show (currenValue));
    } else {
      Debug.print("Amount too large, currenValue less than zero.");
    };
  };

  public query func checkBalance() : async Float {
    return currenValue;
  };

  //Interés compuesto function
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currenValue := currenValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

};

