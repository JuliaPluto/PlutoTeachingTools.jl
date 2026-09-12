# Accessibility

This document describes the WCAG 2.1 Level AA accessibility fixes made to PlutoTeachingTools.jl,
what changed under the hood, and what (if anything) that means for existing notebooks.

Scope: this covers markup and styling that PlutoTeachingTools.jl itself generates. Pluto.jl's
editor chrome and notebook UI are out of scope (see [Pluto.jl](https://github.com/fonsp/Pluto.jl)).

## For notebook authors

- No action is required for typical usage (calling these functions and displaying the result).
- If you post-process the output of `correct`, `keep_working`, `still_missing`, `still_nothing`,
  `wrong_type`, or any admonition-producing function (e.g. extracting plain text, checking its
  type, or splicing it into another `Markdown.MD` and later walking `.content`), see the
  compatibility notes above.
- When choosing a custom `color` for `section_outline`, check it for contrast against both light
  and dark backgrounds after mixing with black/white.

## Summary of changes

| Function(s) | WCAG criterion | Fix |
|---|---|---|
| `correct`, `keep_working`, `still_missing`, `still_nothing`, `wrong_type` | 4.1.3 Status Messages | Output wrapped in `role="status" aria-live="polite" aria-atomic="true"` so screen readers announce feedback as it appears. |
| `hint`, `tip`, `almost`, `warning_box`, `question_box`, `keyconcept`, `danger`, `func_not_defined`, `var_not_defined`, `protip`, `answer_box`, and the boxes above | 3.1.2 Language of Parts | Localized admonition titles wrapped in `lang="xx"` (via new `get_language_code(lang)` in `src/i18n/i18n.jl`) so assistive technology uses the correct voice for the notebook's selected language. |
| `blockquote` | 1.4.3 Contrast (Minimum) | Border and quote-mark color changed from hardcoded `#ccc` to `color-mix(in srgb, currentColor 40%, transparent)`, which tracks the current theme's text color instead of failing contrast in dark mode. |
| `section_outline` | 1.4.3 Contrast (Minimum) | Documentation only — see [Custom colors in `section_outline`](#custom-colors-in-section_outline) below. |
| `Columns`, `TwoColumn`, `ThreeColumn`, `TwoColumnWideLeft`, `TwoColumnWideRight` | 1.4.10 Reflow | Columns now stack into a single column below a 600px viewport width instead of staying in a fixed-percentage row that becomes unreadably narrow. |
| `TODO` | 1.1.1 Non-text Content | Decorative warning-sign glyphs wrapped in `<span aria-hidden="true">` so screen readers don't announce them. |
| `blockquote` | 1.1.1 Non-text Content | Quote marks moved from CSS `content: open-quote`/`close-quote` (inconsistent screen reader behavior) to real `<span aria-hidden="true">` text. |
| `ChooseDisplayMode`, `WidthOverDocs` | 2.4.7 Focus Visible | Checkboxes now show a `:focus-visible` outline for keyboard navigation. |
| `aside` | 1.3.1 Info and Relationships | Added `aria-label="Aside"`, and a docstring note that `aside` content should be supplementary/non-critical (see below). |

## Compatibility notes

None of the above changed any function's **signature** — every function still takes the same
positional/keyword arguments it did before. Existing notebooks that just call these functions and
display the result work unchanged. A few things did change under the hood, and matter only if you
do something more advanced than displaying the output directly:

### Return type change: `correct`, `keep_working`, `still_missing`, `still_nothing`, `wrong_type`

These five functions used to return a `Markdown.MD` object. They now return an HTML object (built
with `HypertextLiteral.@htl`) so the ARIA live-region wrapper can be applied. This renders
identically in Pluto or any browser, but:

- `Markdown.plain(x)`, `Markdown.html(x)`, or other direct `Markdown.*` calls on the returned
  value will no longer produce clean plain-text/Markdown output — they'll fall back to printing
  the raw HTML string. This matters if you export a notebook's admonition text to plain text (e.g.
  for a non-browser transcript), or use these functions outside Pluto in a REPL/terminal.
- Splicing the result into a larger `Markdown.MD(...)` document (e.g.
  `Markdown.MD(tip("a"), correct())`) still works for display purposes, but the `.content` element
  contributed by these five functions is no longer a `Markdown.Admonition` — code that walks
  `.content` expecting `Admonition` objects will see the new HTML type instead.
- `isa(x, Markdown.MD)` checks on the output of these five specific functions will now be `false`.

The other admonition functions (`hint`, `tip`, `almost`, `warning_box`, `question_box`,
`keyconcept`, `danger`, `func_not_defined`, `var_not_defined`, `protip`, `answer_box`) still return
`Markdown.MD` (so `isa(x, Markdown.MD)` still holds), but their `.content` is now the HTML-wrapped
admonition rather than a bare `Markdown.Admonition`, so the same plain-text/`.content`-inspection
caveat applies to them too.

### `Columns` / `TwoColumn` / `ThreeColumn` / `TwoColumnWideLeft` / `TwoColumnWideRight`

These used to return a `PlutoUI.ExperimentalLayout.Div`. They now return an `@htl`-wrapped object
(so a scoped `<style>` block can be emitted alongside the row) and stack to one column below
600px. Visual layout at normal widths is unchanged, and passing the result directly to Pluto for
display works as before. If you were composing the result further with
`PlutoUI.ExperimentalLayout` combinators expecting a `Div`/`Node`, that composition may no longer
apply cleanly, since the return value is no longer a bare `Div`.

### Custom colors in `section_outline`

`section_outline`'s `color` keyword is mixed with black (light theme) or white (dark theme) via
CSS `color-mix()` to derive the text color, rather than used directly. This was already true
before this review — it isn't a new behavior — but it means a light `color` (e.g. `"yellow"`,
`"lime"`) can still produce low-contrast text against a light background, and a dark `color` can do
the same against a dark background. The package cannot verify contrast for an arbitrary
user-supplied CSS color string, so choose one that stays legible after mixing in both themes; see
[WCAG 1.4.3](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html).

### Browser support for `color-mix()`

`blockquote` and `section_outline` both rely on the CSS `color-mix()` function (`blockquote`'s use
is new as of this review). It's supported in current Chrome/Edge, Firefox, and Safari (roughly
2023 or later), which covers Pluto's typical embedded browser environment. In an older or
unsupported browser, the declaration is simply ignored, so borders/text fall back to their
browser-default color rather than causing an error — a graceful but visually different
degradation.

### Admonition title/body contrast — PR submitted upstream for Pluto.jl, not here

Pluto's own admonition colors were failing AA contrast requirements. I PR was submitted
directly to Pluto.jl itself (see https://github.com/fonsp/Pluto.jl, theme files
`frontend/themes/{light,dark}.css`). This fixes the problem for every Pluto user and any package
that emits `Markdown.Admonition` output, not just this one, and doesn't depend on a downstream
override surviving Pluto's CSS cascade or its sanitizer. Once that fix is merged and released,
notebooks using a Pluto version with the fix get correct-contrast admonitions automatically; no
action is needed in this package. If you're on an older Pluto release without the fix, admonition
title/body contrast for some categories may still fail AA — that's a Pluto.jl issue, not something
this package can reliably override.

### `aside` and reading order

`aside` renders an `<aside>` element with absolute CSS positioning so it floats beside the main
content for sighted readers. Because of that positioning, assistive technology walking the page in
linear reading order may not encounter it where a sighted reader would expect (though it remains
reachable via a landmarks list, now labeled `aria-label="Aside"`). Content passed to `aside` should
be supplementary/non-critical — don't put anything there that a reader needs in order to follow the
main flow of the notebook.

