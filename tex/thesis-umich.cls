%%
%% This is the file thesis-umich.cls.
%% It provides a LaTeX class that is consistent with the guidelines
%% provided by the Rackham Graduate School as described at
%%   <http://www.rackham.umich.edu/downloads/
%%               oard-dissertation-format-guidelines.pdf>
%%
%% This class is based on the LaTeX template provided at
%%   <http://aoss.engin.umich.edu/pages/current/dissertation-template>
%%
%% The correct usage of this template is to use it as a documentclass.
%% The first line of the .tex file should be
%%
%%     \documentclass{thesis-umich}
%%
%% if this file is in the same directory as the .tex file.  If the
%% two files are not in the same directory, the relative path from
%% the .tex file to this .cls file should be provided.  For example,
%% if the document is called thesis-dalle.tex and this file,
%% thesis-umich.cls is in a subfolder called 'tex', the command
%% should be
%%
%%     \documentclass{./tex/thesis-umich}
%%
%% An example is distributed with this file that demonstrates all
%% of the features of the template.  The example is in a file called
%% thesis-sample.tex.
%%

%% VERSIONS:
%%  1988.01.01 @Jin Ji            : Initial version; reportx.sty
%%  1988.05.19 @Jin Ji            : Unrecorded changes
%%  1988.12.13 @Jin Ji            : Corrected table of contents to show
%%                                  "CHAPTER" and also \@makecaption
%%  1989.01.08 @Jin Ji            : Corrections for section headers
%%  1989.11.29 @?                 : Removed a spurious command
%%  1992.07.24 @Roque D. Oliveira : Modified \startappendices to work
%%                                  with the New Font Selection Scheme.
%%  2008.09.01 @Jason Gilbert     : Obsolete code removed for
%%                                  compatibility with LaTeX2e; list of
%%                                  abbreviations added, made copyright
%%                                  page cleaner, fixed appendices, 
%%                                  bibliography, margins, title page,
%%                                  frontispiece, bottom-center page
%%                                  numbers, two-side printing, added
%%                                  in-dissertation abstract and
%%                                  abstract that prints at the end.
%%  2011.04.09 @Derek Dalle       : Convert rac.sty --> thesis.umich.cls
%%

%% ---- HEADERS --------------------------------------------------------
% This prevents the compiler from running on old versions of LaTeX.
\NeedsTeXFormat{LaTeX2e}

% This command gives the name of the class.
\ProvidesClass{thesis-umich}[2011/04/09 Thesis template]

%% ---- OPTIONS PROCESSING ---------------------------------------------
% Define three switches for the the thesis format types.
% The variables are \@umich@thesis and \@umich@report.
% The default values are false.
\newif\if@umich@thesis
\newif\if@umich@report
\newif\if@umich@listoffigures
\newif\if@umich@listoftables
\newif\if@umich@listofmaps
\newif\if@umich@listofappendices
\newif\if@umich@listofabbrevs
\newif\if@umich@copyright

% Set the default value of some of the options to true.
\@umich@thesistrue
\@umich@listoffigurestrue
\@umich@listoftablestrue
\@umich@copyrighttrue

% This declares a variable for using an index.
% An index is not allowed in dissertations.
\newif\if@umich@index

% This makes an option for bibliography backrefs.
\newif\if@umich@backref

% Declare options for the overall layout.
\DeclareOption{thesis}{\@umich@thesistrue}
\DeclareOption{report}{\@umich@reporttrue}

% Declare options for which lists are present.
\DeclareOption{listfigures=true}{\@umich@listoffigurestrue}
\DeclareOption{listfigures=false}{\@umich@listoffiguresfalse}
\DeclareOption{listtables=true}{\@umich@listoftablestrue}
\DeclareOption{listtables=false}{\@umich@listoftablesfalse}
\DeclareOption{listmaps=true}{\@umich@listofmapstrue}
\DeclareOption{listmaps=false}{\@umich@listofmapsfalse}
\DeclareOption{listappendices=true}{\@umich@listofappendicestrue}
\DeclareOption{listappendices=false}{\@umich@listofmapsfalse}
\DeclareOption{listabbrevs=true}{\@umich@listofabbrevstrue}
\DeclareOption{listabbrevs=false}{\@umich@listofabbrevsfalse}

% Declare option for copyright page.
\DeclareOption{copyright=true}{\@umich@copyrighttrue}
\DeclareOption{copyright=false}{\@umich@copyrightfalse}

% Declare an option for the index.
\DeclareOption{index}{\@umich@indextrue}

% Declare an option for bibliography backrefs.
\DeclareOption{backref}{\@umich@backreftrue}


