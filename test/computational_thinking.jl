@testset "ARIA live region on feedback admonitions (WCAG 4.1.3)" begin
    # These functions render dynamic feedback in Pluto notebooks (e.g. "Correct!").
    # Screen readers only announce such changes if the HTML carries an ARIA live
    # region, so we check that role="status" and aria-live="polite" are present.
    function has_status_live_region(x)
        html_str = repr(MIME"text/html"(), x)
        return occursin("role=\"status\"", html_str) && occursin("aria-live=\"polite\"", html_str)
    end

    @test has_status_live_region(correct())
    @test has_status_live_region(correct("Nice job!"))

    @test has_status_live_region(keep_working())
    @test has_status_live_region(keep_working("Almost there."))

    @test has_status_live_region(still_missing())
    @test has_status_live_region(still_missing("Variable xxx is missing."))

    @test has_status_live_region(still_nothing())
    @test has_status_live_region(still_nothing("Variable xxx is nothing."))

    @test has_status_live_region(wrong_type())
    @test has_status_live_region(wrong_type(:x, Int))
end

@testset "TODO() decorative warning icon (WCAG 1.1.1)" begin
    # TODO() surrounds its heading with a warning-sign glyph purely for visual
    # framing. Without aria-hidden, a screen reader announces "warning sign" as
    # if it were content (e.g. "warning sign, TODO, warning sign"). The glyph(s)
    # must be wrapped in <span aria-hidden="true">...</span> so they are skipped.
    html_str = repr(MIME"text/html"(), TODO())

    @test occursin("&#9888;", html_str)
    @test occursin("<span aria-hidden=\"true\">&#9888;</span>", html_str)
    # There are two decorative occurrences, flanking the heading text.
    @test count("<span aria-hidden=\"true\">&#9888;</span>", html_str) == 2

    html_str_with_text = repr(MIME"text/html"(), TODO("Finish this section."))
    @test count("<span aria-hidden=\"true\">&#9888;</span>", html_str_with_text) == 2
end

@testset "blockquote() border/quote-mark contrast (WCAG 1.4.3)" begin
    # The border and decorative quote marks used to be a hardcoded #ccc, which is
    # invisible/fails contrast against a dark background in Pluto's dark theme.
    # They must instead be theme-aware (e.g. derived from currentColor via
    # color-mix, or overridden in a prefers-color-scheme: dark block, or driven
    # by a CSS custom property) so they remain visible in both themes.
    html_str = repr(MIME"text/html"(), blockquote("A wise quote", "Someone wise"))

    @test !occursin("#ccc", html_str)

    is_theme_aware = occursin("prefers-color-scheme", html_str) ||
                      occursin("var(--", html_str) ||
                      occursin("color-mix", html_str)
    @test is_theme_aware
end

@testset "blockquote() decorative quote marks (WCAG 1.1.1)" begin
    # The decorative quote-mark glyphs used to be generated purely via CSS
    # `content: open-quote` / `content: close-quote` on ::before/::after
    # pseudo-elements, which are not real DOM text. Screen reader behavior for
    # CSS-generated content is inconsistent (some announce "quotation mark",
    # others announce nothing). The glyphs must instead be real HTML text
    # wrapped in <span aria-hidden="true">...</span> so they are reliably
    # skipped, since the <blockquote>-style semantics/text already convey
    # that this is a quotation.
    html_str = repr(MIME"text/html"(), blockquote("A wise quote", "Someone wise"))

    @test !occursin("open-quote", html_str)
    @test !occursin("close-quote", html_str)

    @test occursin("<span class=\"nice-blockquote__quote-mark nice-blockquote__quote-mark--open\" aria-hidden=\"true\">&ldquo;</span>", html_str)
    @test occursin("<span class=\"nice-blockquote__quote-mark nice-blockquote__quote-mark--close\" aria-hidden=\"true\">&rdquo;</span>", html_str)
    @test count("aria-hidden=\"true\"", html_str) == 2
end

@testset "Language of localized parts (WCAG 3.1.2)" begin
    # Localized admonition titles (e.g. "Conseil:" for French) must carry a `lang`
    # attribute distinct from the document language, or a screen reader will read
    # them in the wrong language/accent.
    function html_of(x)
        return repr(MIME"text/html"(), x)
    end

    @testset "get_language_code" begin
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.EnglishUS()) == "en"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTFrench.FrenchBelgium()) == "fr"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTFrench.FrenchBelgiumFormal()) == "fr"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTFrench.FrenchBelgiumColloquial()) == "fr"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTGerman.GermanGermany()) == "de"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTGerman.GermanGermanyFormal()) == "de"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTGerman.GermanGermanyColloquial()) == "de"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTRussian.RussianRU()) == "ru"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTSpanish.SpanishES()) == "es"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTSpanish.SpanishFormal()) == "es"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTSpanish.SpanishColloquial()) == "es"
        @test PlutoTeachingTools.get_language_code(PlutoTeachingTools.PTTChinese.ChineseZH()) == "zh"
    end

    @testset "Rendered HTML carries lang attribute" begin
        fr = PlutoTeachingTools.PTTFrench.FrenchBelgium()
        ru = PlutoTeachingTools.PTTRussian.RussianRU()

        has_lang(html_str, code) = occursin("lang='$(code)'", html_str) || occursin("lang=\"$(code)\"", html_str)

        @test has_lang(html_of(tip("Un texte", fr)), "fr")
        @test has_lang(html_of(hint("Un texte", fr)), "fr")
        @test has_lang(html_of(correct(; lang=fr)), "fr")
        @test has_lang(html_of(still_missing(; lang=ru)), "ru")
        @test has_lang(html_of(keep_working(; lang=ru)), "ru")

        # English (the document's assumed base language) still gets an explicit
        # lang="en" so nested content is unambiguous regardless of page language.
        @test has_lang(html_of(tip("Some text")), "en")

        # The ARIA live region and the lang attribute live on the same element.
        correct_html = html_of(correct(; lang=ru))
        @test occursin("role=\"status\"", correct_html)
        @test has_lang(correct_html, "ru")

        # protip/answer_box wrap a Foldable (not an Admonition) and localize the
        # <summary> "invite" text outside the inner admonition, so the lang div
        # must enclose the whole Foldable, not just the admonition.
        @test has_lang(html_of(protip("Un texte"; lang=fr)), "fr")
        @test has_lang(html_of(answer_box("Une réponse"; lang=fr)), "fr")

        # func_not_defined/var_not_defined also build a localized Admonition directly.
        @test has_lang(html_of(func_not_defined(sin, ru)), "ru")
        @test has_lang(html_of(var_not_defined(:x, ru)), "ru")

        # code_for_check_type_funcs (eval'd into a notebook) builds its "type error"
        # admonitions from a raw Markdown.Admonition, a separate path from wrap_lang's
        # normal callers above; make sure it is wrapped too.
        eval(Meta.parse(PlutoTeachingTools.code_for_check_type_funcs))
        result = check_type_isa(:x, missing, Int, ru) # exercises the "missing" branch (still_missing, already covered)
        @test result.passed == false
        result = check_type_isa(:x, "not an int", Int, ru) # exercises the Admonition-building branch
        @test has_lang(html_of(result.msg), "ru")
        # Use a Vector{Type} `t` here: the scalar-`t` branch of check_type_eq has a
        # pre-existing unrelated bug (references an undefined `type` variable) that
        # is out of scope for this WCAG fix.
        result = check_type_eq(:x, 1.0, [Int], ru)
        @test has_lang(html_of(result.msg), "ru")
    end
end
