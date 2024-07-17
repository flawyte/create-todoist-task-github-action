# Inputs

Input descriptions are taken from the [official Todoist API documentation](https://developer.todoist.com/rest/v2/#create-a-new-task).

<!--(inputs-start)-->
<!--(inputs-end)-->

# Usage

## Example 1

```yml
name: 'Your workflow name'
on: [workflow_dispatch]

jobs:
  create-todoist-task:
    name: 'Create Todoist task'
    runs-on: ubuntu-latest
    steps:
      - name: 'Create Todoist task'
        uses: hormesiel/todoist-create-task.gha@v1
        with:
          task-name: 'Your task name'
          task-assignee-id: '12345678'
          task-description: "Hey what's up?"
          task-due-date: '2024-07-17'
          task-duration: 30
          task-duration-unit: 'minute' # Duration in minutes
          task-labels: '["🔥 Motivation", "😃 Satisfaction"]' # Multiple labels (JSON array between single quotes)
          task-parent-id: '0123456789' # Parent task
          task-priority: 3
          todoist-api-token: ${{ secrets.TODOIST_API_TOKEN }}
```

## Example 2

```yml
name: 'Your workflow name'
on: [workflow_dispatch]

jobs:
  create-todoist-task:
    name: 'Create Todoist task'
    runs-on: ubuntu-latest
    steps:
      - name: 'Create Todoist task'
        uses: hormesiel/todoist-create-task.gha@v1
        with:
          task-name: 'Your **task** name' # Markdown in name (bold in this case)
          task-description: 'Hey what's up `man`?' # Markdown in description (code in this case)
          task-due-datetime: '2023-02-21T18:24:32Z' # Due date & time
          task-duration: 2
          task-duration-unit: 'day' # Duration in days
          task-labels: '[]' # Empty labels array (which is equivalent to omitting this input)
          task-order: 1 # Custom order
          task-project-id: '0123456789' # Specific project
          todoist-api-token: ${{ secrets.TODOIST_API_TOKEN }}
```

## Example 3

```yml
name: 'Your workflow name'
on: [workflow_dispatch]

jobs:
  create-todoist-task:
    name: 'Create Todoist task'
    runs-on: ubuntu-latest
    steps:
      - name: 'Create Todoist task'
        uses: hormesiel/todoist-create-task.gha@v1
        with:
          task-name: 'Your `task` name' # Markdown in name (code in this case)
          task-due-lang: 'fr' # Due lang
          task-due-string: 'hier' # Due string (in french because of `task-due-lang`)
          task-duration: 180 # Duration > 60 minutes
          task-duration-unit: 'minute'
          todoist-api-token: ${{ secrets.TODOIST_API_TOKEN }}
```

## Example 4

```yml
name: 'Your workflow name'
on: [workflow_dispatch]

jobs:
  create-todoist-task:
    name: 'Create Todoist task'
    runs-on: ubuntu-latest
    steps:
      - name: 'Create Todoist task'
        uses: hormesiel/todoist-create-task.gha@v1
        with:
          task-name: 'Your _task_ name' # Markdown in name (italic in this case)
          task-due-string: 'yesterday' # Due string (in english by default)
          todoist-api-token: ${{ secrets.TODOIST_API_TOKEN }}
```
