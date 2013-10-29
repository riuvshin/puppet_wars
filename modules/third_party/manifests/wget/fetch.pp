define third_party::wget::fetch ($source,$destination) {
    exec { "wget-$name":
      command => "/usr/bin/wget --output-document=$destination $source",
      creates => $destination,
  }
}