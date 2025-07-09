# MacOS Create shared directory for group

## 1. Config

```bash
TARGET_GROUP=worker
SHARED_DIRECTORY_DIR="/Users/Workspace"
```

## 2. Create

```bash
sudo mkdir $SHARED_DIRECTORY_DIR
sudo chgrp $TARGET_GROUP $SHARED_DIRECTORY_DIR
sudo chmod 2770 $SHARED_DIRECTORY_DIR
```

## 3. Update ACL

```bash
WRITE_FILE_ACL="writeattr,writeextattr,writesecurity,delete"
WRITE_DIR_ACL="add_file,add_subdirectory,delete_child"
sudo /bin/chmod +a "group:$TARGET_GROUP allow $WRITE_FILE_ACL,$WRITE_DIR_ACL,file_inherit,directory_inherit" $SHARED_DIRECTORY_DIR
```
