use DBF;
use JSON;
use POSIX;
use Config::INI::Reader;
use Data::Dumper;
use encoding "utf-8";

require('bin/bootstrap.pl');
require('adapter/mysql_app.pl');

# request api
$config_ref = Config::INI::Reader->read_file('config/api_user.ini');
$api_anxun  = $config_ref->{$ENVIRONMENT}->{'API_HOST'};
$api_url    = $api_anxun.$config_ref->{$ENVIRONMENT}->{'URI_READ_USERLIST'};
$json_str   = qx{curl --silent $api_url};
if( !$json_str ){
	print 'request failure';
	exit;
}

# decode json
$jsonCoder = new JSON();  
$json = $jsonCoder->decode($json_str);
$code = $json->{'code'};
if( $code ne '200' ){
	print '__code errors >>', $json_str;
	exit;
}
$result = $json->{'result'};

print "--START--";

# format parsing
my %savehash;
my @packageids;
my @img_ids;
foreach $item (@{$result}){
	my %temphash;
	foreach $img (@{$item->{'user_images'}}){
		$temphash{$img->{'last_time'}}{'image_id'}   = $img->{'id'};
		$temphash{$img->{'last_time'}}{'tags'}       = join(',', @{$img->{'tags'}} );
		$temphash{$img->{'last_time'}}{'updatetime'} = $img->{'update_time'};
		push( @img_ids, $img->{'img_id'} );
	}

	my @array=();
        foreach my $key (sort {$a<=>$b} keys %temphash){
                push(@array, %temphash->{$key});
        }

        my $userid = $item->{'userid'};
        $savehash{$userid}{'images'}  = \@array;
}

get_mysql_connect_appres();
while( ($key, $item) = each(%savedata) ){
	my $userid = $item->{'userid'};
	my $imges  = $jsonCoder->encode( $item->{'images'} );
	$CONN_MYSQL_APPRES->do("INSERT INTO XXXX(`uid`,`images`) VALUES($userid,'$images')");
}

print '--END--';
