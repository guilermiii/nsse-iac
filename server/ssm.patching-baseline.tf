resource "aws_ssm_patch_baseline" "this" {
  name             = "DebianProductionBaseLine"
  description      = "Patch Baseline for Debian Production Enviorment"
  operating_system = "DEBIAN"

  approved_patches_enable_non_security=false


  approval_rule {
    approve_after_days = 0
    compliance_level   = "CRITICAL"

    patch_filter {
      key    = "PRODUCT"
      values = ["Debian12"]
    }

    patch_filter {
      key    = "SECTION"
      values = ["*"]
    }

    patch_filter {
      key    = "PRIORITY"
      values = ["Required", "Important"]
    }
  }
  approval_rule {
    approve_after_days = 0
    compliance_level   = "INFORMATIONAL"

    patch_filter {
      key    = "PRODUCT"
      values = ["Debian12"]
    }

    patch_filter {
      key    = "SECTION"
      values = ["*"]
    }

    patch_filter {
      key    = "PRIORITY"
      values = ["Standard"]
    }
  }

  
}
