# MacOS Create shared directory for group

## 1. Config

```bash
TARGET_GROUP=worker
SHARED_DIRECTORY_DIR=/Users/Workspace
```

## 2. Create

```bash
sudo /bin/mkdir $SHARED_DIRECTORY_DIR
sudo /bin/chgrp $TARGET_GROUP $SHARED_DIRECTORY_DIR
sudo /bin/chmod 2770 $SHARED_DIRECTORY_DIR
sudo /bin/chmod +a "group:$TARGET_GROUP allow writeattr,writeextattr,writesecurity,delete,add_file,add_subdirectory,delete_child,file_inherit,directory_inherit" $SHARED_DIRECTORY_DIR
```
