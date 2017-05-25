package;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.native.api.*;
import react.native.component.View as ReactNativeView;
import react.native.component.Text as ReactNativeText;
import coconut.react.Dom.*;
import coconut.react.Wrapper;
import coconut.ui.View as CoconutView;

class Main {
	
	public static var styles = StyleSheet.create({
		container: {
			flex: 1,
			justifyContent: 'center',
			alignItems: 'center',
			backgroundColor: '#F5FCFF',
		},
		text: {
			fontSize: 20,
			textAlign: 'center',
			margin: 10,
		},
	});
	
	static function main() {
		
	}
}

@:expose('App')
class App extends ReactComponent {
	override function render() {
		return jsx('<Wrapper view=${new MainView({})} />');
	}
}

class MainView extends CoconutView<{}> {
	@:state var counter:Int = 0;
	
	function render() {
		return node(ReactNativeView, {style: Main.styles.container} , [
			node(ReactNativeText, {style: Main.styles.text}, ['Hello! $counter'])
		]);
	}
	
	override function init() {
		var timer = new haxe.Timer(500);
		timer.run = function() counter = counter + 1;
	}
}