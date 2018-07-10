# Adapted from http://tex.stackexchange.com/a/145878/26980
# Add a few files to cleanup
push @generated_exts, 'figlist', 'ist', 'makefile', 'unq';
# On the initial run, %tikzexternalflag is set to an empty list (when
# it reads this .latexmkrc).
#
# %tikzexternalflag is then set after successfully running make.

our %tikzexternalflag = ();

$pdflatex = 'internal tikzpdflatex -shell-escape -synctex=1 %O %S %B';

sub tikzpdflatex {
    our %externalflag;
    my $n = scalar(@_);
    my @args = @_[0 .. $n - 2];
    my $base = $_[$n - 1];

    system 'pdflatex', @args;
    # Exit with error on failure
    if ($? != 0) {
        return $?
    }
    if ( !defined $externalflag->{$base} ) {
        $externalflag->{$base} = 1;
        if ( -e "$base.makefile" ) {
            system ("$make -j4 -f $base.makefile");
        }
    }
    return $?;
}
