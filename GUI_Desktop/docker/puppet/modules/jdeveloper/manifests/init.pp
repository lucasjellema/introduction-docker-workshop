
# == Define: jdeveloper
#
# installs JDeveloper (based on SOA Quick Install with SOA Suite, OSB, OEP development environment - does not have BPM)
#
define jdeveloper::install(  
  $jdev_version              = '12.1.3.0.0',
  $jdev_pkg                  = 'fmw_12.1.3.0.0_soa_quickstart.jar',
  $jdev_patch_id             = '20636710',
  $Oracle_JDeveloper_Home   = '/u01/app/oracle/JDEV_Home',
  $user                    = 'oracle',
  $group                   = 'oracle',
  $downloadDir             = '/vagrant',
  $fullJDKName             = 'jdk1.7.0_79',
) {

$responseFile = "${downloadDir}/jdev_install_responsefile"
$inventoryLocFile = "${downloadDir}/oraInst.loc"
$JAVA_HOME               = "/usr/java/$fullJDKName"


$installCommand = "java -jar ${downloadDir}/$jdev_pkg -silent -responseFile $responseFile -invPtrLoc $inventoryLocFile -jreLoc $JAVA_HOME -ignoreSysPrereqs"
$cleanupCommand = "rm $jdev_pkg $inventoryLocFile /u01/install.file"	
	
notify { 'report path':
  message  => "the value for the path variable: $JAVA_HOME/bin",
  withpath => true,
}	
	
  exec {"install jdeveloper":
	 path => '/bin:/usr/bin:/sbin:/usr/sbin',
     command => $installCommand,
     #cwd => $downloadDir,
timeout =>1200,
     user => 'oracle',
  	 creates => "${Oracle_JDeveloper_Home}/jdeveloper"
  }


}
