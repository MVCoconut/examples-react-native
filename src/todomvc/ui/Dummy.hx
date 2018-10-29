package todomvc.ui;

import react.native.component.*;

class Data implements coconut.data.Model {
	@:editable var foo:Int = 0;
	@:observable var bar:Int = 0;
	
	@:transition
	function update() {
		foo = foo + 1;
		return {bar: bar + 1}
	}
}

class Dummy extends coconut.ui.View {
	@:attr var data:Data;
	function render() {
		trace('rendering foo=${data.foo} bar=${data.bar}');
		return @hxx '
			<View>
				<Text>${data.foo}</Text>
				<Text>${data.bar}</Text>
			</View>
		';
	}
}