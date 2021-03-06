package main

test_minimal_manifest{
  input := {
    "applications": [
      { 
        "name": "application"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_unique_application_names {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "foo"
      }
    ]
  }
  deny["Applications must have unique names"] with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_multiple_apps {
  input := {
    "applications": [
      { 
        "name": "foo"
      },
      {
        "name": "bar"
      }
    ]
  }
  no_violations with input as input
}

test_manifest_with_no_applications {
  deny["Manifest must include at least one application to deploy"] with input as {}
}

test_warn_with_only_one_instance {
  input := {
    "applications": [
      { 
        "name": "application",
        "instances": 1
      }
    ]
  }
  warn["To ensure that platform maintenance does not interrupt your app, run at least two instances."] with input as input
}

test_no_zero_instance_applications {
  input := {
    "applications": [
      { 
        "name": "foo",
        "instances": 0
      }
    ]
  }
  deny["There will be no running instances of application foo"] with input as input
}

test_no_health_check_none {
  input := {
    "applications": [
      { 
        "name": "foo",
        "health-check-type": "none"
      }
    ]
  }
  deny["Health check type none has been removed in the latest Cloud Foundry CLI"] with input as input
}

test_health_check_type {
  input := {
    "applications": [
      { 
        "name": "foo",
        "health-check-type": "ssh"
      }
    ]
  }
  deny["Health check type must be port, process, or http"] with input as input
}

test_no_route_health_check {
  input := {
    "applications": [
      { 
        "name": "foo",
        "no-route": true
      }
    ]
  }
  warn["If application foo does not listen on a port, Diego will mark it as crashed."] with input as input
}

test_no_route_health_check {
  input := {
    "applications": [
      { 
        "name": "foo",
        "no-route": true,
        "health-check-type": "process"
      }
    ]
  }
  not warn["If application foo does not listen on a port, Diego will mark it as crashed."] with input as input
}

test_no_route_health_check {
  input := {
    "applications": [
      { 
        "name": "foo",
        "no-route": true,
        "health-check-type": "port"
      }
    ]
  }
  warn["If application foo does not listen on a port, Diego will mark it as crashed."] with input as input
}
