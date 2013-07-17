/****
* 
****/

package wighawag.console;

import flash.text.TextField;
import flash.display.Sprite;
import flash.ui.Keyboard;
import flash.events.KeyboardEvent;
import flash.display.Stage;

class WConsole {

    private var stage : Stage;
    private var view : ConsoleView;

    public function new() {
        stage = flash.Lib.current.stage;
        view= new ConsoleView();
        connect();
    }

    public function connect() : Void{
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    public function disconnect() : Void{
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    public function dispose() : Void{
        disconnect();
    }

    private function onKeyDown(event : KeyboardEvent) : Void{
        if(event.keyCode == Keyboard.TAB){
            switchVisibility();
        }
    }

    public function switchVisibility() : Void{
        if(view.stage == null){
            stage.addChild(view);
        }else{
            stage.removeChild(view);
        }
    }

    public function hide() : Void{
        if(view.stage != null){
            stage.removeChild(view);
        }
    }

    public function print(message : String) : Void{
        view.print(message);
    }


    public function show(?message : String) : Void{
        if(message != null){
            print(message);
        }
        if(view.stage == null){
            stage.addChild(view);
        }else{
            stage.swapChildrenAt(stage.getChildIndex(view), stage.numChildren - 1);
        }
    }
    
}


class ConsoleView extends Sprite{

    private var log : TextField;

    public function new() {
        super();
        log = new TextField();
        addChild(log);
    }

    public function print(message : String) : Void{
        log.appendText(message + "\n");
    }


}