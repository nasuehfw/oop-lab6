\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursework}[2026/05/04 ONPU course work (rgr) class file v1.1]


% ------------------------------------------------------------
%    Preload packages before the base class specification
%  (some packages must be loaded after class specification)
% ------------------------------------------------------------
\RequirePackage{calc}			% calc dimensions
\RequirePackage{ifthen}			% if-then-else logic
\RequirePackage{etoolbox}		% advanced commands manipulations
\RequirePackage{tabularray}		% tables
\RequirePackage{setspace}		% text spacing (between lines)
\RequirePackage{graphicx}		% figures
\RequirePackage[normalem]{ulem}	% underlines
\RequirePackage{nameref}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}


% ------------------------------------------------------------
%				       Package Options
% ------------------------------------------------------------
% Don't unse minted package
%\newif\ifnominted
%\nomintedfalse
%\DeclareOption{nominted}{ \nomintedtrue }
\ProcessOptions\relax


% ------------------------------------------------------------
%			      Specify base document class
% ------------------------------------------------------------
\LoadClass[14pt, a4paper]{extarticle}




% ------------------------------------------------------------
%	 Load the packages after the base class specification
% ------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{polyglossia}

\RequirePackage[titles]{tocloft}				% table of contents + list of figures and tables
\RequirePackage{titlesec}					% configure sections behavior
\RequirePackage{enumitem}
\RequirePackage{xurl}

\RequirePackage[
    figurewithin=section,
    tablewithin=section,
    labelsep=period,
    tableposition=top
]{caption}									% captions for figures, listings etc
\RequirePackage{subcaption}					% subcaptions for multiple figures
\RequirePackage{floatrow}

\RequirePackage[a4paper,
    left=25mm,
    right=10mm,
    top=20mm,
    bottom=20mm,
    headsep=18pt,
    heightrounded
]{geometry}

\RequirePackage[
    backend=biber,
    bibencoding=auto,
    style=ieee,
    language=auto, %autobib
    sorting=none,
    isbn=false
]{biblatex}								   	% Bibliography

\RequirePackage[a-3u]{pdfx}

\selectcolormodel{natural}
\RequirePackage{ninecolors}
\selectcolormodel{rgb}
\RequirePackage{tabularray}






% ------------------------------------------------------------
%	  Provide fallback commands for optional packages
% ------------------------------------------------------------
\providecommand\phantomsection{} % hyperref
\providecommand\hypersetup[1]{}  % hyperref



% ------------------------------------------------------------
%	              Title page configuration commangs
% ------------------------------------------------------------
\def\university#1{\def\@university{#1}}
\def\ministry#1{\def\@ministry{#1}}
\def\department#1{\def\@department{#1}}

