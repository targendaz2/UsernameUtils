Import-Module ./UsernameUtils -Force

Describe 'New-Username Formats' {
    It 'Given the FirstDotLast format, it generates a username formatted as First.Last' {
        $username = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'FirstDotLast'
        $username | Should -Be 'john.smith'
    }

    It 'Given the FirstLast format, it generates a username formatted as FirstLast' {
        $username = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'FirstLast'
        $username | Should -Be 'johnsmith'
    }

    It 'Given the FLast format, it generates a username formatted as FLast' {
        $username = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'FLast'
        $username | Should -Be 'jsmith'
    }

    It 'Given the First format, it generates a username formatted as First' {
        $username = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'First'
        $username | Should -Be 'john'
    }

    It 'Given the Initials format, it generates a username formatted as Initials' {
        $username = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'Initials'
        $username | Should -Be 'js'
    }
}

Describe 'New-Username Conflict Resolution' {
    It 'Given the IncreaseNumber conflict resolution, it generates usernames with increasing numbers appended' {
        $username2 = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'FirstDotLast' `
            -ConflictResolution 'IncreaseNumber' `
            -ConflictCount 3

        $username2 | Should -Be 'john.smith4'
    }

    It 'Given the AddLastName conflict resolution, it generates usernames with an increasing amount of the last name added' {
        $username2 = New-Username `
            -FirstName 'John' `
            -LastName 'Smith' `
            -Format 'First' `
            -ConflictResolution 'AddLastName' `
            -ConflictCount 2

        $username2 | Should -Be 'johnsm'
    }
}
