package;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.native.api.*;
import react.native.component.View as ReactNativeView;
import react.native.component.Text as ReactNativeText;
import react.native.component.ListView;
import coconut.ui.View as CoconutView;
import coconut.Ui.hxx;
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
		todomvc.ui.TodoItemView;
	}
}

@:expose('App')
class App extends ReactComponent {
	override function render() {
		return new TodoListView({filter: new TodoFilter(), todos: new TodoList()}).reactify();
	}
}