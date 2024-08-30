Import-Module ./UsernameUtils -Force

Describe 'New-Username' {
    It 'Given a first and last name, it generates a username' {
        $username = New-Username -FirstName 'John' -LastName 'Smith'
        $username | Should -Be 'jsmith'
    }
}
