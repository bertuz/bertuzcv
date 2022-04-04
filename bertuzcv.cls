%% start of file `bertuzcv.cls'.
%% Copyright 2022 Matteo Bertamini (www.bertamini.net).
%
% This work may be distributed and/or modified under the
% conditions of the GNU General Public License v3.0,
% available at https://www.gnu.org/licenses/gpl-3.0.en.html.


%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bertuzcv}[2017/08/10 v1.0.0 lightweight modern curriculum vitae class]

%-------------------------------------------------------------------------------
%                mandatory commands before requiring packages
%-------------------------------------------------------------------------------
\LoadClass[a4paper]{article}


%-------------------------------------------------------------------------------
%                required packages
%-------------------------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{flowfram}
\RequirePackage[skins,breakable]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{xparse}
\RequirePackage{graphicx}
\usepackage[fixed]{fontawesome5}
\usepackage{luatextra}
\usepackage[utf8]{luainputenc}
\usepackage{emoji}

%-------------------------------------------------------------------------------
%                class options
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%                parameters
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%                overall design commands definitions
%-------------------------------------------------------------------------------
\definecolor{blue}{HTML}{0099cd}
\definecolor{darkgrey}{HTML}{3A3A3A}
\definecolor{lightgrey}{HTML}{696969}

%-------------------------------------------------------------------------------
%                resume style definition
%-------------------------------------------------------------------------------
\pagestyle{empty}
\geometry{a4paper, portrait, margin=1cm}
\setmainfont[Ligatures=TeX]{Lato}
\newfontfamily{\FA}{FontAwesome.otf}
\setdefaultlanguage{english}

\setstretch{1.2}

\setlist[itemize]{label=\textcolor{blue}{\textbf{\circ}}}

%-------------------------------------------------------------------------------
%                new macros
%-------------------------------------------------------------------------------
\newtcolorbox{cvbox}[2][]{%
  blanker,
  leftupper=4cm,
  rightupper=2cm,
  after skip=1cm,
  title=\textcolor{blue}{\textbf{\uppercase{#2}}},
  breakable,
  #1
}


\newenvironment{workExp}[7]{%
  \begin{minipage}[m]{1\textwidth}
    {
      \color{darkgrey}\textbf{%
      #1\hspace{0.2cm}#2\\
      \textit{#3}\hspace{0.3cm}#4, #5\\
      #6
      }\\
    }%
    #7
}{
  \medskip
  \end{minipage}
}

\makeatletter
  \newcommand{\checknextitmarg}{\@ifnextchar\bgroup{\gobblenextitmarg}{ \end{itemize}}}
  \newcommand{\gobblenextitmarg}[1]{ \item#1\@ifnextchar\bgroup{\gobblenextitmarg}{ \end{itemize}}}

  \newcommand{\workDetails}[1]{%
      \begin{itemize}[itemsep=-5pt,partopsep=10pt]
        \item#1\checknextitmarg}

  \newcommand{\checknexteduarg}{\@ifnextchar\bgroup{\gobblenexteduarg}{}}
  \newcommand{\gobblenexteduarg}[3]{\\

  #1\\\textit{#2}\\#3\@ifnextchar\bgroup{\gobblenexteduarg}{}}

  \newcommand{\eduItm}[3]{%
        #1\\
        \textit{#2}\\
        #3
        \checknexteduarg}
\makeatother



\newcommand{\header}[5]{%
  \begin{center}
    \begin{minipage}[t]{12cm}
      \begin{center}
        \begin{tikzpicture}[baseline=0cm]
          \node[circle,draw,inner sep=1cm,fill overzoom image=photoCV] (A) {};
        \end{tikzpicture}
        \hspace{0.3cm}
        \begin{minipage}[c]{8cm}
          \vspace{0.7cm}
          {
            \huge {\color{blue}\uppercase{\textbf{#1} #2}}
          }
          \\[5pt]
          {
            \faIcon{map-marker-alt}\hspace{0.1cm}#3\\
            \faIcon{phone}\hspace{0.1cm}#4\hspace{0.1cm}\\
            \faIcon[regular]{envelope}\hspace{0.1cm}#5\\
          }
      \end{minipage}
      \end{center}
    \end{minipage}
  \end{center}

  \vspace{1cm}}

\newcommand{\twocols}[2]{%
  \begin{minipage}[t]{0.5\textwidth}
    #1
  \end{minipage}
  \begin{minipage}[t]{0.5\textwidth}
    #2
  \end{minipage}
}

% \renewcommand\labelitemi{}