% This passes any other options on to the 'report' class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}%
 \typeout{Unknown option: passing ``\CurrentOption"
  option on to the standard LaTeX report class.}}
% This command tells LaTeX to simply process the class options.
\ProcessOptions

% This control structure calls the standard LaTeX report.cls class.
% The base font size should be 10pt unless using the submit option.
\if@umich@report
 % Call the report class with 10pt fonts and two-sided formatting.
 \LoadClass[letterpaper,10pt,twoside]{report}
\else
 % Call the report class with 12pt fonts and one-sided formatting.
 \LoadClass[letterpaper,12pt,oneside]{report}
\fi

% Make sure the index is off for 'thesis'.
\if@umich@thesis
 \@umich@indexfalse
\fi


%% ---- PACKAGE LOADING ------------------------------------------------
% This class uses the geometry.sty package to set the margins.
\if@umich@report
 % Use a 1-inch margin for all four sides for the report version.
 \RequirePackage[margin=1in,footskip=8pt,headsep=0.4cm,%
  headheight=\baselineskip]{geometry}
 % This sets the distance between columns.
 \setlength{\columnsep}{0.3in}
\else
 % Use the standard margins for the thesis version.
 \RequirePackage[margin=1in,left=1.5in, %
  headheight=0.5\baselineskip]{geometry}
\fi

% This loads the required math packages.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% This loads the proper graphics package.
\RequirePackage{graphicx}

% This is useful for complex figures.
\RequirePackage{subfigure}

% This changes the font.
\RequirePackage{times}

% This package allows the ability to create a 'code' environment.
\RequirePackage{verbatim}

% This hopefully tells verbatim to leave my damn quotes alone.
\RequirePackage{upquote}

% This package enables the use of proper single quotes in text.
\RequirePackage{textcomp}

% This package is used to set line spacing.
\RequirePackage{setspace}

% This package allows conditional testing of varibles.
\RequirePackage{ifthen}

% This package is used for silly letter spacing
\RequirePackage{soul}

% This package is for the index, if it is to be used.
\if@umich@index
 \RequirePackage{makeidx}
 \makeindex
\fi

% This is the package for special headers and footers.
\RequirePackage{fancyhdr}

% This package will allow for some sections to be in
% different numbers of columns.
\if@umich@report
 \RequirePackage{multicol}
\fi


%% ---- FORMATTING -----------------------------------------------------
% Set the page style to fancy.
\pagestyle{fancy}
% This command runs at the beginning of each chapter.
% It puts the name of the chapter into the 'leftmark' parameter.
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
% This command runs at the beginning of each section.
% It puts the number and name of the section into the 'rightmark' param.
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

% Clear the current header and footer.
\fancyhf{}

% Set the header and footer for normal pages.
\if@umich@report
 \fancyhead[LE,RO]{\bfseries\thepage}
 \fancyhead[LO]{\bfseries\rightmark}
 \fancyhead[RE]{\bfseries\leftmark}
\else
 % Simply put the page number at the bottom center.
 \fancyfoot[C]{\thepage}
 % Get rid of the line at the top.
 \renewcommand{\headrulewidth}{0pt}
\fi

% This sets the headers and footers for less-marked pages.
% Example: beginning of each chapter.
\fancypagestyle{plain}{%
% Get rid of the headers on plain pages.
 \fancyhead{} %
 % And also any line.
 \renewcommand{\headrulewidth}{0pt}
 \fancyfoot[C]{\thepage}
}


%% ---- PAGE STYLES ----------------------------------------------------
% This \ttlpg is the same as \titlepage in report.sty.
% It is used here to set the low-level style of front pages.
\newcommand*{\ttlpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % No headers or footers on titlepage
 \thispagestyle{empty}
 % This sets the page counter.
 \c@page \z@ %
}

% Same idea as \ttlpg above but with page numbers
\newcommand*{\frntpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % Regular headers and footers
 \thispagestyle{plain}
}


%% ---- TITLE PAGE -----------------------------------------------------
% The fields to be used for the title page
\renewcommand{\@title}{Insert a Title!}
\renewcommand{\@author}{Insert an Author!}
\newcommand{\@degree}{Doctor of Philosophy}
\newcommand{\@department}{Insert a Department Name!}
\newcommand{\@committee}{Insert a Committee!}

