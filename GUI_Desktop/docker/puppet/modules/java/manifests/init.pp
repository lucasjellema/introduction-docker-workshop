


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
      downloadDir               => "/software/java",
      urandomJavaFix            => true,
      rsakeySizeFix             => true,
      cryptographyExtensionFile => "UnlimitedJCEPolicyJDK7.zip",
      sourcePath                => "/software/java",
  }

  
  # download jdk-8u60-linux-x64.tar from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html  
  #jdk7::install7{ 'jdk1.8.0_60':
   #   version                   => "8u60" ,
    #  fullVersion               => "jdk1.8.0_60",
     # alternativesPriority      => 19000,
      #x64                       => true,
	  # local directory to download files into before the installation kicks - note: ideally use a directory that is a volume in the container and not a directory inside the# container's file system
      #downloadDir               => "/stage",
      #urandomJavaFix            => true,
      #rsakeySizeFix             => false,
	  # directory that contains the external files used for the installation (UnlimitedJCEPolicyJDK7.zip and the JDK tar) 
   #   sourcePath                => "/stage",
  #}
}
