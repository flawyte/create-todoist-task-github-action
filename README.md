# About

A GitHub Action for creating a task in Todoist.

# Inputs

Input descriptions are taken from the [official Todoist API documentation](https://developer.todoist.com/rest/v2/#create-a-new-task). Text in square brackets [ ] has been added or modified by me.

<!--(inputs-start)-->

| Name  | Required | Default | Description |
| :---: | :------: | :-----: | ----------- |
| `task-name` | true |  | Task content [or name]. This value may contain markdown-formatted text and hyperlinks. Details on markdown support can be found in the Text Formatting article in [Todoist's] Help Center. |
| `todoist-api-token` | true |  | The Todoist API token of the account to create the task in. |
| `task-assignee-id` | false |  | The responsible user ID (only applies to shared tasks). |
| `task-description` | false |  | A description for the task. This value may contain markdown-formatted text and hyperlinks. Details on markdown support can be found in the Text Formatting article in [Todoist's] Help Center. |
| `task-due-date` | false |  | Specific date in `YYYY-MM-DD` format relative to user's timezone. |
| `task-due-datetime` | false |  | Specific date and time in RFC3339 format in UTC. |
| `task-due-lang` | false |  | 2-letter code specifying language in case `due_string` is not written in English. |
| `task-due-string` | false |  | Human defined task due date (ex.: "next Monday", "Tomorrow"). Value is set using local (not UTC) time. |
| `task-duration` | false |  | A positive (greater than zero) integer for the amount of `duration_unit` the task will take. If specified, you **must** define a `duration_unit`. |
| `task-duration-unit` | false |  | The unit of time that the `duration` field above represents. Must be either `minute` or `day`. If specified, `duration` **must** be defined as well. |
| `task-labels` | false |  | The task's labels (a list of names that may represent either personal or shared labels). |
| `task-order` | false |  | Non-zero integer value used by clients to sort tasks under the same parent. |
| `task-parent-id` | false |  | Parent task ID. |
| `task-priority` | false |  | Task priority from 1 (normal) to 4 (urgent). |
| `task-project-id` | false |  | Task project ID. If not set, task is put to user's Inbox. |
| `task-section-id` | false |  | ID of section to put task into. |

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