\def\worktype#1{\def\@worktype{#1}}
\def\discipline#1{\def\@discipline{#1}}
\newcommand{\tutor}[2][male]{\def\@tutorgender{#1}\def\@tutor{#2}}

\renewcommand{\author}[2][male]{\def\@gender{#1}\def\@author{#2}}
\def\group#1{\def\@group{#1}}
\def\course#1{\def\@course{#1}}
\def\speciality#1{\def\@speciality{#1}}
\def\variant#1{\def\@variant{#1}\def\@title{}}


\def\city#1{\def\@city{#1}}
\def\year#1{\def\@year{#1}}

% Set default values using class commands
\ministry{Міністерство освіти і науки України}
%\worktype{Курсова робота}
\worktype{Лабораторна робота №5}

% =================================================================
% 					Behavior configuration
% =================================================================

% Language & Fonts
\setmainlanguage{ukrainian}
\setotherlanguage{english}

\newfontfamily\ukrainianfont{Times New Roman}[Ligatures=TeX]
\newfontfamily\englishfont{Times New Roman}[Ligatures=TeX]

\setmainfont{Times New Roman}
\newfontfamily\cyrillicfont{Times New Roman}[Ligatures=TeX]
\newfontfamily\cyrillicfonttt[Scale=MatchLowercase]{Courier New}


% Link colors
\hypersetup{
    colorlinks = false,
    pdfborder={0 0 0}
}


% Dimensions 
% ------------------------------------------------------------
\setlength{\parindent}{1.25cm}

%\fontsize{14pt}{16.8pt}
%\onehalfspacing
%\linespread{1} 
%\setstretch{1.25}

%\fontsize{14pt}{25.2pt}
%\selectfont



%
% Baseline spacing:
%
% spacing_requirement = 1.5
% base_font_spacing = 1.2 
% font_size = 14
% 
% spacing = spacing_requirement * base_fontspacing * font_size
%
% normal: 14 * 1.2 * 1.5 = 25.2
% small: 12 * 1.2 * 1.5 = 21.6
% large: 16 * 1.2 * 1.5 = 28.8
%
\iffalse
    \renewcommand\normalsize{%
        \@setfontsize\normalsize{14pt}{25.2pt}%
    }

    \renewcommand\small{%
        \@setfontsize\small{12pt}{21.6pt}%
    }

    \renewcommand\large{%
        \@setfontsize\large{16pt}{28.8pt}%
    }
\fi

\renewcommand\normalsize{%
    \@setfontsize\normalsize{14pt}{20.16pt}%
}

\renewcommand\small{%
    \@setfontsize\small{12pt}{17.28pt}%
}

\renewcommand\large{%
    \@setfontsize\large{16pt}{23.04pt}%
}

\onehalfspacing

%\normalfont

\newlength{\skiplinespace}
\setlength{\skiplinespace}{\baselineskip}  %1.81em
\newcommand{\skipline}{\vspace{\skiplinespace}}
% ------------------------------------------------------------ behavior/spacings


% Sections and subsections
% ------------------------------------------------------------
\AddToHook{cmd/section/before}{\clearpage} % sections from new page (clear page to flush the floats)

\renewcommand{\thesection}{\arabic{section}} % use roman numbers for sections: I, II, III
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}} % use arabic numbers for subsections: 1.1, 1.2, 1.3, ...


% Defile styles for sections, subsections and subsubsubsections
\titleformat
{\section}[block] % command and shape
{\normalsize\upshape\bf\selectfont\centering} % format
{\thesection~} % label 
{6pt} % horizontal separation 10pt
{\MakeUppercase} % before code

\titleformat
{\subsection}[block]  % command and shape
{\normalsize\upshape\bf\selectfont} % format
{\hphantom{abcde}\thesubsection} % label, spacing hack
{10pt} % horizontal separation
{} % before code


\titleformat
{name=\subsection, numberless}[block]  % command and shape
{\normalsize\upshape\bf\selectfont}    % format
{} % label, spacing hack
{0pt} % horizontal separation
{\hphantom{abcde}} % before code


\titleformat
{\subsubsection}[block]  % command and shape
{\normalsize\upshape\bf\selectfont} % format
{\hphantom{abcde}\thesubsubsection} % label, spacing hack
{10pt} % horizontal separation
{} % before code



\iffalse
    %\titlespacing{\subsection}{\parindent}{*4}{*1.5}
    \titlespacing*{\section}
    {0pt}   % left indent
    {0pt}    % space above
    {\skiplinespace}   % space **below**

    \titlespacing*{\subsection}
    {0pt}   % left indent
    {\skiplinespace}    % space above
    {\skiplinespace}   % space **below**

    \titlespacing*{\subsubsection}
    {0pt}   % left indent
    {\skiplinespace}    % space above
    {\skiplinespace}   % space **below**
\fi



% Test spacings

%\titlespacing{\subsection}{\parindent}{*4}{*1.5}
\titlespacing*{\section}
{0pt}   % left indent
{0pt}    % space above
{1.8em plus 0.5em minus 0.2em}   % space **below**

\titlespacing*{\subsection}
{0pt}   % left indent
{1.8em plus 0.5em minus 0.2em}    % space above
{1.8em plus 0.5em minus 0.2em}   % space **below**

\titlespacing*{\subsubsection}
{0pt}   % left indent
{0pt}    % space above
{0pt}   % space **below**








\newcommand{\switchSectionNamingToAppendix}{%
    \titleformat%
    {\section}[block]% command and shape
    {\normalsize\upshape\bfseries\selectfont\centering}% format
    {ДОДАТОК \thesection:}% label 
    {10pt} % horizontal separation 10pt
    {\MakeUppercase}% before code
    \renewcommand{\thesection}{\Alph{section}} % use roman numbers for sections: I, II, III
    \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}} % use arabic numbers for subsections: 1.1, 1.2, 1.3, ...
}



