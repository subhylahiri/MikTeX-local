%%  Document class for cosyne abstracts with some space saving tricks
%%
%% Requires packages: geometry, titling, titlesec, amsmath, amssymb, graphicx,
%%                    xcolor, hyperref, cleveref, etoolbox, caption, biblatex
%% Optional packages: subfigure, floatrow, wrapfig, adjustbox
%%                      (all to do with figure arrangement)
%% Options: names of optional packages + whatever article takes
%%
%% It uses biblatex, so:
%%      call biber in place of bibtex
%%      specify bib files with \addbibresource{bibfile.bib} in the preamble
%%      insert the bibliography with \printbibliography[heading=none]
%%      you can insert some space before with \vspace{0.5em} if you want
%%
%% To save extra space, try \usepackage{savetrees}
%%
%% History: 2018/11/8 v1.0      (SL) created
%--------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cosyne}[2018/3/17 v1.0 Cosyne abstract documents (SL)]
%--------------------------------------------------------------------------------
\RequirePackage{etoolbox}
\newcommand{\OptionalPackageHook}{}
\DeclareOption{subfigure}{\appto\OptionalPackageHook{%
            \RequirePackage[FIGBOTCAP,nooneline,raggedright,tight]{subfigure}}}
\DeclareOption{floatrow}{\appto\OptionalPackageHook{\RequirePackage{floatrow}}}
\DeclareOption{wrapfig}{\appto\OptionalPackageHook{\RequirePackage{wrapfig}}}
\DeclareOption{adjustbox}{\appto\OptionalPackageHook{\RequirePackage{adjustbox}}}
%--------------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\PassOptionsToClass{letterpaper,12pt,oneside,onecolumn,final}{article}
\ProcessOptions
\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[a4paper,margin=0.5in]{geometry}

\RequirePackage{titling}
\pretitle{\begin{center}\bfseries}
\posttitle{\end{center}}
\preauthor{\begin{center}}
\postauthor{\end{center}}
\predate{}
\postdate{}

\RequirePackage{titlesec}
\titleformat*{\section}{\bfseries}
\titleformat{\paragraph}[runin]{\bfseries}{\theparagraph}{0pt}{\noindent}{}

\AtBeginDocument{\pagestyle{empty}}
\appto\maketitle{\thispagestyle{empty}}
\AtEndPreamble{\date{}}

\RequirePackage{amsmath,amssymb}
\RequirePackage{caption}
\captionsetup{font=small,labelfont=bf}

\RequirePackage[bibstyle=cosyne,citestyle=numeric-comp]{biblatex}
\ExecuteBibliographyOptions{giveninits=true,terseinits=true,sorting=none}
\DeclareFieldFormat[article]{title}{}
\DeclareListFormat*{language}{}
%\renewcommand{\bibfont}{\normalfont\footnotesize}

\makeatletter
\OptionalPackageHook
\@ifpackageloaded{adjustbox}{\newcommand{\aligntop}[1]{\adjustbox{valign=t}{#1}}}{}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{cleveref}
\makeatother
