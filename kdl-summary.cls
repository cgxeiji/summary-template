\ProvidesClass{kdl-summary}[2020/05/19, Eiji Onchi]

\typeout{KDL Paper Summary}
\typeout{- original by Eiji Onchi}
\typeout{- based of CHI-Extended Abstract Template}
\typeout{}
\typeout{Available at https://github.com/cgxeiji/summary-template}
\typeout{}

% Page Format

\LoadClass[10pt, a4paper, landscape]{article}[1996/10/31]

\setlength{\paperheight}{210mm}
\setlength{\paperwidth}{297mm}

\setlength{\textwidth}{200mm}
\setlength{\textheight}{160mm}

\setlength{\oddsidemargin}{40mm}
\setlength{\topmargin}{5mm}

\setlength{\columnsep}{10mm}

\setlength{\voffset}{-4mm}

\setlength{\parindent}{0pt}
\setlength{\footskip}{10mm}

\setlength{\marginparsep}{15pt}
\setlength{\marginparwidth}{40mm}

\setlength{\itemsep}{0pt}
\setlength{\parsep}{0pt}
\setlength{\topsep}{0pt}
\setlength{\parskip}{9pt}

\twocolumn
\raggedright

\renewcommand*\familydefault{\sfdefault}

\pagestyle{empty}

% End: Page Format

\RequirePackage{color}
\definecolor{linkColor}{RGB}{6,125,233}
\RequirePackage[
  colorlinks,
  citecolor=black,
  linkcolor=black,
  menucolor=black,
  urlcolor=linkColor,
  linktocpage,
  naturalnames,
  plainpages,
  breaklinks=true,
  bookmarksnumbered,
  pdfstartview={FitH},
  pdfusetitle,
  final
]{hyperref}

\def\@makeschapterhead#1{
  \vspace*{50\p@}
  {\parindent \z@ \raggedright
    \sffamily
    \interlinepenalty\@M
    \Huge\bfseries #1\par\nobreak
    \vskip 20\p@
  }
}

\def\sectionsindent{\z@}
\def\sectionsbeforeskip{-3.5ex \@plus -0.1ex \@minus -0.2ex}
\def\sectionsafterskip{0.2ex \@plus 0.01ex}
% LaTeX scheme is {name}{level}{indent}{beforeskip}{afterskip}{style}
\renewcommand\section{
  \@startsection{section}{1}{\sectionsindent}{\sectionsbeforeskip}{\sectionsafterskip}%
  {\sffamily\large\bfseries\phantomsection}
}
\renewcommand\subsection{
  \@startsection{subsection}{2}{\sectionsindent}{\sectionsbeforeskip}{\sectionsafterskip}%
  {\sffamily\normalsize\itshape\phantomsection}
}
\renewcommand\subsubsection{
  \@startsection{subsubsection}{3}{\sectionsindent}{\sectionsbeforeskip}{\sectionsafterskip}%
  %{\sffamily\MakeUppercase\small\itshape\phantomsection}
  {\sffamily\normalsize\itshape\phantomsection}
}

\usepackage[compact]{titlesec}
\titlespacing{\section}{0pt}{*0}{-9pt}
\titlespacing{\subsection}{0pt}{*0}{-9pt}
\titlespacing{\subsubsection}{0pt}{*0}{-9pt}



\renewcommand{\maketitle}{
  \begin{minipage}[b]{0.90\textwidth}
    \rule{1.10\textwidth}{3pt}
    \renewcommand\baselinestretch{0.75}
    \usefont{OT1}{phv}{bc}{n}\selectfont
    \raggedright\Huge\bfseries\@title\par
  \end{minipage}

  \vspace{1ex}

  {\footnotesize \itshape Summary by: \@author{} (\@date)\\[0ex]}
}


% Figures and Tables

\newcommand{\@tufte@margin@par}{%
  \setlength{\RaggedRightParindent}{0.5pc}%
  \setlength{\JustifyingParindent}{0.5pc}%
  \setlength{\parindent}{0.5pc}%
  \setlength{\parskip}{0pt}%
}

\RequirePackage{placeins}

\newsavebox{\@tufte@margin@floatbox}
\newenvironment{@tufte@margin@float}[2][-1.2ex]%
  {\FloatBarrier% process all floats before this point so the figure/table numbers stay in order.
  \begin{lrbox}{\@tufte@margin@floatbox}%
  \begin{minipage}{\marginparwidth}%
    %% \@tufte@caption@font%
    \def\@captype{#2}%
    \hbox{}\vspace*{#1}%
    %% \@tufte@caption@justification%
    \@tufte@margin@par%
    \noindent%
  }
  {\end{minipage}%
  \end{lrbox}%
  \marginpar{\usebox{\@tufte@margin@floatbox}}%
  }

\newenvironment{marginfigure}[1][-1.2ex]%
  {\begin{@tufte@margin@float}[#1]{figure}}
  {\end{@tufte@margin@float}}


%%
% Margin table environment

\newenvironment{margintable}[1][-1.2ex]%
  {\begin{@tufte@margin@float}[#1]{table}}
  {\end{@tufte@margin@float}}

%%
% Auto-detects the proper text alignment based on the various class options

\newcommand*{\@tufte@justification@autodetect}{%
  \ifthenelse{\boolean{@tufte@justified}}%
    {\justifying}%
    {\RaggedRight}%
}

%%
% Forces the outer edge of the caption to be set ragged.
% Therefore, on verso pages it's ragged left, and on recto pages it's ragged right.

\newcommand*{\@tufte@justification@caption@outer}{%
  \ifthenelse{\boolean{@tufte@float@recto}}%
    {\RaggedRight}%
    {\RaggedLeft}%
}

\newcommand*{\@tufte@justification@outer}{%
  \@tufte@checkoddpage%
  \ifthenelse{\boolean{@tufte@odd@page}}%
    {\RaggedRight}%
    {\RaggedLeft}%
}

% Captions
\usepackage[small,bf,sf]{caption}
\captionsetup{font={small,sf},textfont=sf,justification=raggedright}

% Compress lists
\usepackage{enumitem}
\setlist{topsep=0pt, noitemsep}

% Footnotes
% Set footones at the bottom of the pages
\usepackage[bottom]{footmisc}


% Custom Environments
\newenvironment{novelty}{%
\section*{What's So Special?}%
}{%
\pagebreak{}%
}

\newenvironment{tools}{%
\vspace*{0em}
\section*{Interesting Tools and Methods}%
}{}

\newenvironment{extra-info}{%
\section*{You Should Also Know!}%
}{}

\newcommand{\memoryicon}[1]{%
\begin{marginfigure}
    \begin{minipage}{\marginparwidth}
        \centering
        \includegraphics[width=0.9\marginparwidth]{#1}
        \caption*{Memory Icon!}
    \end{minipage}
\end{marginfigure}%
}