\newcommand{\sectionn}[1]{
    \section*{#1}
    \addtotoc{section}{#1}
}

\newcommand{\secsummary}{
    \subsection*{Висновки до розділу \thesection}
    \addtotoc{subsection}{\hphantom{0.000}Висновки до розділу \thesection}
}


\newcommand{\summary}{
    \section*{Загальні висновки}
    \addtotoc{section}{Загальні висновки}
}
% ------------------------------------------------------------ behavior/sections and subsections



% Captions
% ------------------------------------------------------------
\newcommand{\fakeindent}{\hphantom{abcde}}
\captionsetup[figure]{name=Рисунок}
\captionsetup[table]{name={\fakeindent}Таблиця}
\captionsetup[listing]{name={\fakeindent}Лістинг}


\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}} % make caption numbers for figures in the format section.subsection
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}  % make caption numbers for tables in the format section.subsection

\newcommand{\switchFigureNumberingToAppendix}{%
    \renewcommand{\thefigure}{\Alph{section}.\arabic{figure}}% make caption numbers for figures in the format section.subsection
    \renewcommand{\thetable}{\Alph{section}.\arabic{table}}% make caption numbers for tables in the format section.subsection
}



% Table captions
%\captionsetup[type=table]{position=top}
%\usepackage[tableposition=top]{caption}
\floatsetup[table]{capposition=top}

\captionsetup[table]{justification=raggedright, singlelinecheck=false}
\captionsetup[listing]{justification=raggedright, singlelinecheck=false}

%\setlength{\captionmargin}{\parindent}

\floatstyle{plaintop}

\setlength{\textfloatsep}{1.81em}
\setlength{\intextsep}{1.81em}
\setlength{\floatsep}{1.81em}


%\newfloat{listing}{htbp}{lol} % Define 'listing' float if not already defined
%\floatname{listing}{Listing}
%\floatsetup[listing]{capposition=top}

%\captionsetup[listing]{position=top}
% Listing captions
%\captionsetup[lstlisting]{captionpos=top}


\captionsetup{labelsep=none, format=plain} % Turn off default separator