% Commands to set the titlepage fields
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\committee}[1]{\renewcommand{\@committee}{#1}}

% Commands for the user to be able to use the defined fields.
\newcommand{\inserttitle}{\@title}
\newcommand{\insertauthor}{\@author}
\newcommand{\insertdegree}{\@degree}
\newcommand{\insertdepartment}{\@department}
\newcommand{\insertcommittee}{\@committee}

% This redefines the title page to automatically have all of the
% features and properties that it should according to the guidelines.
\renewcommand*{\titlepage}{
 % Insert the titlepage formatting.
 \ttlpg %
 % Use single-spaced lines for the title page.
 \begin{singlespace} %
  % Move down the page slightly.
  \hbox{\vspace{0.3in}} %
  % Center the title page as well.
  \begin{center} %
   % Put the title itself in 1.5-spaced format.
   \begin{onehalfspacing}
    % Insert the title.
    {\Large\bfseries\inserttitle} %
   \end{onehalfspacing} \\[4ex] %
   % Vertical rubber space
%   \vfill %
   % Print the word 'by'.
   by \\[2ex] %
   % Insert the author
   \insertauthor \\ %
   % More rubber space
   \vfill %
   % Text from guidelines
   A dissertation submitted in partial fulfillment \\ %
   of the requirements for the degree of \\ %
   % Name of degree
   \insertdegree \\ %
   % Department
   (\insertdepartment) \\ %
   in the University of Michigan \\ %
   % Year of completion
   \number\year %
  \end{center} %
  % More rubber space
  \vfill %
  % Non-justified content
  \begin{flushleft}
   % Heading for the committee
   \hspace{1in}Doctoral Committee: \\[2ex] %
   % Horizontal spacing
   \hspace{1.5in} %
   % Insert the committee (in a box).
   \parbox{4.2in}{\insertcommittee}
  \end{flushleft} %
 \end{singlespace} %
}


%% ---- FRONTISPIECE ---------------------------------------------------
% Command for the frontispiece
\newcommand{\@frontispiece}{\@empty}

% Command to set the frontispiece
\newcommand{\frontispiece}[1]{\renewcommand{\@frontispiece}{#1}}

% Command to insert the frontispiece
\newcommand{\insertfrontispiece}{\@frontispiece}

% Command for the frontispiece page
\newcommand*{\frontispiecepage}{ %
 % Insert the titlepage formatting.
 \ttlpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the frontispiece.
  \insertfrontispiece %
  % Vertical rubber space
  \vfill %
 \end{center} %
}


%% ---- COPYRIGHT PAGE -------------------------------------------------
% Command that holds the name of the copyright holder
\newcommand{\@copyright}{\@author}

% Command to change it from the default
\newcommand{\copyrightholder}[1]{\renewcommand{\@copyright}{#1}}

% Command to insert it
\newcommand{\insertcopyrightholder}{\@copyright}

% Command for copyright page
\newcommand*{\copyrightpage}{ %
 % Insert the titlepage formatting.
 \ttlpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the frontispiece.
  \copyright \insertcopyrightholder \\[1ex] %
  % Horizontal line
  \rule[0.5ex]{5in}{1pt} \\[1ex] %
  % The year of publication
  \number\year %
  % Vertical rubber space
  \vfill %
 \end{center} %
}


%% ---- STYLING FOR REMAINING FRONT PAGES ------------------------------
% Command to set the spacing for all-caps headings
\sodef\an{}{.6em}{1em plus1em}{2em plus.1em minus.1em}

% Command to insert front page matter with styles
\newcommand{\insertfront}[4]{ %
 % Check the value of the style.
 \ifthenelse{\equal{#2}{1}}{ %
  % Style 1: plain text
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Use single spacing.
   \begin{singlespace} %
    % Make a minipage.
    \begin{minipage}{#4\textwidth} %
     % Insert the text.
     \sloppy #1 %
    \end{minipage} %
   \end{singlespace} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{2}}{
  % Style 2: simple heading
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Use single spacing.
   \begin{singlespace} %
    % Make a minipage.
    \begin{minipage}{#4\textwidth} %
     % Heading
     \begin{center}\textbf{\textit{#3}}\end{center} %
     % Insert the text.
     \sloppy #1 %
    \end{minipage} %
   \end{singlespace} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{3}}{ %
  % Style 3: lined
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Use single spacing.
   \begin{singlespace} %
    % Make a minipage.
    \begin{minipage}{#4\textwidth}
     % Line above
     \rule[1.4ex]{\textwidth}{1pt} %
     % Insert the text.
     \sloppy #1 \\ %
     % Line below
     \rule{\textwidth}{1pt} %
    \end{minipage} %
   \end{singlespace} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 \ifthenelse{\equal{#2}{4}}{ %
  % Style 4: lined with heading
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Use single spacing.
   \begin{singlespace} %
    % Make a minipage.
    \begin{minipage}{#4\textwidth}
     % Heading
     \begin{center} \textbf{\uppercase{\an{#3}}} \end{center} %
     % Move up a bit.
     \ \\[-4ex] %
     % Line above
     \rule[1.4ex]{\textwidth}{1pt} %
     % Insert the text.
     \sloppy #1 \\ %
     % Line below
     \rule{\textwidth}{1pt} %
    \end{minipage} %
   \end{singlespace} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
  % Default style: centered
% Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Use single spacing.
   \begin{singlespace} %
    % Make a minipage.
    \begin{minipage}{0.7\textwidth} %
     % Insert the text.
     \begin{center} \sloppy #1 \end{center} %
    \end{minipage} %
   \end{singlespace} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{1}} %
 }}}} %
}


%% ---- DEDICATION PAGE ------------------------------------------------
% Command that holds the value text of the dedication
\newcommand{\@dedication}{}
% Command that sets the dedication style
\newcommand{\@dedicationstyle}{1}
% Command that sets the width of the dedication text area
\newcommand{\@dedication@width}{0.66}

% Command to change it from the default
\newcommand{\dedication}[2][]{ %
 % Set the dedication text.
 \renewcommand{\@dedication}{#2} %
 % Set the dedication style.
 \ifthenelse{\equal{#1}{}}{}{\renewcommand{\@dedicationstyle}{#1}}}
% Command to change just the dedication style
\newcommand{\dedicationstyle}[1]{\renewcommand{\@dedicationstyle}{#1}}
% Command to adjust the dedication text area width
\newcommand{\dedicationwidth}[1]{\renewcommand{\@dedication@width}{#1}}

% Command to insert it
\newcommand{\insertdedication}{\@dedication}

% Command for page with the dedication
\newcommand*{\dedicationpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Dedication}
 % Insert the text and formatting.
 \insertfront{\@dedication %
  }{\@dedicationstyle}{Dedication}{\@dedication@width}
}


%% ---- ACKNOWLEDGMENTS PAGE -------------------------------------------
% Command that holds the value text of the acknowledgments
\newcommand{\@acknowledgments}{}
% Command that sets the acknowledgments style
\newcommand{\@acknowledgmentsstyle}{2}
% Command that sets the width of the acknowledgments text area
\newcommand{\@acknowledgments@width}{0.66}

% Command to change it from the default
\newcommand{\acknowledgments}[2][]{ %
 % Set the acknowledgments text.
 \renewcommand{\@acknowledgments}{#2} %
 % Set the acknowledgments style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@acknowledgmentsstyle}{#1}}}
% Command to adjust the acknowledgments text area width
\newcommand{\acknowledgmentswidth}[1]{ %
 \renewcommand{\@acknowledgments@width}{#1}}
% Command to change just the dedication style
\newcommand{\acknowledgmentsstyle}[1]{ %
 \renewcommand{\@acknowledgmentsstyle}{#1}}

% Command to insert it
\newcommand{\insertacknowledgments}{\@acknowledgments}

% Command for page with the acknowledgments
\newcommand*{\acknowledgmentspage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Acknowledgments}
 % Insert the text and formatting.
 \insertfront{\@acknowledgments %
  }{\@acknowledgmentsstyle}{Acknowledgments}{\@acknowledgments@width}
}


%% ---- PREFACE PAGE ---------------------------------------------------
% Command that holds the value text of the preface
\newcommand{\@preface}{}
% Command that sets the preface style
\newcommand{\@prefacestyle}{2}
% Command that sets the width of the preface text area
\newcommand{\@preface@width}{0.75}

% Command to change it from the default
\newcommand{\preface}[2][]{ %
 % Set the preface text.
 \renewcommand{\@preface}{#2} %
 % Set the preface style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prefacestyle}{#1}}}
% Command to adjust the preface text area width
\newcommand{\prefacewidth}[1]{ %
 \renewcommand{\@preface@width}{#1}}
% Command to change just the preface style
\newcommand{\prefacestyle}[1]{ %
 \renewcommand{\@prefacestyle}{#1}}

% Command to insert it
\newcommand{\insertpreface}{\@preface}

% Command for page with the preface
\newcommand*{\prefacepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Preface}
 % Insert the text and formatting.
 \insertfront{\@preface %
  }{\@prefacestyle}{Preface}{\@preface@width}
}


%% ---- FOREWORD PAGE --------------------------------------------------
% Command that holds the value text of the foreword
\newcommand{\@foreword}{}
% Command that sets the foreword style
\newcommand{\@forewordstyle}{2}
% Command that sets the width of the foreword text area
\newcommand{\@foreword@width}{0.66}

% Command to change it from the default
\newcommand{\foreword}[2][]{ %
 % Set the foreword text.
 \renewcommand{\@foreword}{#2} %
 % Set the foreword style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@forewordstyle}{#1}}}
% Command to adjust the foreword text area width
\newcommand{\forewordwidth}[1]{ %
 \renewcommand{\@foreword@width}{#1}}
% Command to change just the foreword style
\newcommand{\forewordstyle}[1]{ %
 \renewcommand{\@forewordstyle}{#1}}

% Command to insert it
\newcommand{\insertforeword}{\@foreword}

% Command for page with the foreword
\newcommand*{\forewordpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Foreword}
 % Insert the text and formatting.
 \insertfront{\@foreword %
  }{\@forewordstyle}{Foreword}{\@foreword@width}
}


%% ---- PROLOGUE PAGE --------------------------------------------------
% Command that holds the value text of the prologue
\newcommand{\@prologue}{}
% Command that sets the prologue style
\newcommand{\@prologuestyle}{2}
% Command that sets the width of the prologue text area
\newcommand{\@prologue@width}{0.75}

% Command to change it from the default
\newcommand{\prologue}[2][]{ %
 % Set the prologue text.
 \renewcommand{\@foreword}{#2} %
 % Set the prologue style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prologuestyle}{#1}}}
% Command to adjust the prologue text area width
\newcommand{\prologuewidth}[1]{ %
 \renewcommand{\@prologue@width}{#1}}
% Command to change just the prologue style
\newcommand{\prologuestyle}[1]{ %
 \renewcommand{\@prologuestyle}{#1}}

% Command to insert it
\newcommand{\insertprologue}{\@prologue}

% Command for page with the prologue
\newcommand*{\prologuepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{chapter}{Prologue}
 % Insert the text and formatting.
 \insertfront{\@prologue %
  }{\@prologuestyle}{Prologue}{\@prologue@width}
}


%% ---- COMMANDS FOR LIST OF FIGURES, ETC. -----------------------------
% Commands to show each of the lists
\newcommand{\showlistoffigures}{\@umich@listoffigurestrue}
\newcommand{\showlistoftables}{\@umich@listoftablestrue}
\newcommand{\showlistofmaps}{\@umich@listofmapstrue}
\newcommand{\showlistofappendices}{\@umich@listofappendicestrue}
\newcommand{\showlistofabbreviations}{\@umich@listofabbrevstrue}

% Commands to hide each of the lists
\newcommand{\hidelistoffigures}{\@umich@listoffiguresfalse}
\newcommand{\hidelistoftables}{\@umich@listoftablesfalse}
\newcommand{\hidelistofmaps}{\@umich@listofmapsfalse}
\newcommand{\hidelistofappendices}{\@umich@listofappendicesfalse}
\newcommand{\hidelistofabbreviations}{\@umich@listofabbrevsfalse}



%% ---- TABLE OF CONTENTS ----------------------------------------------
% This sets the formatting for chapter entries in the table of contents.
\renewcommand*\l@chapter[2]{ %
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.0em} %
 % This sets the formatting for the chapter name and page number.
 {\textbf{#1}}{\textbf{#2}} %
 % Add some space below, too.
 \vskip 1ex}

% These lines set the spacing for other table of contents entries.
\renewcommand*{\l@section}{\@dottedtocline{2}{2.5em}{1.5em}}
\renewcommand*{\l@subsection}{\@dottedtocline{3}{5.0em}{1.5em}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{4}{7.5em}{1.5em}}

% Number of section layers to show in table of contents
\setcounter{tocdepth}{3}
% Number of subsection layers to allow in document
\setcounter{secnumdepth}{3}

% This sets the formatting of the table of contents.
\renewcommand*{\tableofcontents}{%
 % Move to new page.
 \newpage %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 % Add the title
 \centerline{\large\bf TABLE OF CONTENTS} %
 % Add some space after the title.
 \vspace{2ex}
 % Start the automatic table of contents features.
 \begin{singlespace}
  \@starttoc{toc}\if@restonecol\twocolumn\fi
 \end{singlespace}
}


%% ---- LIST OF FIGURES, TABLES, ETC. ----------------------------------
% This sets the formatting for the various entry types.
\renewcommand*{\l@figure}{\@dottedtocline{1}{1em}{1.5em}}
\renewcommand*{\l@table}{\@dottedtocline{1}{1em}{1.5em}}
\newcommand*{\l@map}{\@dottedtocline{1}{1em}{1.5em}}
\newcommand*{\l@appendix}{\@dottedtocline{1}{1em}{1.5em}}
\newcommand*{\l@abbreviation}{\@dottedtocline{1}{1em}{1.5em}}


%% ---- LINKS ----------------------------------------------------------
% This loads a package that allows extra colors for links.
\RequirePackage[usenames,dvipsnames]{color}
% Custom color for references.
\definecolor{DarkGreen}{rgb}{0,0.6,0}

% This will make labels and references hyperlinks.
\if@umich@backref
 % Use references in the bibliography.
 \RequirePackage[pagebackref=true]{hyperref}
\else
 % Do not use back references.
 \RequirePackage{hyperref}
\fi

% This controls some settings that affect the appearance of links.
\if@umich@thesis
 % Use black for the main links.
 \hypersetup{ %
  colorlinks=true, %
  pdfstartview={FitH}, %
  citecolor=DarkGreen, %
  linkcolor=Black, %
  urlcolor=Blue %
 }
\else
 % Use maroon for the main links.
 \hypersetup{ %
  colorlinks=true, %
  pdfstartview={FitH}, %
  citecolor=DarkGreen, %
  linkcolor=Maroon, %
  urlcolor=Blue %
 }
\fi


%% ---- INITIALIZATION -------------------------------------------------
% Commands to be placed after \begin{document}
\AtBeginDocument{ %
 % Insert a title page.
 \titlepage %
 % Insert the frontispiece if there is one.
 \ifthenelse{\equal{\@frontispiece}{}}{}{\frontispiecepage} %
 % Initialize page numbers.
 \setcounter{page}{0} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use lower-case roman numerals.
 \renewcommand{\thepage}{\roman{page}} %
 % Insert the copyright page if there is one.
 \if@umich@copyright\copyrightpage\fi
 % Insert a dedication if there is one.
 \ifthenelse{\equal{\@dedication}{}}{}{\dedicationpage} %
 % Insert the acknowledgments if there are any.
 \ifthenelse{\equal{\@acknowledgments}{}}{}{\acknowledgmentspage} %
 % Insert the preface if there is one.
 \ifthenelse{\equal{\@preface}{}}{}{\prefacepage} %
 % Insert the foreword if there is one.
 \ifthenelse{\equal{\@foreword}{}}{}{\forewordpage} %
 % Insert the prologue if there is one.
 \ifthenelse{\equal{\@prologue}{}}{}{\prologuepage} %
 % Insert the table of contents.
 \tableofcontents %
 % Insert the list of figures.
 \if@umich@listoffigures\listoffigures\fi %
 % Insert the list of tables.
 \if@umich@listoftables\listoftables\fi %
 % Insert the list of maps.
 \if@umich@listofmaps\listofmaps\fi %
 % Insert the list of appendices.
 \if@umich@listofappendices\listofappendices\fi %
 % Insert the list of abbreviations.
 \if@umich@listofabbrevs\listofabbreviations\fi %
 % Move to next page.
 \newpage
 % Restart page numbers for the chapters.
 \setcounter{page}{1} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use Arabic numerals.
 \renewcommand{\thepage}{\arabic{page}} %
 % Add the word 'Chapter' to the table of contents.
 \addtocontents{toc}{\vspace{1.5ex}\noindent %
 {\bf Chapter}\vspace{1.5ex}}
}


%%-- Table of contents and lists --
%
%
%\def\l@figure{\@dottedtocline{1}{1.0em}{3.5em}}
%\let\l@table\l@figure
%\let\l@map\l@figure
%\let\l@anything\l@figure
%\def\l@appendix{\@dottedtocline{1}{1.0em}{2.5em}}
%\let\l@abbreviation\l@figure
%
%
%\def\listoffigures{%
% \newpage
% \addcontentsline{toc}{chapter}{LIST OF FIGURES}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf LIST OF FIGURES}
% \vspace{0.7in}
% \begin{singlespace}
%  \@starttoc{lof}\if@restonecol\twocolumn\fi
%  \addtocontents{lof}{\noindent\underline{\bf Figure}\hfill\rm\protect\newline}
% \end{singlespace}
%}
%
%\def\listoftables{%
% \newpage
% \addcontentsline{toc}{chapter}{LIST OF TABLES}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf LIST OF TABLES}
% \vspace{0.7in}
% \begin{singlespace}
%  \@starttoc{lot}\if@restonecol\twocolumn\fi
%  \addtocontents{lot}{\noindent\underline{\bf Table}\hfill\rm\protect\newline}
% \end{singlespace}
%}
%
%\def\listofmaps{%
% \newpage
% \addcontentsline{toc}{chapter}{LIST OF MAPS}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf LIST OF MAPS}
% \vspace{0.7in}
% \begin{singlespace}
%  \@starttoc{lom}\if@restonecol\twocolumn\fi
%  \addtocontents{lom}{\noindent\underline{\bf Map}\hfill\rm\protect\newline}
% \end{singlespace}
%}
%
%\def\listofappendices{%
% \newpage
% \addcontentsline{toc}{chapter}{LIST OF APPENDICES}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf LIST OF APPENDICES}
% \vspace{0.7in}
% \begin{singlespace}
%  \@starttoc{loa}\if@restonecol\twocolumn\fi
%  \addtocontents{loa}{\noindent\underline{\bf Appendix}\hfill\rm\protect\newline}
% \end{singlespace}
%}
%
%\def\listofabbreviations{% Uses the acronym package -jg
% \newpage
% \addcontentsline{toc}{chapter}{LIST OF ABBREVIATIONS}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf LIST OF ABBREVIATIONS}
% \vspace{0.7in}
% \begin{singlespace}
%  \begin{acronym}
%   \input{abbr}
%  \end{acronym}
% \end{singlespace} 
%}
%
%\def\startabstractpage#1#2#3{% This formats the optional in-dissertation abstract - jg
% \newpage
% \addcontentsline{toc}{chapter}{ABSTRACT}
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \twoinmar
% \centerline{\large\bf ABSTRACT}
% \vspace{0.25in}
% \begin{center}
%  \begin{singlespace}
%   #1 \\
%  \end{singlespace}
%   by \\
%   #2 \\
% \end{center}
% \vspace{0.4in}
% \noindent #3
% \vspace{0.25in}\\
%}
%
%%-- Start chapters --
%
%\def\thechapter {\Roman{chapter}}
%\def\thesection {\@arabic\c@chapter.\@arabic\c@section}
%\def\thefigure {\@arabic\c@chapter.\@arabic\c@figure}
%\def\thetable {\@arabic\c@chapter.\@arabic\c@table}
%\def\theequation {\@arabic\c@chapter.\@arabic\c@equation}
%
%\newcounter{map}[chapter]
%\def\themap{\@arabic\c@chapter.\@arabic\c@map}
%\def\fps@map{tbp}
%\def\ftype@map{1}
%\def\ext@map{lom}
%\def\fnum@map{Map \themap}
%\def\map{\@float{map}}
%\let\endmap\end@float
%\@namedef{map*}{\@dblfloat{map}}
%\@namedef{endmap*}{\end@dblfloat}
%
%\def\startthechapters{%
% \def\@chapapp{CHAPTER}
% \addtocontents{toc}{\protect\mbox{ }\protect\newline\noindent{\bf CHAPTER}\protect\newline}
% \addtocontents{toc}{\hbox{ }}
% \clearpage % This has to be before the rest.  jj
% \if@twoside \ifodd\c@page \else \ttlpg \hbox{ }\fi\fi % For two-sided printing, make sure Chapter I starts on right-hand page. jg
% \clearpage
% \setcounter{chapter}{0}
% \setcounter{page}{1} % -- ...always begin with ii.
% \renewcommand{\thepage}{\arabic{page}}
% \pagestyle{plain}
% \def\tocname{toc}
%}
%
%\def\@chapter[#1]#2{%
% \ifnum \c@secnumdepth >\m@ne
%  \refstepcounter{chapter}
%  \typeout{\@chapapp\space\thechapter.}
%  \addtocontents{toc}{\hbox{ }}
%  \addcontentsline{toc}{chap}{\protect\numberline{\hbox{ }\hfill\bf\thechapter.\hspace{5pt}}{\bf #1}}
%  \addtocontents{toc}{\hbox{ }}
% \else
%  \addtocontents{toc}{\hbox{ }}
%  \addcontentsline{toc}{chap}{#1}
%  \addtocontents{toc}{\hbox{ }}
% \fi
% \if@twocolumn \@topnewpage[\@makechapterhead{#2}]
% \else \@makechapterhead{#2} \@afterheading \fi
%}
%
%\def\@makechapterhead#1{%
% \hbox{ }
% \twoinmar
% {\parindent 0pt \raggedright
%  \ifnum \c@secnumdepth >\m@ne
%  \centerline{\large\bf \@chapapp{} \thechapter} \par
%  \vskip 0.3in \fi
%  \begin{center}
%   \Large\bf #1
%  \end{center}
%  \nobreak \vskip 0.7in
% }
% \@afterindenttrue
%}
%
%\def\section{\@startsection{section}{1}{\z@}{3.5ex plus 1ex minus
% .2ex}{2.3ex plus .2ex}{\large\bf}}
%\def\subsection{\@startsection{subsection}{2}{\z@}{3.25ex plus 1ex minus
% .2ex}{1.5ex plus .2ex}{\normalsize\bf}}
%\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{3.25ex plus
% 1ex minus .2ex}{1.5ex plus .2ex}{\normalsize\bf}}
%
%\long\def\@caption#1[#2]#3{%
% \addtocontents{\csname ext@#1\endcsname}{\hbox{ }}
% \addcontentsline{\csname ext@#1\endcsname}{#1}{\protect\numberline{\csname
%  the#1\endcsname}{\ignorespaces\protect\small\protect\normalsize\rm #2}}
% \par
% \begingroup
%  \@parboxrestore
%  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces\protect\small\normalsize\rm #3}
%  \par
% \endgroup
%}
%
%\long\def\@makecaption#1#2{
% \vskip 10pt
% \setbox\@tempboxa\hbox{#1: #2}
% \ifdim \wd\@tempboxa >\hsize
%  \setbox\@tempboxa\hbox{#1: }
%  \def\@tempdimj{\hsize}
%  \advance\@tempdimj -\wd\@tempboxa
%  \hbox to\hsize{#1: \parbox[t]{\@tempdimj}{#2}}
% \else \hbox to\hsize{\hfill\box\@tempboxa\hfill}
% \fi}
%
%%-- Appendices and bibliography --
%
%\def\startappendices{\par
% \def\thechapter {\Alph{chapter}}
% \def\theappendix{\Alph{chapter}}
% \def\thesection{\theappendix.\arabic{section}}
% \def\theequation{{\rm \theappendix}.\arabic{equation}}
% \def\thefigure{{\rm \theappendix}.\@arabic\c@figure}
% \def\thetable{{\rm \theappendix}.\@arabic\c@table}
% \def\themap{{\rm \theappendix}.\@arabic\c@map}
%
% \setcounter{chapter}{0}
% \setcounter{section}{0}
% \def\@chapapp{APPENDIX}
% \pagestyle{plain}
% \clearpage
% \hbox{}
% \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{}\fi\fi
% \thispagestyle{chappage}
% \addcontentsline{toc}{chapter}{APPENDICES}
% \hbox{ }
% \vertadjust
% \vfill
% \centerline{\large\bf APPENDICES} % The half title page
% \vfill
%}
%
%\def\appendix#1{%
% \clearpage \global\@topnum\z@ \@afterindenttrue
% \refstepcounter{chapter}
% \typeout{\@chapapp\space\theappendix.}
% \hbox{}
% \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{}\fi\fi
% \addtocontents{loa}{\hbox{ }}
% \addcontentsline{loa}{appendix}{\protect\numberline{\theappendix.}{\ignorespaces\rm #1}}
% \hbox{ }
% \twoinmar
% \centerline{\large\bf \@chapapp{} \theappendix} \par
% \vspace{0.3in}
% \begin{center}
%  \Large\bf #1
% \end{center}
% \vspace{0.7in}
% \par\@afterindenttrue
%}
%
%\def\endofchapterbibliography{%
% \clearpage
% \hbox{ }
% \twoinmar
% \begin{center}
%  {\large \bf BIBLIOGRAPHY}
% \end{center}
% \vspace{0.75in}
%}
%
%\def\startbibliography{% This sets things up for BibTeX
% \clearpage
% \hbox{}
% \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{} \fi\fi
% \thispagestyle{chappage}
% \addcontentsline{toc}{chapter}{BIBLIOGRAPHY}
% \hbox{ }
% \vertadjust
% \vfill
% \centerline{\large\bf BIBLIOGRAPHY} % The half title page
% \vfill
% \renewcommand{\bibname}{\vspace{-.13in}\centerline{\large\bf BIBLIOGRAPHY}}
%}
%
%\def\thebibliography#1{% If using BibTeX, this code is ignored
% \clearpage
% \hbox{}
% \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{} \fi\fi
% \thispagestyle{chappage}
% \addcontentsline{toc}{chapter}{BIBLIOGRAPHY}
% \hbox{ }
% \vertadjust
% \vfill
% \centerline{\large\bf BIBLIOGRAPHY} % Half title page
% \vfill
% \newpage
% \hbox{ }
% \twoinmar
% \centerline{\large\bf BIBLIOGRAPHY}
% \vspace{0.7in}
% \list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
% \advance\leftmargin\labelsep
% \usecounter{enumi}}
% \def\newblock{\hskip .11em plus .33em minus -.07em}
% \sloppy\clubpenalty4000\widowpenalty4000
% \sfcode`\.=1000\relax}
%\let\endthebibliography=\endlist
%
%\def\startextabstractpage#1#2#3{% This formats an external Abstract that can be printed at the end of the document. Comment it out in thesis.tex when not needed. - jg
% \ttlpg
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
% \hbox{ }
% \centerline{\large\bf ABSTRACT}
% \vspace{0.25in}
% \begin{center}
%  \begin{singlespace}
%   #1 \\
%  \end{singlespace}
%   by \\
%   #2 \\
% \end{center}
% \vspace{0.4in}
% \noindent #3
% \vspace{0.25in}\\
% \pagestyle{empty}
%}