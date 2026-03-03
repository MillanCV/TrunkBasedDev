def test_intentional_failure_for_ci_gate():
    raise AssertionError("Intentional failure to verify branch protections / rulesets")
