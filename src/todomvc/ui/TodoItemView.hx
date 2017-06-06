package todomvc.ui;

import todomvc.data.TodoItem;
import coconut.Ui.*;
import react.native.component.*;
import react.native.api.*;
using StringTools;

class TodoItemView extends coconut.ui.View<{ item: TodoItem, ondeleted: Void->Void }> {
  
  static var styles = StyleSheet.create({
    row: {
      padding: 10,
      flexDirection: 'row',
      alignItems: 'center',
    },
    input: {
      marginLeft: 20, 
      flex: 1,
      height: 40,
    },
    description: {
      marginLeft: 20, 
      flex: 1,
    },
    delete: {
      fontWeight: 'bold',
      color: 'red',
    }
  });
  
  @:state var isEditing:Bool = false;

  function render() {

    function edit(entered:String)
      switch entered.rtrim() {
        case '': ondeleted();
        case v: item.description = v;
      }

    return @hxx '
      <View style=${styles.row}>
        <Switch value=${item.completed} onValueChange=${v => item.completed = v} />
        <if ${isEditing}>
          <TextInput style=${styles.input} autoFocus=${true} defaultValue=${item.description} onEndEditing=${e => edit(e.nativeEvent.text)} onBlur=${_ => isEditing = false} />
        <else>
          <Text style=${styles.description} onPress=${_ => this.isEditing = true}>${item.description}</Text>
          <TouchableHighlight onPress=${ondeleted}><View><Text style=${styles.delete}>X</Text></View></TouchableHighlight>
        </if>
      </View>
    ';
  }
  // override function afterPatching(_) 
  //   if (isEditing)
  //     get('input[type="text"]').focus();
  
}