\DeclareCaptionLabelFormat{dash}{#1~#2~\textendash~}
\captionsetup{labelformat=dash}


% wtf is this?
\DeclareFloatSeparators{mysep}{\vspace{3em}}
\floatsetup[figure]{capposition=bottom, floatrowsep=mysep, capbesidesep=mysep}


%\captionsetup[figure]{labelfont={color={magenta},bf}}


% ------------------------------------------------------------ behavior/captions

% Table of contents entries
% ------------------------------------------------------------
% make prefix "РОЗДІЛ" before and ":" after the section numbers in the table of contents
%\def\@tocsectionname{РОЗДІЛ}
%\renewcommand{\cftsecpresnum}{\@tocsectionname~}
%\renewcommand\cftsecaftersnum{:}
%\renewcommand{\cftsecaftersnumb}{\hspace*{2.65cm}} %hanging indent for sections that take up more than one line (level 2)
%\renewcommand{\cftsecaftersnumb}{\hphantom{РОЗДІЛX}} %hanging indent for sections that take up more than one line (level 2)

%\setlength\cftparskip{-2pt}
\setcounter{tocdepth}{2}
\setlength\cftbeforesecskip{0pt}

\renewcommand\cftsecfont{\normalfont} 			% section font
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand\cftsecleader{\cftdotfill{4}} 	% fill dots: section ..... page
% ------------------------------------------------------------ behavior/table of contents


% Blbliography
% ------------------------------------------------------------
% Howto: https://mirrors.ibiblio.org/CTAN/macros/latex/contrib/biblatex/doc/biblatex.pdf

% No quotes in title
\DeclareFieldFormat
[article,book,misc,inbook,incollection,inproceedings,patent,thesis,unpublished]
{title}{#1}


% remove braces [ ] in list  
\DeclareFieldFormat{labelnumberwidth}{#1\adddot}
\setlength\bibindent{0em}

\defbibenvironment{bibliography}
{\list
    {%
        \printfield{prefixnumber}%
        \printfield{labelnumber}\addperiod}
    {\setlength{\labelwidth}{\labelnumberwidth}%
        \setlength{\leftmargin}{0cm}%
        \setlength{\labelsep}{10pt}%
        \addtolength{\leftmargin}{0cm}%
        \setlength{\itemindent}{\parindent}%       % Shift entry text to left
        \addtolength{\itemindent}{\labelwidth}%
        \setlength{\itemsep}{\bibitemsep}%
        \setlength{\parsep}{\bibparsep}}%
    \renewcommand*{\makelabel}[1]{\hss##1}}
{\endlist}
{\item}



\DefineBibliographyExtras{english}{\urlstyle{normal}}
\DefineBibliographyExtras{ukrainian}{\urlstyle{normal}}
\urlstyle{same}

%\renewcommand*{\bibnumfmt}[1]{#1.}
%\AtEveryBibitem{\clearfield{doi}}

\DefineBibliographyStrings{english}{pages = {p}}

\DeclareFieldFormat{volume}{#1}
\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{journaltitle}{#1}



\DeclareBibliographyDriver{misc}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \printfield{title}%
    \setunit*{\adddot\space}%
    \printfield{url}%
    \setunit*{\adddot\space}%
    \printfield{note}%
    \usebibmacro{finentry}%
}


\DeclareBibliographyDriver{article}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    % Authors
    \printnames{author}%
    \setunit{\adddot\space}%
    % Title
    \printfield{title}%
    \setunit{\addspace/\space}%
    % Journal (journaltitle)
    \printfield{journaltitle}%
    \setunit{\adddot\space}%
    % Year
    \printfield{year}.\space%\setunit{\adddot\space}%
    % Volume prefixed with "No "
    \iffieldsequal{volume}{}{}{\printfield{volume}.\space}%
    % Pages prefixed with "P. "
    \iffieldsequal{pages}{}{}{С.~\printfield{pages}\setunit{\adddot}}%
    % DOI prefixed with "DOI: "
    %\iffieldundef{doi}{}{DOI: \url{\printfield{doi}}\setunit{\adddot\space}}%
    % Note in parentheses
    \iffieldundef{note}{}{\printfield{note}}%
    \usebibmacro{finentry}%
}



\DeclareBibliographyDriver{book}{%
    \usebibmacro{bibindex}%
    \usebibmacro{begentry}%
    \printnames{author}%
    \setunit{\addperiod\space}%
    \printfield[title]{title}%
    \setunit{\addperiod\space}%
    \printlist{publisher}%
    \setunit{\addcomma\space}%
    \printdate%
    \iffieldundef{pages}
    {}
    {\setunit{\addperiod\space}\printfield{pages}\addspace{}с.}%
    \addperiod%
    \usebibmacro{finentry}%
}


\iffalse
    \DeclareBibliographyDriver{misc}{%
        \newunit
        \printfield{url}%
        \newunit
        \usebibmacro{finentry}%
        \newunit
        \printfield{note}%
    }
\fi

% ------------------------------------------------------------ behavior/bibliography



% =================================================================
%   					 		Commands
% =================================================================



% Text formatting
% ------------------------------------------------------------
\renewcommand{\emph}[1]{\textit{#1}}
\newcommand{\Emph}[1]{\textbf{\textit{#1}}}
% ------------------------------------------------------------

% Enumerations
% ------------------------------------------------------------
\newcommand*{\ukrletter}[1]{%
    \expandafter\@ukrletter\csname c@#1\endcsname%
}

\newcommand{\@ukrletter}[1]{%
    \ifcase#1 %
    \or а\or б\or в\or г\or ґ\or д\or е\or є\or ж\or з\or и\or і%
    \or ї\or й\or к\or л\or м\or н\or о\or п\or р\or с\or т\or у%
    \or ф\or х\or ц\or ч\or ш\or щ\or ь\or ю\or я\else ?%
    \fi}
\AddEnumerateCounter{\ukrletter}{\@ukrletter}{1}



\newlength{\enumitemindent}
\setlength{\enumitemindent}{\parindent}
\addtolength{\enumitemindent}{1.25em}

\newlength{\itemizeitemindent}
\setlength{\itemizeitemindent}{\parindent}
\addtolength{\itemizeitemindent}{1em}

\newlength{\doubleparindent}
\setlength{\doubleparindent}{\parindent}
\addtolength{\doubleparindent}{\parindent}

\setlist[enumerate, 1]{
    leftmargin=0pt,
    itemindent=\enumitemindent,
    label=\arabic*),
    topsep=0pt,
    parsep=0pt,
    itemsep=0pt
}

\setlist[enumerate, 2]{
    leftmargin=\parindent,
    itemindent=\enumitemindent,
    label= \ukrletter*), %\alph*),        
    topsep=0pt,
    parsep=0pt,
    itemsep=0pt
}

\setlist[enumerate, 3]{
    leftmargin=\doubleparindent,
    itemindent=\itemizeitemindent,
    label=\textendash,
    topsep=0pt,
    parsep=0pt,
    itemsep=0pt
}


\setlist[itemize, 1]{
    leftmargin=0pt,
    itemindent=\itemizeitemindent,
    label=\textendash   ,
    topsep=0pt,
    parsep=0pt,
    itemsep=0pt
}


\setlist[itemize, 2]{
    leftmargin=\parindent,
    itemindent=\itemizeitemindent,
    label=\textbullet,
    topsep=0pt,
    % itemsep=0pt,
    parsep=0pt,
    itemsep=0pt
}

\iffalse
\fi

% Temp hack
\newlist{itemize2}{itemize}{2}
\newlist{enumerate2}{enumerate}{2}
\newlist{enumerate3}{enumerate}{3}


\setlist[itemize2]{
    leftmargin=\parindent,
    itemindent=\itemizeitemindent,
    label=\textendash,
    topsep=0pt,
    itemsep=0pt
}


\setlist[enumerate2]{
    leftmargin=\parindent,
    itemindent=\enumitemindent,
    label=\arabic*),
    topsep=0pt,
    itemsep=0pt
}

\setlist[enumerate3]{
    leftmargin=\doubleparindent,
    itemindent=\itemizeitemindent,
    label=\textendash,
    topsep=0pt,
    itemsep=0pt
}

% ------------------------------------------------------------



% Table of contents
% ------------------------------------------------------------

% use to add unnumbered sections/subsections/.. to the table of contents
% for example: \addtotoc{section}{Birds and flowers}
\newcommand{\addtotoc}[2]{\phantomsection \addcontentsline{toc}{#1}{#2}}


\newcommand{\makecontents}{
    \restoregeometry
    {
        %\hypersetup{linkcolor=black}
        \tableofcontents
    }
    \clearpage
}
% ------------------------------------------------------------ commands/table of contents



% Bibliography
% ------------------------------------------------------------
\def\@bibsecname{Список використаних джерел} % Bibliography section name

\newcommand{\makebibliography}{
    \phantomsection
    \printbibliography[heading=bibintoc, title={\@bibsecname}]
}
% ------------------------------------------------------------ commands/bibliography


% References
% ------------------------------------------------------------
\newcommand\figref[1]{рис.~\ref{#1}}
\newcommand\lstref[1]{лістинг~\ref{#1}}
\newcommand\tabref[1]{табл.~\ref{#1}}
% ------------------------------------------------------------ commands/references



\newcommand{\currentname}{\@currentlabelname}

\renewcommand{\appendix}{
    \switchSectionNamingToAppendix%
    \switchFigureNumberingToAppendix%
    \setcounter{section}{0}%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \setcounter{listing}{0}%
    %\addtocontents{toc}{\protect\vskip45pt}
}



\newcommand{\asection}[1]{
    \stepcounter{section}%
    \setcounter{subsection}{0}%
    \section*{Додаток~\ukrletter{section}}%
    \vspace{-\baselineskip}
    \begin{center}
        \textbf{#1}
    \end{center}
    %\section*{Додаток~\Alph{section}\hphantom{0}~#1}%  nyashbox: используются кириллица в "приложении"
    \addtotoc{section}{Додаток \MakeUppercase{\ukrletter{section}}~#1}%
}

%\newcommand{\asubsection}[1]{
%\stepcounter{subsection}%
%\section*{Додаток~\ukrletter{section}\hphantom{0}~#1}%
%\subsection*{\Alph{section}.\arabic{subsection}\hphantom{0}~#1}%    nyashbox: тут тоже
%\addtotoc{subsection}{\ukrletter{section}.\arabic{subsection}~#1}%
%}



% Page style
\fancypagestyle{diplomapagestyle}{
    \fancyhf{} % Clear header and footer
    \fancyhead[R]{{\normalfont\rmfamily\selectfont\thepage}} % Right header: page number
    \renewcommand{\headrulewidth}{0pt} % No horizontal line in header
    \renewcommand{\footrulewidth}{0pt} % No line in footer
}


% =================================================================
% 		       CALL/RENEW COMMANDS AFTER DOCUMENT BEGINS
% =================================================================
\AtBeginDocument{
    % Contents title (tocloft package)
    %\renewcommand{\contentsname}{\hfill\bfseries\Large Зміст \hfill}   
    %\renewcommand{\cfttoctitlefont}{\Large\bfseries}
    %\renewcommand{\cftaftertoctitle}{\hfill}

    % Listings (captions package)
    \renewcommand{\listingscaption}{Лістинг}
    \renewcommand{\listoflistingscaption}{Список лістингів}

    % make caption numbers for listings in the format section.subsection
    \renewcommand{\thelisting}{\arabic{section}.\arabic{listing}}

    % apply page style
    \pagestyle{diplomapagestyle}


}


% =================================================================
%                          Title page
% =================================================================
% Title page
% ------------------------------------------------------------
\renewcommand{\maketitle}{
    {
            % Set title page geometry
            \newgeometry{top=20mm, bottom=15mm, left=15mm, right=15mm}

            % Do not number the title page
            \thispagestyle{empty}

            % Select font and spacing
            \singlespacing
            \fontsize{14}{16}\upshape\mdseries\selectfont

            % Header
            {
                \begin{center}
                    \MakeUppercase
                    \@ministry \\
                    \medskip
                    \MakeUppercase
                    \@university \\
                    \medskip \smallskip
                    \@department
                \end{center}
            }

            \vspace{5.5cm}

            % Title
            {
                \begin{center}
                    {
                        \bf\selectfont
                        \MakeUppercase
                        \@worktype
                    }

                    \vspace{5mm}
                    З дисципліни: \@discipline

                    \vspace{2mm}
                    \@ifundefined{@variant}{
                        На тему: \@title
                    }
                    {
                        Варіант №\@variant
                    }
                \end{center}
            }

            % \vspace{4.5cm}
            \vfill

            % Who submitted
            {
                \fontsize{14}{24}\upshape\mdseries\selectfont
                {
                    \hfill
                    \begin{minipage}{0.55\linewidth}
                        Роботу \ifthenelse{\equal{\@gender}{female}}{виконала}{виконав}: \\
                        \ifthenelse{\equal{\@gender}{female}}{студентка}{студент}	\@course~курсу групи \@group \\
                        спеціальності \@speciality \\
                        \@author \\
                        \vphantom{1cm} \\
                        Роботу \ifthenelse{\equal{\@tutorgender}{female}}{перевірила}{перевірив}: \\
                        \@tutor \\
                        %Керівник: \
                        \vphantom{1cm} \\
                        %Національна шкала \uline{\hfill} \\
                        %Кількість балів: \uline{\hfill} 
                        Оцінка: \uline{\hfill}
                    \end{minipage}

                    %\begin{tblr}{l}
                    %    Роботу \ifthenelse{\equal{\@gender}{female}}{виконала}{виконав}: \\ 
                    %	\ifthenelse{\equal{\@gender}{female}}{студентка}{студент}	\@course~курсу групи \@group \\	
                    %	спеціальності \@speciality \\			
                    %	\@author \\
                    %	\vphantom{1cm} \\
                    %	Роботу \ifthenelse{\equal{\@tutorgender}{female}}{перевірила}{перевірив}: \\
                    %	\@tutor
                    %\end{tblr}
                }
            }

            \vfill

            % City and year
            {
                \begin{center}
                    \@city,~\@year
                \end{center}
            }

            \clearpage
            \restoregeometry
        }
}
% ------------------------------------------------------------ commands/title page
