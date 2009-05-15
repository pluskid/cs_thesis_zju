% BibTeX `zjugbta' bibliography style (08-Oct-11 version)
% Adapted from the `apalike' style, version 0.1; for BibTeX version 0.99a.
% Copyright (C) 2008, all rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `zjugbta.bst'.
% This restriction helps ensure that all copies are identical.
%
% History:
%   08-Oct-11	(SK,OP)	Original version, by Wei-Wei Guo (Zhejiang University).


ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    language
    url
    number
    organization
    pages
    publisher
    school
    title
    type
    volume
    year
  }
  {}
  { label extra.label sort.label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

%					apalike needs this function because
%					the year has special punctuation;
%					apalike ignores the month
FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { write$
      ". " year * extra.label *
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}
FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {uppercase}
{ duplicate$ empty$
    { pop$ "" }
    { "\uppercase{" swap$ * "}" * }
  if$
}
FUNCTION {bib.name.font}
{ uppercase }

FUNCTION {format.etal}
{ language missing$ language empty$ or
    { " et~al" * }
    { language "chinese" =
        { " 等" * }
        { "'language' should be 'chinese' or none" cite$ * warning$ 
          " et~al" *}
      if$
     }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr 
      "{vv~}{ll}{ f{~}}{,{~}jj}" 
      format.name$ 
      bib.name.font
      't :=   % last name first
      nameptr #1 >
	{ nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
	  namesleft #1 >
	    { ", " * t * }
            { "," *
	      t "others" =
                { format.etal }
		{ " " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.key}			% this function is just for apalike
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {format.btitle}
{ title
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { language missing$ language empty$ or
       { "vol" volume tie.or.space.connect
         "volume and number" number either.or.check
       }
       { language "chinese" =
           { "卷~" volume tie.or.space.connect
             "volume and number" number either.or.check
           }
           { "'language' should be 'chinese' or none" cite$ * warning$ 
             "vol" volume tie.or.space.connect
             "volume and number" number either.or.check
           }
         if$
        }
      if$
    }
  if$
}

FUNCTION {convert.en.edition}
{ edition text.length$ #1 =
    { edition "1" =
        { "1st ed" }
        { edition "2" =
            { "2nd ed" }
            { edition "3" =
                { "3rd ed" }
                { edition "th ed" * }
              if$
            }
          if$
        }
      if$
    }
    { edition "th ed" * }
  if$
}
FUNCTION {convert.cn.edition}
{ edition "~版" * }
FUNCTION {convert.edition}
{ language missing$ language empty$ or
    { convert.en.edition }
    { language "chinese" =
       { convert.cn.edition }
       { "'language' should be 'chinese' or none" cite$ * warning$ 
         convert.en.edition }
      if$
    }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { convert.edition }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	{ "" pages n.dashify tie.or.space.connect }
	{ "" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ booktitle }
	{ format.editors ". " * booktitle * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[J]" * "title" output.check
  new.block
  format.vol.num.pages empty$
    { journal "journal" output.check }
    { journal "," * "journal" output.check }
  if$    
  format.vol.num.pages output
  new.block
  url output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      "author and editor" editor either.or.check
    }
  if$
  new.block
  output.year.check				% special for apalike
  new.block
  format.btitle "[M]" * "title" output.check
  new.block
  format.edition output
  new.block
  format.bvolume output
  new.block
  address missing$
    { skip$ }
    { address ": " * output }
  if$
  publisher "publisher" output.check
  new.block
  url output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[M]" * "title" output.check
  new.block
  address missing$
    { skip$ }
    { address ": " * output }
  if$
  howpublished output
  new.block
  url output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      "author and editor" editor either.or.check
    }
  if$
  output.year.check				% special for apalike
  new.block
  format.btitle "[M]" * "title" output.check
  new.block
  format.edition output
  new.block
  format.bvolume output
  new.block
  address missing$
    { skip$ }
    { address ": " * output }
  if$
  publisher "publisher" output.check
  new.block
  url output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[G]//" * "title" output.check
  format.in.ed.booktitle "booktitle" output.check
  new.block
  format.edition output
  new.block
  format.bvolume output
  new.sentence
  address missing$
    { skip$ }
    { address ": " * output }
  if$
  format.pages empty$
    { publisher "publisher" output.check }
    { publisher ":" * "publisher" output.check }
  if$
  format.pages output
  new.block
  url output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[C]//" * "title" output.check
  format.in.ed.booktitle "booktitle" output.check
  new.block
  format.bvolume output
  new.block
  address empty$
    { organization publisher new.sentence.checkb
      organization output
      new.block
      publisher output
      format.pages empty$
        { publisher output }
        { publisher ":" * output }
      if$
    }
    { new.sentence
      organization output
      new.block
      address ":" * output.nonnull
      format.pages empty$
        { publisher output }
        { publisher ":" * output }
      if$
    }
  if$
  format.pages output
  new.block
  url output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull
	  address output
	}
      if$
    }
    { format.authors output.nonnull }
  if$
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "[S]" * "title" output.check
  new.block
  format.edition output
  author empty$
    { organization empty$
	{ address new.block.checka
	  address * output
	}
	'skip$
      if$
    }
    { organization address new.block.checkb
      address ":" * output
      organization output
      new.block
    }
  if$
  new.block
  url output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[D]" * "title" output.check
  new.block
  language missing$ language empty$ or
    { "Master's thesis" format.thesis.type output.nonnull }
    { language "chinese" =
        { "硕士学位论文" output.nonnull }
        { "'language' should be 'chinese' or none" cite$ * warning$ 
          "Master's thesis" format.thesis.type output.nonnull }
      if$
     }
  if$
  new.block
  address empty$
    { skip$ }
    { address ":" * output }
  if$
  school "school" output.check
  new.block
  url output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title output
  new.block
  howpublished output
  new.block
  url output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "[D]" * "title" output.check
  new.block
  language missing$ language empty$ or
    { "PhD thesis" format.thesis.type output.nonnull }
    { language "chinese" =
        { "博士学位论文" output.nonnull }
        { "'language' should be 'chinese' or none" cite$ * warning$ 
          "PhD thesis" format.thesis.type output.nonnull }
      if$
     }
  if$
  new.block
  address empty$
    { skip$ }
    { address ":" * output }
  if$
  school "school" output.check
  new.block
  url output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  editor format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "[C]" * "title" output.check
  new.block
  format.bvolume output
  new.block
  address empty$
    { editor empty$
	{ publisher new.sentence.checka }
	{ organization publisher new.sentence.checkb
	  organization output
          new.block
	}
      if$
      publisher empty$
        { language missing$ language empty$ or
            { skip$ }
            { language "chinese" =
                { "[出版者不详]," output.nonnull } 
                { skip$ } 
              if$
            }
          if$
        }
        { publisher output.nonnull }
      if$
    }
    { editor empty$
	'skip$
	{ organization output }
      if$
      new.block
      address ":" * output.nonnull
      publisher empty$
        { language missing$ language empty$ or
            { skip$ }
            { language "chinese" =
                { "[出版者不详]" output.nonnull } 
                { skip$ } 
              if$
            }
          if$
        }
        { publisher output.nonnull }
      if$
     }
  if$
  new.block
  url output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  author empty$
    { organization output }
    { format.authors output.nonnull }
  if$
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[R]" * "title" output.check
  new.block
  address empty$
    { skip$ }
    { address ":" * output }
  if$
  institution "institution" output.check
  new.block
  url output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "[M]" * "title" output.check
  new.block
  language missing$ language empty$ or
    { "unpublished" output }
    { language "chinese" =
        { "[未出版]" output.nonnull } 
        { "'language' should be 'chinese' or none" cite$ * warning$ 
          "unpublished" output.nonnull }
      if$
    }
  if$
  new.block
  url output
  fin.entry
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

% There are GB/T-7714 name labels in text: one person (Jones),
% two and more (Jones et~al.).
%
FUNCTION {format.lab.names}
{ 's :=
  s #1 "{ll}" format.name$
  s num.names$
  #1 >
    { format.etal }
    { skip$ }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key					% apalike uses the whole key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    'key				% apalike uses the whole key
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key			% apalike uses the whole key, no organization
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.label			% apalike ignores organization
	'author.key.label			% for labeling and sorting
      if$
    }
  if$
  ", "							% these three lines are
  *							% for apalike, which
  year field.or.null purify$ #-1 #4 substring$		% uses all four digits
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$
      s nameptr "{ll{ }}{  f{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	{ "et al" * }
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  language missing$ language empty$ or
    { skip$ }
    { language "chinese" =
        { key missing$ key empty$ or
            { "0" swap$ * }
            { "0" key * swap$ * }
          if$
        }
        { "'language' should be 'chinese' or none" cite$ * warning$ }
      if$
    }
  if$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
	{ "to sort, need editor or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

% apalike uses two sorting passes; the first one sets the
% labels so that the `a's, `b's, etc. can be computed;
% the second pass puts the references in "correct" order.
% The presort function is for the first pass. It computes
% label, sort.label, and title, and then concatenates.
FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.sort
	'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$	% for
  'sort.label :=		% apalike
  sort.label			% style
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT		% by label, sort.label, title---for final label calculation

STRINGS { last.label next.extra }	% apalike labels are only for the text;

INTEGERS { last.extra.num }		% there are none in the bibliography

FUNCTION {initialize.extra.label.stuff}	% and hence there is no `longest.label'
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * 'label :=
  extra.label 'next.extra :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

%				Now that the label is right we sort for real,
%				on sort.label then year then title.  This is
%				for the second sorting pass.
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT		% by sort.label, year, title---giving final bibliography order

FUNCTION {begin.bib}
{ preamble$ empty$				% no \etalchar in apalike
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" write$ newline$		% no labels in apalike
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
