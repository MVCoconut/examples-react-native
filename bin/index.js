/**
 * @format
 */

import {AppRegistry, Platform} from 'react-native';
import {App as Android} from './generated/android/main';
import {App as IOS} from './generated/ios/main';
import {name as appName} from './app.json';

AppRegistry.registerComponent(appName, () => Platform.OS == "android" ? Android : IOS);
