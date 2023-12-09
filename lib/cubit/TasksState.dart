abstract class TasksState {}
class InitState extends TasksState{}
class DeleteStateSuccess extends TasksState{}
class DeleteStateError extends TasksState{}
class DeleteStateLoading extends TasksState{}
class AddStateSuccess extends TasksState{}
class ClearStateSuccess extends TasksState{}