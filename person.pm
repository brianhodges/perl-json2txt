package person;
use strict;
use warnings;

sub new {
  my $type = shift;
  my %params = @_;
  my $self = {};
  $self->{'ID'} = $params{'ID'};
  $self->{'FirstName'} = $params{'FirstName'};
  $self->{'LastName'} = $params{'LastName'};
  $self->{'Email'} = $params{'Email'};
  $self->{'BTCAddress'} = $params{'BTCAddress'};
  $self->{'IPAddress'} = $params{'IPAddress'};
  bless $self, $type;
}

sub full_name {
  my $self = shift;
  return $self->{'FirstName'} . " " . $self->{'LastName'};
}

1;

