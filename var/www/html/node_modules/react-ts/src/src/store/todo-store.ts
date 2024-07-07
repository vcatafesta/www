import { AddTodoAction, RemoveCompletedTodosAction, RemoveTodoAction, SetFilterAction, ToggleAllTodosAction, ToggleTodoAction } from '../action'
import { ReplaceableState, action, store } from 'statex/react'

import { AppState } from '../state'
import { Observable } from 'rxjs/Observable'
import { Observer } from 'rxjs/Observer'

@store()
export class TodoStore {

  @action()
  add(state: AppState, addTodoAction: AddTodoAction): ReplaceableState {
    return new ReplaceableState({
      todos: (state.todos || []).concat(
        Object.assign({ id: this.generateId() }, addTodoAction.todo)
      )
    })
  }

  @action()
  toggleTodo(state: AppState, toggleTodoAction: ToggleTodoAction): AppState {
    return {
      todos: (state.todos || []).map(todo =>
        (todo.id === toggleTodoAction.id) ? Object.assign({}, todo, {
          completed: toggleTodoAction.completed
        }) : todo
      )
    }
  }

  @action()
  remove(state: AppState, removeTodoAction: RemoveTodoAction): AppState {
    return {
      todos: (state.todos || []).filter(todo => todo.id !== removeTodoAction.id)
    }
  }

  @action()
  removeCompleted(state: AppState, removeCompletedTodosAction: RemoveCompletedTodosAction): AppState {
    return {
      todos: (state.todos || []).filter(todo => !todo.completed)
    }
  }

  @action()
  toggleAll(state: AppState, toggleAllTodosAction: ToggleAllTodosAction): Promise<AppState> {
    return new Promise((resolve, reject) => {
      resolve({
        todos: (state.todos || []).map(todo => Object.assign({}, todo, {
          completed: toggleAllTodosAction.completed
        }))
      })
    })
  }

  @action()
  setFilter(state: AppState, setFilterAction: SetFilterAction): Observable<AppState> {
    return Observable.create((observer: Observer<AppState>) => {
      observer.next({ filter: setFilterAction.filter })
      observer.complete()
    }).share()
  }

  private generateId(): string {
    return btoa(Math.random() + '').toLowerCase().substr(-6)
  }

}