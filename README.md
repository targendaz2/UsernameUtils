# UsernameUtils

## Username Formatting

### Username Formats

* First.Last: john.smith
* FirstLast: johnsmith
* FLast: jsmith
* First: john
* Initials: js7, js15

### Duplicate Handling Options

* Increasing number: john.smith, john.smith1, john.smith2
* Add last name: john, johns, johnsm, johnsmi
* Combined: john, johns, johnsmith, john2, johns2, johnsmith2

### Username Limitations & Requirements

* Length: johnsmit
* Incrementing number: john, john2, john3
* Random number: john56, john92

## Conditional Formatting

Create your own wrapper function. E.g.:

```PowerShell
function New-ConditionalUsername(
  [Parameter(Mandatory)]
  [string]$FirstName,
  [Parameter(Mandatory)]
  [string]$LastName,
  [switch]$Consultant
) {
  if ($Consultant) {
    New-Username `
      -FirstName $FirstName `
      -LastName $LastName `
      -Format FLast `
      -DuplicateMethod IncNumber
  } else {
    New-Username `
      -FirstName $FirstName `
      -LastName $LastName `
      -Format First `
      -DuplicateMethod AddLastName, IncreasingNumber
  }
}
```
