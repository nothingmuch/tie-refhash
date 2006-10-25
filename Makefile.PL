use ExtUtils::MakeMaker;

use 5.005;

WriteMakefile
(
          'NAME' => 'Tie::RefHash',
          'VERSION_FROM' => 'lib/Tie/RefHash.pm',
          'PREREQ_PM' => {},
          'INSTALLDIRS' => 'perl',
          'PL_FILES' => {}
        )
;
