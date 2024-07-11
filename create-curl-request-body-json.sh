#!/bin/bash

FILENAME=curl-request-body.json

# Create file
touch $FILENAME

# Open JSON
echo '{' >> $FILENAME

# Handle 'task-name' input
# echo '{"content": "'"$TASK_NAME"'", "project_id": "'"$TASK_PROJECT_ID"'", "priority": '$TASK_PRIORITY', "section_id": "'"$TASK_SECTION_ID"'"}' >> $FILENAME
echo '  "content": "'$TASK_NAME'"' >> $FILENAME

# Handle 'task-priority' input
if [ -n "$TASK_PRIORITY" ]; then
  echo '  ,"priority": '$TASK_PRIORITY >> $FILENAME
fi

# Handle 'task-project-id' input
if [ -n "$TASK_PROJECT_ID" ]; then
  echo '  ,"project_id": "'$TASK_PROJECT_ID'"' >> $FILENAME
fi

# Handle 'task-section-id' input
if [ -n "$TASK_SECTION_ID" ]; then
  echo '  ,"section_id": "'$TASK_SECTION_ID'"' >> $FILENAME
fi

# Close JSON
echo '}' >> $FILENAME

# Log file's content for debug purposes
cat $FILENAME