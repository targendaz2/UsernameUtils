Task default -Depends Test

Task Test {
    Import-Module Pester
    Invoke-Pester -Output Detailed
}

Task Build {
    'This is the build task'
}
