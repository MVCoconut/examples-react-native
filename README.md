[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/MVCoconut/Lobby)


# How to run this example
```bash
yarn global add lix
lix download # install haxe libraries
haxe ios.hxml # build ios
haxe android.hxml # build android
cd bin
yarn # install node modules
yarn ios # run ios
yarn android # run android
```

# How to create a Coconut + React Native project from scratch

In a nutshell:  
1. Create a new React Native project according to the official documentation
1. Create a Haxe project with Coconut (coconut.react-native)
1. Replace the "entry point view" with one built with Coconut

> Typically, the "entry point view" is registered with `AppRegistry.registerComponent('my-app', () => Main);`
> Since any `coconut.react.View` is a legitimate react component, so it can be used directly for registration.
> You can use Haxe's `@:expose` metadata to obtain the reference in JS and register there.
> You can also call `registerComponent` in Haxe code directly.
