package todomvc.ui;

import todomvc.data.TodoItem;
import coconut.Ui.*;
import react.native.component.*;
import react.native.api.*;
using StringTools;

class TodoItemView extends coconut.ui.View<{ item: TodoItem, ondeleted: Void->Void }> {
  
  static var styles = StyleSheet.create({
    input: {
      height: 30,
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
      <View >
        <!--<TextInput type="checkbox" checked={item.completed} onchange={e => item.completed = e.target.checked} />-->
        <if {isEditing}>
          <TextInput style=${styles.input} value={item.description} onChangeText={v => edit(v)} onBlur={_ => isEditing = false} />
        <else>
          <Text onPress={_ => this.isEditing = true}>{item.description}</Text>
          <TouchableHighlight onPress={ondeleted}><View><Text>Delete</Text></View></TouchableHighlight>
        </if>
      </View>
    ';
  }
  // override function afterPatching(_) 
  //   if (isEditing)
  //     get('input[type="text"]').focus();
  
}