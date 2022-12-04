import 'package:file/memory.dart';

import 'filesystem_impl_files.dart' as base;

class FileSystemSourceImpl extends base.FileSystemSourceImpl {
  FileSystemSourceImpl() : super(MemoryFileSystem());
}
