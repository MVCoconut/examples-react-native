package;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.native.api.*;
import react.native.component.*;
import coconut.Ui.*;

using tink.CoreApi;

class Main {
	static function main() {
		#if web
			AppRegistry.registerComponent('MyApp', function() return App);
			AppRegistry.runApplication('MyApp', { rootTag: js.Browser.document.getElementById('react-root') });
		#end
	}
}

@:expose('App')
class App extends ReactComponent {
	
	var data = {
		var state = new tink.state.State(null);
		haxe.Timer.delay(function() state.set(None), 2000);
		new Data({profile: state});
	}
	
	override function render() {
		return new MainView({data: data}).reactify();
	}
}

class Data implements coconut.data.Model {
	@:external var profile:Option<String>;
}

class MainView extends coconut.ui.View<{data:Data}> {
	function render() '
		<View style=${{flex:1}}>
			<switch ${data.profile}>
				<case ${null}>
					<LoadingScreen/>
				<case ${None}>
					<LoginScreen/>
				<case ${Some(profile)}>
					<HomeScreen/>
			</switch>
		</View>
	';
}


class LoadingScreen extends coconut.ui.View<{}> {
	function render() '<View style=${{flex:1, backgroundColor:'yellow'}}/>';
}

class LoginScreen extends coconut.ui.View<{}> {
	function render() '<View style=${{flex:1, backgroundColor:'red'}}/>';
}

class HomeScreen extends coconut.ui.View<{}> {
	function render() '<View style=${{flex:1, backgroundColor:'green'}}/>';
}