# redirectBack

## Installation

`box install redirectBack`

## Usage

```cfc
// handlers/Main.cfc
component {
	function plainRedirect( event, rc, prc ) {
		redirectBack();
	}

	function redirectWithAdditionalParameters( event, rc, prc ) {
		redirectBack( /* takes anything setNextEvent takes */ );
	}
}
```

Uses the ColdBox's flash storage to store the last request.  If there is no last request, redirects to "" (empty string).
