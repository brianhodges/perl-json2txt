use strict;
use warnings;
use person;
use lib qw(..);
use JSON qw( );

my $filename = 'data.json';
my @people = ();
my $sp = "\n";

my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $filename)
      or die("Can't open \$filename\": $!\n");
   local $/;
   <$json_fh>
};

my $json = JSON->new;
my @data = @{$json->decode($json_text)};

foreach my $person (@data) {
	my $p = person->new( 'ID' => $person->{'id'}, 'FirstName' => $person->{'first_name'}, 'LastName' => $person->{'last_name'},
						'Email' => $person->{'email'}, 'BTCAddress' => $person->{'btc_address'}, 'IPAddress' => $person->{'ip_address'});
	push @people, $p;
}

my $output_filename = 'log.txt';
open(my $fh, '>', $output_filename) or die "Could not open file '$output_filename' $!";

foreach my $person (@people) {
	print $fh "ID: ", $person->{'ID'}, $sp;
	print $fh "Full Name: ", $person->full_name, $sp;
	print $fh "Email: ", $person->{'Email'}, $sp;
	print $fh "BTC Address: ", $person->{'BTCAddress'}, $sp;
	print $fh "IP Address: ", $person->{'IPAddress'}, $sp, $sp;
}
