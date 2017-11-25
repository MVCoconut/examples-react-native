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
	override function render() {
		return new TodoListView({filter: new TodoFilter(), todos: new TodoList()}).reactify();
	}
}