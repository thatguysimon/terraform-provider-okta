resource "okta_group" "test" {
  name = "testAcc_replace_with_uuid"
}

resource "okta_group_rule" "test" {
  name              = "testAcc_replace_with_uuid"
  status            = "ACTIVE"
  group_assignments = [okta_group.test.id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.startsWith(user.firstName,\"andy\")"
}

data "okta_group_rule" "test_by_id" {
  id          = okta_group_rule.test.id
}

data "okta_group_rule" "test_by_name" {
  name          = "testAcc_replace_with_uuid"
}
