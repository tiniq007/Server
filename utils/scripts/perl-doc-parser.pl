use File::Find;
use Data::Dumper;

sub usage() {
	print "Usage:\n";
	print "   --client     - Prints methods for just client class methods\n";
	print "   --mob        - Prints methods for just mob class methods\n";
	print "   --all        - Prints methods for all classes\n";
	exit(1);
}

if($#ARGV < 0) {
	usage();
}

my $export = $ARGV[0];
$export=~s/--//g;

my @files;
my $start_dir = "zone/";
find(
    sub { push @files, $File::Find::name unless -d; },
    $start_dir
);
for my $file (@files) {

	#::: Skip non Perl files
	if($file!~/perl_/i){ 
		next; 
	}

	#::: If we are specifying a specific class type, skip everything else
	if ($export ne "all" && $export ne "") {
		if ($file!~/$export/i) {
			next;
		}
	}

	@methods = ();

	#::: Open File
	print "Opening '" . $file . "'\n";
	open (FILE, $file);
	while (<FILE>) {
		chomp;
		$line = $_;

		if ($line=~/Client::|Mob::/i && $line=~/_croak/i) {

			#::: Client export
			if ($export=~/all|client/i) {
				$split_key = "Client::";
				$object_prefix = "\$client->";
			}

			#::: Mob export
			if ($export=~/all|mob/i) {
				$split_key = "Mob::";
				$object_prefix = "\$mob->";
			}

			#::: Split on croak usage
			@data  = split($split_key, $line);
			$usage = trim($data[1]);

			#::: Split out param borders and get method name
			@params_begin = split('\(', $usage);
			$method_name  = trim($params_begin[0]);

			#::: Get params string built
			@params_end    = split('\)', $params_begin[1]);
			$params_string = trim($params_end[0]);
			$params_string =~s/THIS\,//g;
			$params_string =~s/THIS//g;
			$params_string = trim($params_string);

			$method = $object_prefix . $method_name . "(" . lc($params_string) . ")\n";

			push @methods, $method;
		}
	}

	@methods = sort @methods;
	foreach $method (@methods) {
		print $method;
	}
}

#::: Trim Whitespaces
sub trim { 
	my $string = $_[0]; 
	$string =~ s/^\s+//; 
	$string =~ s/\s+$//; 
	return $string; 
}