#=
inpired by discussion and code found here
- https://hub.gke2.mybinder.org/user/fonsp-pluto-on-binder-o5onajv8/pluto/edit?id=f001628e-4bfb-11ed-04d7-892b7e9b1fe3&token=OG86wPs6Tn2cc0wPePWTPw#footnote-what_is_this
- https://github.com/JuliaPluto/PlutoUI.jl/issues/44
=#

function FootnotesInlineNumbered()
    html"""
    <script id="footnotes">
    const addNumbersToInlineFootnotes = () => {


    const inlinefootnotesNodes=document.querySelectorAll("a.footnote")
    const bottomfootnoteNodes=document.getElementsByClassName("footnote-title")


    const botttomFootnoteTextList=Array.from(bottomfootnoteNodes).map(x=>x.innerText);


    //get the inline footers inner text so that we can match up with the 
    const inlineFootnoteTextList=Array.from(inlinefootnotesNodes)
    .map(x=>x.innerText)


    //add square brackets to match the inline footnotes
    const botttomFootnoteTextListWithBrackets=botttomFootnoteTextList.map(x=>"["+x+"]");


    //find the number which we want to display inline
    var inlineFootnoteTextListWithNumbers = inlineFootnoteTextList
    .map((x,index)=>{

    const indexOfBottomFootnote = botttomFootnoteTextListWithBrackets.indexOf(x)
    const indexOfBottomFootnotePlus1 = indexOfBottomFootnote+1
    const element = inlinefootnotesNodes[index]

    //modify the element before part depending on if we find a match
    if (indexOfBottomFootnote<0) 
    {//if we don't find a match display an error
    	element.setAttribute("data-before","["+"ERROR! no matching reference"+"]")
    }
    else 
    {//if we do add the number and make the label disapear by sizing it to 0px
    	element.setAttribute("data-before","["+indexOfBottomFootnotePlus1+"]")
    }

    return indexOfBottomFootnotePlus1

    })

    }//end of function addNumbersToInlineFootnotes


    //run everytime "something" is done so that it updates dynamically/reactively
    //2022/10/28
    //all of the below was taken from Table of Contents in PlutoUI 
    const invalidated = { current: false }
    const updateCallback = () => {
    	if (!invalidated.current) {
    		addNumbersToInlineFootnotes()
    	}
    }
    updateCallback()
    setTimeout(updateCallback, 100)
    setTimeout(updateCallback, 1000)
    setTimeout(updateCallback, 5000)
    const notebook = document.querySelector("pluto-notebook")
    // We have a mutationobserver for each cell:
    const mut_observers = {
    	current: [],
    }
    const createCellObservers = () => {
    	mut_observers.current.forEach((o) => o.disconnect())
    	mut_observers.current = Array.from(notebook.querySelectorAll("pluto-cell")).map(el => {
    		const o = new MutationObserver(updateCallback)
    		o.observe(el, {attributeFilter: ["class"]})
    		return o
    	})
    }
    createCellObservers()

    // And one for the notebook's child list, which updates our cell observers:
    const notebookObserver = new MutationObserver(() => {
    	updateCallback()
    	createCellObservers()
    })
    notebookObserver.observe(notebook, {childList: true})

    // And finally, an observer for the document.body classList, to make sure that the fotnotz also works when it is loaded during notebook initialization
    const bodyClassObserver = new MutationObserver(updateCallback)
    bodyClassObserver.observe(document.body, {attributeFilter: ["class"]})
    </script>

    <style>
    a.footnote {
    	font-size: 0 !important;
    }
    a.footnote::before {
    	content: attr(data-before) ;
    	font-size: 10px;
    }
    </style>
    """
end

function FootnotesBottomNumbered()
    html"""
    <style> 
    pluto-notebook {
    counter-reset:  footnote-title;
    } 

    .footnote-title {
    font-size: 0 !important;
    }

    .footnote-title::before {
    counter-increment: footnote-title !important;
    content: "[" counter(footnote-title) "]" !important;
    font-size: 0.75rem !important;
    }
    </style>
    """
end

function FootnotesNumbered()
    combine() do Child
        @htl("""
        $(Child(FootnotesInlineNumbered()))
        $(Child(FootnotesBottomNumbered()))
        """)
    end
end

function FootnotesInlineStyleSuperscript()
    return html"""
    <style> 
    a.footnote {
    	vertical-align: super;
    }
    </style>
    """
end

function FootnotesInlineStyleSubscript()
    return html"""
    <style> 
    a.footnote {
    	vertical-align: sub;
    }
    </style>
    """
end

function FootnotesInlineStyleBaseline()
    return html"""
    <style> 
    a.footnote {
    	vertical-align: baseline;
    }
    </style>
    """
end
