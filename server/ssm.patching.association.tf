resource "aws_ssm_association" "debian_production" {
    name = "AWS-RunPatchBaseline"
    # a cada 30 minutos | a cada hora | de cada dia | de cada mes | cada dia da semana | de qualquer ano
    schedule_expression = "cron(*/30 * * * ? *)"
    association_name = "DebianRunPatchAssociation"
    max_concurrency = 1
    max_errors = 0

    parameters = {
        Operation = "Install"
        RebootOption = "RebootIfNeeded"
    }

    targets {
        key = "tag:Patch Group"
        values = [var.patch_group]
    }
}