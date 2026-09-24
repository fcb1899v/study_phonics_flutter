# study_phonics_flutter

App-specific implementation notes only.
Cross-app conventions are maintained separately and out of scope for this file.
English-only app: no `AppLocalizations`/`.arb`/`l10n_extension.dart`.

## Phonics content lives in three places that must stay in sync

`allPhonics` (`lib/constant.dart:25`), `phonicsWord()`/`phonicsPicture()` (`lib/extension.dart:27` and `:135`, both keyed by the same `String` switch), plus the asset files under `assets/image/`.
Nothing checks at compile time that a key exists in all three.
A missing case silently falls through to the `default` (empty strings / `Image.asset("")`) with no error.

## Multi-letter phonics keys silently mute the char button

`charSound()` (`lib/extension.dart:23`) returns `""` for anything longer than one character after stripping `'`.
Multi-letter keys ("er", "igh", "-y", …) tap into this and produce no sound, with no error.
