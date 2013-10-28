class third-party::git::install {
    package { "git":
                    ensure  => $git::lastversion ? {
                    true    => latest,
                    default => present,
	}
    }
}