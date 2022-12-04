import 'package:file/local.dart';

import 'filesystem_impl_files.dart' as base;

class FileSystemSourceImpl extends base.FileSystemSourceImpl {
  FileSystemSourceImpl() : super(const LocalFileSystem());
}
