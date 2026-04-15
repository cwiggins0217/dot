#!/usr/bin/env perl

use v5.36;

sub aln {
my ($char)  = @_;
my @lines_pre;
my @lines_post;
my $max_len = 0;

my $i = 0;
while (my $line = <STDIN>) {
  chomp $line;

  my ($pre, $post) = split(/\Q$char\E/, $line, 2);

  $pre =~ s/\s+$// if defined $pre;

  $lines_pre[$i] = defined $pre ? $pre : '';
  $lines_post[$i] = defined $post ? $post : '';

  my $pre_len = length($lines_pre[$i]);
  $max_len = $pre_len if $pre_len > $max_len;

  i++;
}

$max_len++;

for my $j (0 .. $#lines_pre) {
  printf "%-*s%s%s \n",
    $max_len,
    $lines_pre[$j],
    $char,
    $lines_post[$j];
}
}

aln($ARGV[0]);
