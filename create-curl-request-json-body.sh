#!/bin/bash

FILENAME=curl-request-body.json

# Create file
touch $FILENAME

# Open JSON
echo '{' >> $FILENAME

# Handle required inputs

echo '  "content": "'$TASK_NAME'"' >> $FILENAME

# Handle optional inputs

if [ -n "$TASK_ASSIGNEE_ID" ]; then
  echo '  ,"assignee_id": "'$TASK_ASSIGNEE_ID'"' >> $FILENAME
fi

if [ -n "$TASK_DESCRIPTION" ]; then
  echo '  ,"description": "'$TASK_DESCRIPTION'"' >> $FILENAME
fi

if [ -n "$TASK_DUE_DATE" ]; then
  echo '  ,"due_date": "'$TASK_DUE_DATE'"' >> $FILENAME
fi

if [ -n "$TASK_DUE_DATETIME" ]; then
  echo '  ,"due_datetime": "'$TASK_DUE_DATETIME'"' >> $FILENAME
fi

if [ -n "$TASK_DUE_LANG" ]; then
  echo '  ,"due_lang": "'$TASK_DUE_LANG'"' >> $FILENAME
fi

if [ -n "$TASK_DUE_STRING" ]; then
  echo '  ,"due_string": "'$TASK_DUE_STRING'"' >> $FILENAME
fi

if [ -n "$TASK_DURATION" ]; then
  echo '  ,"duration": '$TASK_DURATION >> $FILENAME
fi

if [ -n "$TASK_DURATION_UNIT" ]; then
  echo '  ,"duration_unit": "'$TASK_DURATION_UNIT'"' >> $FILENAME
fi

if [ -n "$TASK_LABELS" ]; then
  echo '  ,"labels": "'$TASK_LABELS'"' >> $FILENAME
fi

if [ -n "$TASK_ORDER" ]; then
  echo '  ,"order": '$TASK_ORDER >> $FILENAME
fi

if [ -n "$TASK_PARENT_ID" ]; then
  echo '  ,"parent_id": "'$TASK_PARENT_ID'"' >> $FILENAME
fi

if [ -n "$TASK_PRIORITY" ]; then
  echo '  ,"priority": '$TASK_PRIORITY >> $FILENAME
fi

if [ -n "$TASK_PROJECT_ID" ]; then
  echo '  ,"project_id": "'$TASK_PROJECT_ID'"' >> $FILENAME
fi

if [ -n "$TASK_SECTION_ID" ]; then
  echo '  ,"section_id": "'$TASK_SECTION_ID'"' >> $FILENAME
fi

# Close JSON
echo '}' >> $FILENAME

# Log file's content for debug purposes
cat $FILENAME