# Design

For easier testing, the function that generates a random key is a public function, and the encoding/decoding functions expect to always be passed the key explicitly. If encode/decode would generate their own keys internally, it would be hard to write any assertions for the output.
