#!/usr/bin/env perl
################################################################################
# Implantação do algoritmo de King, J. R. Nakornchai
#   Extended Rank Order Clustering Algorithm - ROC Extended
#
# Author: Luiz A. Meirelles
#         Manoel Domingues Junior
#
################################################################################

use strict;
use warnings;

use Carp;
use Data::Table;
use Data::Printer;
use Getopt::Long;

our $VERSION = 1.0;

my $infile = qw{ };
my $verbose;
my $has_header;

GetOptions(
    'input=s'    => \$infile,
    'verbose'    => \$verbose,
    'has_header' => \$has_header,
);

if (!defined $infile || !-r $infile) {
    croak 'Error in command line arguments, check README for usage.';
}

# data table configuration
my $arg_ref = {};
if ($has_header) {
    $arg_ref = {
        linesChecked       => 0,
        allowNumericHeader => 1,
        has_header         => $has_header
    };
}

my $t = Data::Table::fromFile($infile, $arg_ref);

my $result = roc_extended($t);

print $result->csv or croak 'print error';

################################################################################
#
# Function that implements the ROC Extended algorithm
#   Receive a Data::Table object and returns the object arranged
#
################################################################################
sub roc_extended {
    my $table = shift;

    # the last column to the first column
    foreach my $column (reverse 0 ... $table->lastCol) {
        my $row             = $table->lastRow;
        my $position_insert = 0;
        my $interaction     = 0;

        # last row to the first row in column
        while ($interaction <= $table->lastRow) {

            if ($verbose) {
                print "column: $column, row: $row, " or croak 'verbose error';
            }

            if ($table->elm($row, $column) ne '0') {

                if ($verbose) {
                    print "moving to row: $position_insert\n"
                        or croak 'verbose error';
                }

                # delete row, add row deleted in $position_insert and
                #   increment $position_insert
                $table->addRow($table->delRow($row), $position_insert++);
            }
            else {
                if ($verbose) {
                    print "not moving...\n" or croak 'verbose error';
                }
                $row--;
            }

            $interaction++;
        }
    }

    # the last line to the first line
    foreach my $row (reverse 0 ... $table->lastRow) {
        my $column          = $table->lastCol;
        my $position_insert = 0;
        my $interaction     = 0;

        # last column to the first column in row
        while ($interaction <= $table->lastCol) {

            if ($verbose) {
                print "row: $row, column: $column, " or croak 'verbose error';
            }

            if ($table->elm($row, $column) ne '0') {

                if ($verbose) {
                    print "moving to col: $position_insert\n"
                        or croak 'verbose error';
                }

                # get column name
                my @col_names = $table->header;
                my $col_name  = $col_names[$column];

                # delete column
                my $col_id = $table->delCol($col_name);

                # add column deleted in $position_insert
                #   and increment $position_insert
                $table->addCol($col_id, $col_name, $position_insert++);
            }
            else {
                if ($verbose) {
                    print "not moving...\n" or croak 'verbose error';
                }
                $column--;
            }

            $interaction++;
        }
    }

    return $table;
}

