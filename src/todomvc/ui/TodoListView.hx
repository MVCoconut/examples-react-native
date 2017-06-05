package todomvc.ui;

import coconut.Ui.*;
import todomvc.data.*;
import react.native.component.*;
import react.native.api.*;

class TodoListView extends coconut.ui.View<{todos:TodoList, filter:TodoFilter}> {
  static var styles = StyleSheet.create({
    app: {
      paddingTop: 20,
      paddingLeft: 10,
      paddingRight: 10,
    },
    markAllContainer: {
      flexDirection: 'row',
      justifyContent: 'center',
    },
    input: {
      margin: 5,
      borderWidth: 1,
      borderColor: 'grey',
      height: 30,
    },
    filterContainer: {
      marginTop: 20,
      flexDirection: 'row',
      justifyContent: 'space-around',
    },
    filter: {
      // flex: 1,
    },
  });
  
  @:state var input:String = '';
  
  function render() '
    <View style=${styles.app}>
      <View>
        <TextInput style=${styles.input} value=${input} onChangeText=${v => input = v} onSubmitEditing=${[] => { todos.add(input); input = ""; }} />
        <View style=${styles.markAllContainer}>
          <if ${todos.items.length > 0}>
            <if ${todos.items.exists(TodoItem.isActive)}>
              <TouchableHighlight onPress=${[] => for (i in todos.items) i.completed = true}>
                <View><Text>Mark all as completed</Text></View>
              </TouchableHighlight>
            <else>
              <TouchableHighlight onPress=${[] => for (i in todos.items) i.completed = false}>
                <View><Text>Unmark all as completed</Text></View>
              </TouchableHighlight>
            </if>
          </if>
        </View>
      </View>

      <for ${item in todos.items}>
        <if ${filter.matches(item)}>
          <TodoItemView key=${item} item=${item} ondeleted=${todos.delete.bind(item)} />
        </if>
      </for>

      <View>
        <Text>
          <switch ${todos.items.count(TodoItem.isActive)}>
            <case ${1}>1 item
            <case ${v}>${v} items
          </switch> left
        </Text>
        <View style=${styles.filterContainer}>
          <for ${f in filter.options}>
              <TouchableHighlight onPress=${[] => filter.toggle(f.value)}>
                <View style=${styles.filter}><Text>${f.name}</Text></View>
              </TouchableHighlight>
          </for>
          <if ${todos.items.exists(TodoItem.isCompleted)}>
            <TouchableHighlight onPress=${todos.clearCompleted}><Text>Clear Completed</Text></TouchableHighlight>
          </if>
        </View>
      </View>
    </View>
  ';
}