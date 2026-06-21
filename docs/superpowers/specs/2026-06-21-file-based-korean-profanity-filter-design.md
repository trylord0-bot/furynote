# File-based Korean profanity filter design

## Goal

Apply the Korean profanity entries in `backend/badwords_kr.txt` to both feed posts and comments, replacing the need to maintain profanity in a Python constant array.

## Design

- Load `badwords_kr.txt` as UTF-8 from a path resolved relative to the backend source tree, independent of the process working directory.
- Strip surrounding whitespace and ignore empty lines.
- Cache the resulting immutable collection after the first load so request handling does not repeatedly perform file I/O.
- Treat every line as a literal substring, not as a regular expression. This preserves entries containing characters such as `^`, `!`, or `@` safely.
- Extend the shared `check_text_policy()` flow. Because both post and comment creation already call this function, one policy change covers both API paths.
- Return a dedicated policy rejection code and the existing user-facing inappropriate-content message when a listed term occurs.

## Failure handling

The word-list file is a required backend asset. A missing or unreadable file must fail explicitly rather than silently disabling profanity protection. Packaging and deployment tests should therefore verify that the asset exists at the resolved location.

## Testing

- Add a unit test proving a word sourced from `badwords_kr.txt` is blocked.
- Add a unit test proving regex-like entries are matched literally.
- Keep existing URL, spam, moderation, and rate-limit behavior covered.
- Run the backend policy tests, then the complete backend test suite.
