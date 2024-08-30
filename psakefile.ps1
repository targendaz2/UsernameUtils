Import-Module Pester

Task default -Depends Test

Task Test {
    Invoke-Pester -Output Detailed
}
