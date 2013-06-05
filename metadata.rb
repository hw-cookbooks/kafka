name             "kafka"
description      "Install and configure kafka"
maintainer       "Heavy Water Ops, LLC"
maintainer_email "support@hw-ops.com"
license          "Apache 2.0"
version          "0.1.0"

supports "ubuntu"

depends "java",  "~> 1.11.4"
depends "runit", "~> 1.1.4"
depends "builder", "~> 0.1.1"
depends "zookeeperd", "~> 0.1.0"
depends "typesafe-stack", "~> 0.1.0"

