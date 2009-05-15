%%
%% This is file `zjuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% zjuthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2008-09-24 by Wei-Wei Guo <wwguo@zju.edu.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{cskeleton}
    [2008/10/24 v0.1 ZJU Dissertation Class]
\DeclareOption{master}{\def\zjudegree{M}}
\DeclareOption{doctor}{\def\zjudegree{D}}

\DeclareOption{authoryear}{\def\zjubibstyle{A}}
\DeclareOption{numberorder}{\def\zjubibstyle{N}}

\newif\ifzju@side\zju@sidetrue
\DeclareOption{twoside}{\zju@sidetrue}
\DeclareOption{oneside}{\zju@sidefalse}

\ExecuteOptions{twoside,oneside}
\ProcessOptions\relax
\ifzju@side
   \LoadClass[a4paper,12pt,twoside,titlepage,openany]{book}
   \def\zjuside{T}
\else
   \LoadClass[a4paper,12pt,oneside,titlepage]{book}
   \def\zjuside{O}
\fi

\RequirePackage[top=2.0cm,bottom=2.4cm,left=3.4cm,right=2.4cm,includehead,includefoot]{geometry}

\RequirePackage{ifthen}
\RequirePackage{calc}

\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{amsthm}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

\RequirePackage[CJKnormalspaces,slantfont,boldfont]{xeCJK}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{SimSun}
\punctstyle{kaiming}


\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{nomencl}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{url}
\urlstyle{tt}

\ifthenelse{\equal{\zjubibstyle}{A}}{%
  \RequirePackage[authoryear,round,colon,sort&compress]{natbib}%
  \bibpunct{(}{)}{;}{a}{}{;}
  \bibliographystyle{zjugbay}}{}
\ifthenelse{\equal{\zjubibstyle}{N}}{%
  \RequirePackage[super,square,comma,sort&compress]{natbib}%
  \bibliographystyle{zjugbno}}{}

\RequirePackage{lscape}
\RequirePackage{graphicx}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{caption2}
\RequirePackage{multirow}
\RequirePackage{dcolumn}
\RequirePackage{colortbl}
\RequirePackage{threeparttable}
\RequirePackage{array}
\setlength{\headheight}{27pt}
\setlength{\footskip}{1.3cm}
\raggedbottom

\frenchspacing
\widowpenalty=10000
\setlength{\parskip}{0pt}

\setlength{\parindent}{2.5em}

\renewcommand{\baselinestretch}{1.6}
\renewcommand{\arraystretch}{0.6}
\addtolength{\bibsep}{-0.5em}
\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}
\DeclareRobustCommand{\bahao}{\fontsize{5pt}{\baselineskip}\selectfont}
\setCJKfamilyfont{FangSong}{FangSong_GB2312}
\setCJKfamilyfont{HeiTi}{SimHei}
\setCJKfamilyfont{KaiShu}{KaiTi_GB2312}
\setCJKfamilyfont{LiShu}{LiSu}
\setCJKfamilyfont{SongTi}{SimSun}
\setCJKfamilyfont{YouYuan}{YouYuan}
\DeclareRobustCommand{\fangsong}{\CJKfamily{FangSong}}
\DeclareRobustCommand{\heiti}{\CJKfamily{HeiTi}}
\DeclareRobustCommand{\kaiti}{\CJKfamily{KaiShu}}
\DeclareRobustCommand{\lishu}{\CJKfamily{LiShu}}
\DeclareRobustCommand{\songti}{\CJKfamily{SongTi}}
\DeclareRobustCommand{\youti}{\CJKfamily{YouYuan}}
\setcounter{secnumdepth}{4}

\titleformat{\chapter}[hang]%
  {\xiaosan\bfseries}{\thechapter}{1em}{}{}
\titlespacing{\chapter}%
  {0pt}{0.3\baselineskip}{0.3\baselineskip}
\titlecontents{chapter}[1.5em]{}%
  {\contentslabel{1.5em}}{\hspace{-1.5em}}{\titlerule*[10pt]{.}\contentspage}

\titleformat{\section}[hang]%
  {\sihao\bfseries}{\thesection}{1em}{}{}
\titlespacing{\section}%
  {0pt}{0.2\baselineskip}{0.2\baselineskip}
\titlecontents{section}[2.2em]{}%
  {\contentslabel{2.2em}}{\hspace{-3.2em}}{\titlerule*[10pt]{.}\contentspage}

\titleformat{\subsection}[hang]%
  {\xiaosi}{\thesubsection}{1em}{}{}
\titlespacing{\subsection}%
  {0pt}{0.1\baselineskip}{0.1\baselineskip}
\titlecontents{subsection}[3.0em]{}%
  {\contentslabel{3.0em}}{\hspace{-5.0em}}{\titlerule*[10pt]{.}\contentspage}

\titleformat{\subsubsection}[hang]%
  {\xiaosi}{\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}%
  {0pt}{0.0\baselineskip}{0.0\baselineskip}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\ifzju@side
  \fancypagestyle{plain}{
    \fancyhead[LE]{%
      \ifthenelse{\equal{\zjudegree}{D}}{\xiaowu\songti 浙江大学博士学位论文}{}%
      \ifthenelse{\equal{\zjudegree}{M}}{\xiaowu\songti 浙江大学硕士学位论文}{}%
    }
    \fancyhead[RO]{\xiaowu\songti\leftmark}
    \fancyfoot[LE,RO]{\xiaowu\thepage}}
  \fancyhead[LE]{%
      \ifthenelse{\equal{\zjudegree}{D}}{\xiaowu\songti 浙江大学博士学位论文}{}%
      \ifthenelse{\equal{\zjudegree}{M}}{\xiaowu\songti 浙江大学硕士学位论文}{}%
  }
  \fancyhead[RO]{\xiaowu\songti\leftmark}
  \fancyfoot[LE,RO]{\xiaowu\thepage}
\else
  \fancypagestyle{plain}{
    \fancyhead[L]{%
      \ifthenelse{\equal{\zjudegree}{D}}{\xiaowu\songti 浙江大学博士学位论文}{}%
      \ifthenelse{\equal{\zjudegree}{M}}{\xiaowu\songti 浙江大学硕士学位论文}{}%
    }
    \fancyhead[R]{\xiaowu\songti\leftmark}
    \fancyfoot[C]{\xiaowu\thepage}}
  \fancyhead[L]{%
      \ifthenelse{\equal{\zjudegree}{D}}{\xiaowu\songti 浙江大学博士学位论文}{}%
      \ifthenelse{\equal{\zjudegree}{M}}{\xiaowu\songti 浙江大学硕士学位论文}{}%
  }
  \fancyhead[R]{\xiaowu\songti\leftmark}
  \fancyfoot[C]{\xiaowu\thepage}
\fi
\renewcommand{\contentsname}{\centerline{目\quad 录}}
\renewcommand{\listfigurename}{\centerline{图~目~录}}
\renewcommand{\listtablename}{\centerline{表~目~录}}
\setcounter{tocdepth}{1}  % 设置目录的深度到 subsection
\renewcommand{\bibname}{参~考~文~献}
\renewcommand{\nomname}{\centerline{术~语~表}}
\renewcommand{\nomlabelwidth}{25mm}
\renewcommand{\nompreamble}{\vspace{1em}}
\makenomenclature
\renewcommand{\figurename}{图} % 插图题头
\renewcommand{\tablename}{表} % 插表题头
\renewcommand{\captionlabeldelim}{} %% 定义如 "图(表)1: 示例" 中的间隔符号,如 ":" ,这里定义为空
\renewcommand{\captionlabelsep}{\hspace{1em}} %定义图表编号与标题间的间隔距离
\setlength{\belowcaptionskip}{2mm}
\renewcommand{\footnotesize}{\xiaowu}
\addtolength{\skip\footins}{2mm plus 2mm}
\renewcommand{\@makefnmark}{\mbox{\textsuperscript{\textcircled{\tiny\@thefnmark}}}}
\newcommand{\citezp}[2][]{\citep{#2}\textsuperscript{#1}}
\newcommand{\citezt}[2][]{\citet{#2}\textsuperscript{#1}}
\newcommand{\citez}[2][]{\cite{#2}\textsuperscript{#1}}
\newtheoremstyle{zjutheorem}
   {9pt}{9pt}{\ttfamily}{0pt}{\lishu}{：}{0pt}{}
\theoremstyle{zjutheorem}
\newtheorem{hypo}{假设~}[chapter]
\newtheorem{defin}{定义~}[chapter]
\newtheorem{theo}{定理~}[chapter]
\newtheorem{pro}{证明~}[chapter]
\newcolumntype{.}{D{.}{.}{2.4}}
\AtBeginDocument{%
   \makeatletter
   \input{zjuthesis.cfg}
   \makeatother}
\endinput
%%
%% End of file `zjuthesis.cls'.
