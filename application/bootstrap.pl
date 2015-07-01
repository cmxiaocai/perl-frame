use POSIX;
use Config::INI::Reader;
$ENVIRONMENT = shift @ARGV;
$LOCALTIME   = strftime("%Y-%m-%d %H:%M:%S",localtime());
