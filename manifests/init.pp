# keyboard
#
# Main class, includes all other classes.
#
# @summary Manage keyboard settings
# @param model String
# @param layout String
# @param variant String
# @param options Optional[String]
# @param backspace String
# @param package_ensure [String] Whether to install the keyboard package, and what version to install. Values: 'present', 'latest', or a specific version number. Default value: 'present'.
# @param package_manage [Boolean] Whether to manage the keyboard package. Default value: true.
# @param package_name [Array[String]] Specifies the keyboard package to manage.
# @param default_file String
# @param update_command Optional[String]
#
# @example
#   include keyboard
class keyboard (
  String $model,
  String $layout,
  String $variant,
  Optional[String] $options,
  String $backspace,
  String $package_ensure,
  Array[String] $package_name,
  Boolean $package_manage,
  String $default_file,
  Optional[String] $update_command,
  ) {
  contain ::keyboard::install
  contain ::keyboard::config

  Class['::keyboard::install']
  ~> Class['::keyboard::config']
}
