
class java::install {

  $remove = [ "java-1.7.0-openjdk.x86_64", "java-1.6.0-openjdk.x86_64" ]

  package { $remove:
    ensure  => absent,
  }

  include jdk7

  jdk7::install7{ 'jdk1.7.0_79':
      version                   => "7u79" ,
      fullVersion               => "jdk1.7.0_79",
      alternativesPriority      => 18000,
      x64                       => true,
      downloadDir               => "/u01/files",
      urandomJavaFix            => true,
      rsakeySizeFix             => true,
      cryptographyExtensionFile => "UnlimitedJCEPolicyJDK7.zip",
      sourcePath                => "/software",
  }
}
