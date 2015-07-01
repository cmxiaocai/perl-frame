use JSON;
use Data::Dumper;
use encoding "utf-8";

$json_str = '{"code":0,"data":[{"uid":11},{"uid":22}]}';
$jsonCoder = new JSON();
$json = $jsonCoder->decode($json_str);
print Dumper($json);

if( $json->{'code'} ne '200' ){
        print 'errors';
        exit;
}
