include limits

limits::conf { "test-soft-nofile": domain => "test", type => "soft", item => "nofile", value => "8192" }
limits::conf { "test-hard-nofile": domain => "test", type => "hard", item => "nofile", value => "8192" }
limits::conf { "test-soft-nproc": domain  => "test", type => "soft", item => "nproc", value  => "2048" }
limits::conf { "test-hard-nproc": domain  => "test", type => "hard", item => "nproc", value  => "2048" }
