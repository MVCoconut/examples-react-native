package;

import react.ReactComponent;
import react.native.api.*;
import todomvc.data.*;
import todomvc.ui.*;

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
		#if web
			AppRegistry.registerComponent('MyApp', function() return App);
			AppRegistry.runApplication('MyApp', { rootTag: js.Browser.document.getElementById('react-root') });
		#end
	}
}

@:expose('App')
class App extends ReactComponent {
	var data = new todomvc.ui.Dummy.Data();
	override function render() {
		return new Dummy({data: data}).reactify();
		// return new TodoListView({filter: new TodoFilter(), todos: new TodoList()}).reactify(); 
	}
	override function componentDidMount() {
		haxe.Timer.delay(data.update, 100);
	}
}