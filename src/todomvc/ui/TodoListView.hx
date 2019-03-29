package todomvc.ui;

import coconut.Ui.*;
import todomvc.data.*;
import react.native.component.*;
import react.native.api.*;

class TodoListView extends coconut.ui.View {
  @:attr var todos:TodoList;
  @:attr var filter:TodoFilter;
  
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
      height: 40,
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
  
  var input:TextInput;
  
  function render() 
    <View style={styles.app}>
      <View>
        <TextInput ref={i -> input = i} style={styles.input} onSubmitEditing={e -> { todos.add(e.nativeEvent.text); input.clear(); }} />
        <View style={styles.markAllContainer}>
          <if {todos.items.length > 0}>
            <if {todos.items.exists(TodoItem.isActive)}>
              <Button onPress={() -> for (i in todos.items) i.completed = true} title="Mark all as completed" />
            <else>
              <Button onPress={() -> for (i in todos.items) i.completed = false} title="Unmark all as completed" />
            </if>
          </if>
        </View>
      </View>
      
      <for {item in todos.items}>
        <if {filter.matches(item)}>
          <TodoItemView key={item} item={item} ondeleted={todos.delete.bind(item)} />
        </if>
      </for>

      <View>
        <Text>
          <switch {todos.items.count(TodoItem.isActive)}>
            <case {1}>1 item
            <case {v}>{v} items
          </switch> left
        </Text>
        <View style={styles.filterContainer}>
          <for {f in filter.options}>
              <Button onPress={() -> filter.toggle(f.value)} title={f.name} />
          </for>
          <if {todos.items.exists(TodoItem.isCompleted)}>
            <Button onPress={todos.clearCompleted} title="Clear Completed" />
          </if>
        </View>
      </View>
    </View>
  ;
}