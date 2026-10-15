resource "aws_ssm_patch_baseline" "this" {
  name                                 = "DebianProductionBaseLine"
  description                          = "Patch Baseline for Debian Production Enviorment"
  operating_system                     = "DEBIAN"
  approved_patches_enable_non_security = false

  dynamic "approval_rule" {
    for_each = var.debian_production_patch_baseline

    content {
      approve_after_days = approval_rule.value.approve_after_days
      compliance_level   = approval_rule.value.compliance_level
      dynamic "patch_filter" {
        for_each = approval_rule.value.patch_filters

        content {
          key    = patch_filter.value.key
          values = patch_filter.value.values
        }
      }
    }
  }
}
