%% -----------------------------------------------------------------
%%
%% Documento de classe LaTeX para apostilas
%% Instituto Federal de Goiás
%% Autor: Raphael Gomes (raphael.gomes@ifg.edu.br)
%%
%% Baseado em: Nexus (https://github.com/alexisflesch/nexus)
%% Autor: Alexis Flesch
%%

%%==================================================================
%% Histórico de versões
%%==================================================================
% v1.0 : 30 dec 2022 ---------------------------------------------------------------------------
% - Primeira versão da classe-apostila

%%==================================================================
%% classe-apostila Class Options
%%==================================================================
\RequirePackage{ifthen}
\PassOptionsToPackage{hyphens}{url}
\DeclareOption{american,english,french,german,brazil,portuguese}{
 \PassOptionsToPackage{\CurrentOption}{babel,fancyref}}

\ProcessOptions

\def\titulo#1{\def\@titulo{#1}}                 \titulo{}
\def\subtitulo#1{\def\@subtitulo{#1}}           \subtitulo{}
\newcommand{\edicao}[2]{\def\@edicao{#1}\def\@data{#2}}
\newcommand{\coordenacao}[1]{\def\@coordenacao{#1}}
\newcommand{\autoria}[1]{\def\@autoria{#1}}
\newcommand{\revisao}[1]{\def\@revisao{#1}}

%%==================================================================
%% classe-apostila Class Identification
%%==================================================================
\newcommand{\docdate}{}  % See the renewcommands below,
\newcommand{\filedate}{} % these contain the content;-))
\newcommand{\fileversion}{}
\renewcommand{\docdate}{2022/12/27}
\renewcommand{\filedate}{2022/12/27}
\renewcommand{\fileversion}{1.0}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{formatacao/classe-apostila}%
[\filedate\space v\fileversion\space CLASSE-APOSTILA Class]
\typeout{LaTeX 2e package classe-apostila' -- Released 27 dec 2022}

%%==================================================================
%% classe-apostila Class Preliminary Declarations
%%==================================================================
\LoadClass[11pt,oneside]{book}
\RequirePackage{texnames}
\RequirePackage{lipsum}
\RequirePackage[table]{xcolor}
\RequirePackage[a4paper,left=2.5cm,right=2.5cm,bottom=2.5cm,top=2.5cm]{geometry}
\RequirePackage{exsheets}
\RequirePackage{xparse}
\RequirePackage{titlesec}

%% Fontes adicionais
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\RequirePackage{silence}
\WarningsOff[pslatex]
\RequirePackage{pslatex}
\RequirePackage{etoolbox}
\newcommand{\arial}{\sf}
\RequirePackage{calligra}

% Hyphenation
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\RequirePackage[english,portuguese,brazil]{babel} 		% Termos pré-definidos em Português
\RequirePackage{inputenc} 
\RequirePackage{ae}
\RequirePackage{lmodern}
\RequirePackage{enumitem}

%% Aspas
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\newcommand{\aspas}[1]{``{#1}''}


%% Headings
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\titleformat{\section}
{\color{\ch@p}\normalfont\Large\bfseries}
{\color{\ch@p}\thesection}{1em}{}
\titleformat{\subsection}
{\color{\ch@p}\normalfont\large\bfseries}
{\color{\ch@p}\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\color{\ch@p}\normalfont\normalsize\bfseries}
{\color{\ch@p}\thesubsubsection}{1em}{}

% Referências cruzadas
% - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -
\RequirePackage{lastpage}
\RequirePackage{ifpdf} % running on pdfTeX?
\ifpdf
 \PassOptionsToPackage{hyphens}{url}
 \RequirePackage[pdftex,pagebackref=true]{hyperref}
 \pdfadjustspacing=1    %%% force LaTeX-like character spacing
 \hypersetup{ 
    hidelinks
}
\setlength{\XeTeXLinkMargin}{-1pt}
\else
 \PassOptionsToPackage{hyphens}{url}
 \RequirePackage[dvips,breaklinks,pagebackref=true]{hyperref}
 \hypersetup{ 
    hidelinks
}
\setlength{\XeTeXLinkMargin}{-1pt}
\fi

\hypersetup{
 bookmarksopen=false,
 bookmarksnumbered=true,
 pdfstartview=FitH,
 hypertexnames=false,
 naturalnames=true,
 pdfborder = {0 0 0}
}

% Figuras
% - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - -
\RequirePackage[small,bf,up,format=hang,width=.75\textwidth]{caption}
\renewcommand{\captionfont}{\small\itshape}
\DeclareCaptionFont{ch}{\color{\ch@p}}
\captionsetup{labelfont={normalfont,ch,bf}}
\setlength{\abovecaptionskip}{0.5\abovecaptionskip}
\setlength{\belowcaptionskip}{0.5\belowcaptionskip}
\newcommand{\fontefig}[1]{
    \footnotesize
    \vspace{0.2cm}
    Fonte: #1.
}

%% Tabelas
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\RequirePackage{footnote}
\makesavenoteenv{tabular}
\makesavenoteenv{table}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{longtable}
\renewcommand\theadalign{cb}
\renewcommand\theadfont{\scriptsize}
\renewcommand\theadgape{\Gape[0.5pt]}
\renewcommand\cellgape{\Gape[0.5pt]}
\newcolumntype{M}[1]{>{\arraybackslash}m{#1}}
\newcolumntype{Z}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{N}{@{}m{0pt}@{}}
\newcommand{\fontetab}[1]{
	\centering
    \footnotesize
    Fonte: #1.
}
\newenvironment{actabular}[1]{
\rowcolors{2}{\ch@p!10}{white}
\begin{tabular}{#1}
\rowcolor{\ch@p!20}
}{
\end{tabular}
}

%%==================================================================
%% Declarations
%%==================================================================
\RequirePackage{xkeyval}
\RequirePackage{tikz}
\RequirePackage{pgf}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{framed}
\usetikzlibrary{decorations.pathmorphing,calc}
\pgfdeclarelayer{background}
\pgfsetlayers{background,main}
\pgfmathsetseed{1} % To have predictable results

\define@key{boxedtheorem}{thcounter}{\def\thcounter{#1}}
\define@key{boxedtheorem}{size}{\def\size{#1}}
\define@key{boxedtheorem}{small box style}{\def\smallboxstyle{#1}}
\define@key{boxedtheorem}{big box style}{\def\bigboxstyle{#1}}
\define@key{boxedtheorem}{spanning style}{\def\spanningstyle{#1}}
\define@key{boxedtheorem}{headfont}{\def\headfont{#1}}
\define@key{boxedtheorem}{image}{\def\image{#1}}
\define@key{boxedtheorem}{upshift}{\def\upshift{#1}}
\define@key{boxedtheorem}{rightshift}{\def\rightshift{#1}}
\define@key{boxedtheorem}{broken edges}{\def\tornstyle{#1}}
\define@key{boxedtheorem}{other edges}{\def\otheredges{#1}}
\presetkeys{boxedtheorem}{headfont=, image=logo-tex, thcounter=, small box style=,%
                            big box style=, spanning style=, size = .9\textwidth,%
                            broken edges=, other edges=,rightshift=-1.95cm,upshift=-.3cm}{}


%To expand properly \smallboxstyle, \bigboxstyle and \spanningstyle in \tikset.
\tikzset{
  execute style/.style={#1},
  execute macro/.style={execute style/.expand once=#1},
}
\newcommand{\couleurs}[1][]{%
    \setkeys{boxedtheorem}{#1}
    \tikzset{fancytitle/.style={draw=black, rectangle,right=10pt}}
    \tikzset{fancytitle/.append style={execute macro=\smallboxstyle}}
    \tikzset{mybox/.style={draw=black, rectangle, inner sep=10pt, inner ysep=20pt}}
    \tikzset{mybox/.append style={execute macro=\bigboxstyle}}
    \tikzset{formulabox/.style={draw=black, rectangle}}
    \tikzset{formulabox/.append style={execute macro=\bigboxstyle}}
    \tikzset{span/.style={black}}
    \tikzset{span/.append style={execute macro=\spanningstyle}}
    \tikzset{torn/.style={execute macro=\tornstyle}}
    \tikzset{other edges/.style={execute macro=\otheredges}}
}

%Hand drawn style : http://tex.stackexchange.com/questions/39296/simulating-hand-drawn-lines
\pgfdeclaredecoration{penciline}{initial}{%
    \state{initial}[width=+\pgfdecoratedinputsegmentremainingdistance,auto corner on length=1mm,]{%
        \pgfpathcurveto%
        {% From
            \pgfqpoint{\pgfdecoratedinputsegmentremainingdistance}%
                            {\pgfdecorationsegmentamplitude}%
        }%
        {%  Control 1
        \pgfmathrand
        \pgfpointadd{\pgfqpoint{\pgfdecoratedinputsegmentremainingdistance}{0pt}}%
                        {\pgfqpoint{-\pgfdecorationsegmentaspect\pgfdecoratedinputsegmentremainingdistance}%
                                        {\pgfmathresult\pgfdecorationsegmentamplitude}%
                        }%
        }%
        {% To 
        \pgfpointadd{\pgfpointdecoratedinputsegmentlast}{\pgfpoint{1pt}{1pt}}%
        }%
    }%
    \state{final}{}%
}



% To create a nice looking box 
% http://www.texample.net/tikz/examples/boxes-with-text-and-math/
\newsavebox{\boiboite}
\newcommand{\titre}{Titre}
\newenvironment{boite}[2][]%
    {%
    \renewcommand{\titre}{#2}
    \couleurs[#1]
    \begin{lrbox}{\boiboite}%
     \begin{minipage}[!h]{\size}
    }%
    {%
     \end{minipage}
    \end{lrbox}
    \begin{center}
    \begin{tikzpicture}
        \node[mybox] (box) {\usebox{\boiboite}};
        \node[fancytitle] at (box.north west) {\titre};
    \end{tikzpicture}
    \end{center}
    }


\newcommand{\newboxedtheorem}[4][]{%
    \couleurs[#1]
    \@ifnotempty{#4}{%
      \@ifundefined{the#4}{\@ifundefined{\thcounter}{\newcounter{#4}}{%
      \newcounter{#4}[\thcounter ]}}{}%
    }
      \newenvironment{#2}[1][]{%
      \@ifnotempty{#4}{\refstepcounter{#4}}
      \begin{boite}[#1]{{\headfont#3\@ifnotempty{#4}{ \csname the#4\endcsname}}\@ifnotempty{##1}{ \headfont(##1)}}
    }%
    {%
      \end{boite}
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Boxes with no title

\newsavebox{\boiboitedeux}
\newenvironment{notitlebox}[1][]%
    {%
      \couleurs[#1]
      \begin{lrbox}{\boiboitedeux}%
      \begin{minipage}[!h]{\size}
    }%
    {%
      \end{minipage}
      \end{lrbox}
      \begin{center}
        \begin{tikzpicture}
          \node [formulabox] (box){\usebox{\boiboitedeux}};
        \end{tikzpicture}
      \end{center}
    }

\newcommand{\newboxedequation}[2][]{%
      \couleurs[#1]
      \newenvironment{#2}[1][]{%
      \begin{notitlebox}[#1]
    }%
    {%
      \end{notitlebox}
    }
}    

%%%%%%%%%%%%%%%%%%%%%% Spanning environment (line in the margin + image)
% Macro to draw the shape behind the text, when it fits completly in the page

\def\spanframe#1{%
\tikz{%
  \node[inner xsep=1.1em] (A) {#1};% Draw the text of the node
  \begin{pgfonlayer}{background}% Draw the shape behind
  \draw[span] (A.north west) -- (A.south west);%
  \end{pgfonlayer}}}%

% Macro to draw the shape, when the text will continue in next page
\def\spanframetop#1{%
\tikz{%
  \node[inner xsep=1.1em] (A) {#1};%    % Draw the text of the node
  \begin{pgfonlayer}{background}%    
    \draw[span] (A.north west) -- (A.south west);%
  \end{pgfonlayer}}}%

% Macro to draw the shape, when the text continues from previous page
\def\spanframebottom#1{%
\tikz{%
  \node[inner xsep=1.1em] (A) {#1};%   % Draw the text of the node
  \begin{pgfonlayer}{background}%   
  \draw[span] (A.north west) -- (A.south west);%
  \end{pgfonlayer}}%
  }%

% Macro to draw the shape, when both the text continues from previous page
% and it will continue in next page
\def\spanframemiddle#1{%
\tikz{%
  \node[inner xsep=1.1em] (A) {#1};%   % Draw the text of the node
  \begin{pgfonlayer}{background}%   
  \draw[span] (A.north west) -- (A.south west);%
  \end{pgfonlayer}}}%

% Define the environment which puts the frame
% In this case, the environment also accepts an argument with an optional
% title (which defaults to ``Example'', which is typeset in a box overlaid
% on the top border

\newcommand{\newspanning}[4][]{%
    \couleurs[#1]%
    \@ifnotempty{#4}{%
      \@ifundefined{the#4}{\@ifundefined{\thcounter}{\newcounter{#4}}{%
      \newcounter{#4}[\thcounter ] }}{}%
    }
    \newenvironment{#2}[1][]{%
    \vspace{1cm}
    \couleurs[#1]
    \@ifnotempty{#4}{\refstepcounter{#4}}
    \def\FrameCommand{\spanframe}%
    \def\FirstFrameCommand{\spanframetop}%
    \def\LastFrameCommand{\spanframebottom}%
    \def\MidFrameCommand{\spanframemiddle}%
    \vskip 1.3\baselineskip%
    \MakeFramed {\FrameRestore}%
    \noindent\tikz\node[inner sep=1ex,,fill=white, %
          anchor=west, overlay] at (-2em, 2em) {\headfont#3%
          \@ifnotempty{#4}{ \csname the#4\endcsname}\@ifnotempty{##1}{ \headfont(##1)}};%
    \tikz\node[anchor=west, overlay] at (\rightshift,\upshift)%
        {\includegraphics[width=1cm]{\image}};%
    \ignorespaces%    
    }%
    {%
        \endMakeFramed%
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%  Breakable boxes
%%%%%%%%%%%%% http://www.texample.net/tikz/examples/framed-tikz/
% Macro to draw the shape behind the text, when it fits completly in the page
\def\someframe#1{
\tikz{
  \node[inner sep=8pt] (A) {#1};  % Draw the text of the node
  \noindent
  \begin{pgfonlayer}{background}  % Draw the shape behind
  \draw[mybox, other edges]
        (A.south east) -- (A.south west) -- (A.north west) -- (A.north east) -- cycle;      
  \end{pgfonlayer}}}

% Macro to draw the shape, when the text will continue in next page
\def\someframetop#1{
\tikz{
  \node[inner sep=5pt] (A) {#1};    % Draw the text of the node
  \begin{pgfonlayer}{background}    
  \draw[mybox]              % Draw the ``complete shape'' behind
        (A.south east) decorate[torn] {-- (A.south west)} 
        decorate[other edges] {-- (A.north west) -- (A.north east) -- cycle};
  \end{pgfonlayer}}}

% Macro to draw the shape, when the text continues from previous page
\def\someframebottom#1{
\tikz{
  \node[inner sep=5pt] (A) {#1};   % Draw the text of the node
  \begin{pgfonlayer}{background}   
  \draw[mybox]              % Draw the ``complete shape'' behind
        decorate[other edges] {(A.south east) -- (A.south west) -- (A.north west)}
        decorate[torn] {-- (A.north east)} decorate[other edges] {-- cycle};
  \end{pgfonlayer}}}

% Macro to draw the shape, when both the text continues from previous page
% and it will continue in next page
\def\someframemiddle#1{
\tikz{
  \node[inner sep=5pt] (A) {#1};   % Draw the text of the node
  \begin{pgfonlayer}{background}   
  \draw[mybox]              % Draw the ``complete shape'' behind
        (A.south east) decorate[torn] {-- (A.south west)} 
        decorate[other edges]{-- (A.north west)}
        decorate[torn] {-- (A.north east)} 
        decorate[other edges]{-- cycle};
  \end{pgfonlayer}}}


% Command to define a new environment that can span over multiple pages
\newcommand{\newbreakabletheorem}[4][]{%
    \couleurs[#1]%
    \@ifnotempty{#4}{%
      \@ifundefined{the#4}{\@ifundefined{\thcounter}{\newcounter{#4}}{%
      \newcounter{#4}[\thcounter ] }}{}%
    }
    \newenvironment{#2}[1][]{%
    \couleurs[#1]%
    \@ifnotempty{#4}{\refstepcounter{#4}}
    \def\FrameCommand{\someframe}%
    \def\FirstFrameCommand{\someframetop}%
    \def\LastFrameCommand{\someframebottom}%
    \def\MidFrameCommand{\someframemiddle}%
    \vskip 1.2\baselineskip
    \MakeFramed{\hsize\size\FrameRestore}
    \noindent  \tikz  \node[inner sep=1ex,anchor=west, overlay, fancytitle] at (0pt,6pt) %
        {\headfont#3 \@ifnotempty{#4}{\csname the#4\endcsname}\@ifnotempty{##1}{ \headfont(##1)}}; \par \noindent
    \ignorespaces%    
    }%
    {%
        \endMakeFramed%
    }
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%  Parchment boxes
%%%%%%%%%%%%% http://www.texample.net/tikz/examples/framed-tikz/
% Macro to draw the shape behind the text, when it fits completly in the
% page

\def\parchmentframe#1{
\tikz{
  \node[inner sep=8pt] (A) {#1};  % Draw the text of the node
  \noindent
  \begin{pgfonlayer}{background}  % Draw the shape behind
  \draw[mybox,other edges]
        (A.south east) -- (A.south west) -- (A.north west) -- (A.north east) -- cycle;      
  \end{pgfonlayer}}}

% Macro to draw the shape, when the text will continue in next page
\def\parchmentframetop#1{
\tikz{
  \node[inner sep=8pt] (A) {#1};    % Draw the text of the node
  \begin{pgfonlayer}{background}
  \draw[torn,overlay]               % Add the torn lower border
        ($(A.south east)-(0,.3)$) -- ($(A.south west)-(0,.3)$) -- 
        ($(A.south west)+(0,.4)$) -- ($(A.south east)+(0,.4)$);
  \draw[mybox,overlay]              % Draw the ``complete shape'' behind
        ($(A.south east)+(0,.1)$) decorate[torn] {-- ($(A.south west)+(0,.1)$)}
        decorate[other edges] {-- (A.north west) -- (A.north east) -- cycle};
  \end{pgfonlayer}}}

% Macro to draw the shape, when the text continues from previous page
\def\parchmentframebottom#1{
\tikz{
  \node[inner sep=8pt] (A) {#1};   % Draw the text of the node
  \begin{pgfonlayer}{background}
  \draw[torn,overlay]               % Add the torn upper border
        ($(A.north east)-(0,.4)$) -- ($(A.north west)-(0,.4)$) -- 
        ($(A.north west)+(0,.3)$) -- ($(A.north east)+(0,.3)$) -- cycle;
  \draw[mybox,overlay]              % Draw the ``complete shape'' behind
        (A.south east) decorate[other edges] {-- (A.south west) -- (A.north west) }
        decorate[torn] {-- (A.north east)} decorate[other edges] {-- cycle};
  \end{pgfonlayer}}}

% Macro to draw the shape, when both the text continues from previous page
% and it will continue in next page
\def\parchmentframemiddle#1{
\tikz{
  \node[inner sep=8pt] (A) {#1};   % Draw the text of the node
  \begin{pgfonlayer}{background}
    \draw[torn,overlay]               % Add the torn upper border
        ($(A.north east)-(0,.4)$) -- ($(A.north west)-(0,.4)$) -- 
        ($(A.north west)+(0,.3)$) -- ($(A.north east)+(0,.3)$) -- cycle;
    \draw[torn,overlay]               % Add the torn lower border
        ($(A.south east)-(0,.3)$) -- ($(A.south west)-(0,.3)$) -- 
        ($(A.south west)+(0,.4)$) -- ($(A.south east)+(0,.4)$);
  \draw[mybox,overlay]              % Draw the ``complete shape'' behind
        (A.south east) decorate[torn] { -- (A.south west)}
        decorate[other edges]{-- (A.north west)}
        decorate[torn] {-- (A.north east)} 
        decorate[other edges]{-- cycle};
  \end{pgfonlayer}}}


% Command to define a new environment that can span over multiple pages
\newcommand{\newparchment}[4][]{%
    \couleurs[#1]%
    \@ifnotempty{#4}{%
      \@ifundefined{the#4}{\@ifundefined{\thcounter}{\newcounter{#4}}{%
      \newcounter{#4}[\thcounter ] }}{}%
    }
    \newenvironment{#2}[1][]{%
    \couleurs[#1]%
    \@ifnotempty{#4}{\refstepcounter{#4}}
    \def\FrameCommand{\parchmentframe}%
    \def\FirstFrameCommand{\parchmentframetop}%
    \def\LastFrameCommand{\parchmentframebottom}%
    \def\MidFrameCommand{\parchmentframemiddle}%
    \vskip 1.2\baselineskip
    \MakeFramed{\hsize\size\FrameRestore}
    \noindent  \tikz  \node[inner sep=1ex,anchor=west, overlay, fancytitle] at (0pt,10pt) %
        {\headfont#3 \@ifnotempty{#4}{\csname the#4\endcsname}\@ifnotempty{##1}{ \headfont(##1)}}; \par \noindent
    \ignorespaces%    
    }%
    {%
        \endMakeFramed%
    }
}

%%==================================================================
%% Pre-textual elements
%%==================================================================

\newcommand{\margem}[1]{\hspace{0.5cm}\begin{minipage}[top]{13.0cm}#1\end{minipage}}
\newcommand{\textoC}[2]{\begin{center}\linespread{#1}#2\end{center}}
\newcommand{\textoF}[1]{\begin{minipage}[top]{12.0cm}#1\end{minipage}}
\newcommand{\textoD}[1]{\margem{\begin{flushright}#1\end{flushright}}}
\newcommand{\margemD}[1]{\hspace{3.5cm}\begin{minipage}[top]{10cm}#1\end{minipage}}

%% Capa
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\RequirePackage{eso-pic}
\RequirePackage{setspace}
\newcommand\BackgroundPic{
    \put(0,0){
    \parbox[b][\paperheight]{\paperwidth}{%
    \vfill
    \centering
    \includegraphics[width=\paperwidth,height=\paperheight]{formatacao/capa.pdf}
    \vfill
    }}}
\newcommand{\capa}[1]{
 \ifpdf
  \pdfbookmark[0]{Elementos Pr\'{e}-Textuais}{pretexto}
  \pdfbookmark[1]{Capa}{pretexto.1}
 \fi
 \hypersetup{
  pdftitle={\@titulo}
 }
 \AddToShipoutPicture*{\BackgroundPic}
 \doublespace
 \begin{titlepage}%
 \begin{textblock}{.5}(.07,.55)
 \begin{sloppypar}
\noindent {\Huge
    \bfseries\textcolor{black}{\@titulo}}
\end{sloppypar}
\end{textblock}
\ifthenelse{\equal{\@subtitulo}{}}{}{%
   \textoC{1.3}{} 
   \begin{textblock}{.5}(.07,#1)
 \begin{sloppypar}
\noindent {\huge
    \textcolor{black}{\@subtitulo}}
\end{sloppypar}
\end{textblock}
}%
 \normalfont%
 \end{titlepage}%
 \singlespace
 \quadros
}

\DeclareRobustCommand{\roundop}[1]{\tikz[baseline=-0.65ex]
  \node[
  circle,
  inner sep=1.5pt,
  draw=black,
  text=black,
  rounded corners=2pt]{#1};}
\newcommand{\quadros}{
\definecolor{exercicios}{HTML}{03396E}
\SetupExSheets{counter-format=ch.qu[1],counter-within=chapter,use-ref=true}

\newspanning[image=formatacao/homework,headfont=\bfseries\large\color{exercicios},%
    spanning style={very thick,decoration=penciline,decorate}]%
    {exercicios}{É hora de verificar a aprendizagem}{}

\newboxedtheorem[small box style={fill=\ch@p!20,draw=black, line width=.7pt,
                                    decoration={penciline},decorate},%
    big box style={fill=\ch@p!10,draw=black,thick, 
        decoration={penciline},decorate},
    headfont=\bfseries]%
    {definicao}{Definição}{}

\newboxedequation[big box style={fill=\ch@p!10,%
    thick,decoration=penciline,decorate}]%
    {destaque}   

\newbreakabletheorem[small box style={draw=\ch@p,fill=\ch@p!20},
    big box style={fill=\ch@p!10,draw=\ch@p},
    broken edges={decoration=zigzag},
    headfont=\bfseries]
    {leitura}{Leitura Complementar}{test}   

\newparchment[small box style={draw=orange!30!black!20,%
    fill=orange!10!black!2,decoration=penciline, decorate, thick},
    big box style={color=orange!30!black!20,fill=orange!30!black!10,thick},
    broken edges={draw=orange!30!black!20,thick,fill=orange!20!black!5, 
        decoration={random steps, segment length=.4cm,%
        amplitude=1.7mm},decorate},%
    other edges={decoration=penciline,decorate,thick},
    headfont=\bfseries]%
    {fato}{Fato Interessante}{}    

\newspanning[image=formatacao/bulb,headfont=\bfseries,%
    spanning style={very thick,decoration=penciline,decorate}]%
    {aplicacao}{Aplicação da Pesquisa}{}
}

%% Direitos
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\newcommand{\fhv}[2]{{\fontfamily{phv}\fontsize{#1}{1}\selectfont{#2}}}
\newcommand{\fhvb}[2]{{\fontfamily{phv}\fontseries{b}\fontsize{#1}{1}\selectfont{#2}}}
\newcommand{\direitos}{
\newpage
~\vfill
\thispagestyle{empty}
\noindent \textit{Coordenação geral do projeto:}

\noindent \@coordenacao

\vspace{1cm}

\noindent \textit{Elaboração do conteúdo:}

\noindent \@autoria

\vspace{1cm}

\noindent \textit{Revisão:}

\noindent \@revisao

\vspace{1cm}

\noindent 
\parbox[s]{0.35\textwidth}{Direitos reservados \copyright\ 2023}\parbox[c]{0.65\textwidth}{
 \color{gray}
 \fhv{9}{Projeto Sustentabilidade em Foco}\\
 \fhvb{10}{Programa de Pós-Graduação em Tecnologia, Gestão e Sustentabilidade do Instituto Federal de Educação, Ciência e Tecnologia de Goiás}\\
  \url{https://teclimpa.ifg.edu.br/}
 }\\\\ % 

\noindent \includegraphics[scale=0.8]{formatacao/logocc}\\
\noindent  Licença Atribuição - Não Comercial - Compartilha Igual 4.0 Internacional (CC BY-NC-SA 4.0). Você pode utilizar este arquivo em conformidade com a licença. Você pode obter uma cópia da licença em \url{https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR}. \\

\noindent \@edicao~edição, \@data. 
}


%% Prólogo
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\newcommand{\cprologo}{
\newenvironment{prologo}{%
 \ifpdf
  \pdfbookmark[1]{Prólogo}{pretexto.8}
 \fi
 \chapter*{Prólogo}
 ~
 \vspace{1.5cm}
 \begin{center}
 \begin{minipage}{0.8\textwidth}%
}{
~
\vspace{0.5cm}
\hfill{\sc \@coordenacao}   
\end{minipage}
\end{center}
\clearpage}
\input{./pre/prologo}
}

%% Bibliografia
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
\def\cc{oth}
\usepackage{backref}
\newcommand\su@ExpandTwoArgs[3]{%
  \protected@edef\su@SubString{#1}%
  \protected@edef\su@String{#2}%
  \expandafter\expandafter\expandafter#3%
  \expandafter\expandafter\expandafter{%
    \expandafter\su@SubString\expandafter
  }\expandafter{\su@String}%
}
\newcommand*\IfSubStringInString[2]{%
  \su@ExpandTwoArgs{#1}{#2}\su@IfSubStringInString
}
%%% Pacote da ABNTeX para referências dentro das normas %%%
\usepackage[alf,bibjustif,abnt-emphasize=bf,abnt-etal-cite=3,abnt-etal-text=it,abnt-etal-list=0,abnt-full-initials=yes,abnt-repeated-title-omit=yes,abnt-show-options=no,abnt-verbatim-entry=no,abnt-url-package=url]{formatacao/abntcite}
\newlength{\bibitemsep}\setlength{\bibitemsep}{.2\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{10pt}
\renewenvironment{thebibliography}[1]{%
	\chapter*{Referências Bibliográficas}
	\refstepcounter{chapter}
	\addcontentsline{toc}{chapter}{Referências Bibliográficas}
	\bigskip
  \label{referbiblio}	\list{\@biblabel{\@arabic\c@enumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth\advance\leftmargin\labelsep%
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty%
		\renewcommand\theenumiv{\@arabic\c@enumiv}%
	}%
	\sloppy
   \clubpenalty4000
   \@clubpenalty \clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m%
} 
{ 	
	\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
}
\newcommand{\bibliografia}{%
\def\cc{bib}
\bibliography{bibliografia.bib}
}


\RequirePackage{amsmath}
\RequirePackage[absolute]{textpos}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{xkeyval}
\RequirePackage{alphalph}
\RequirePackage{ifthen}
\RequirePackage{appendix}
\RequirePackage{titletoc}
\RequirePackage{etoolbox}
\AtBeginEnvironment{appendices}{%
  \addtocontents{toc}{\protect\gdef\protect\@chapapp{\protect\appendixname}}%\appendixname
}
\RequirePackage{assoccnt}
\RequirePackage{totcount}
\newtotcounter{totalchapters}
\regtotcounter{chapter}
\DeclareAssociatedCounters{chapter}{totalchapters} % Associate the driven counter `totalchapters` to the master counter `chapter`


%Width of the rectangles in the footer
\newlength{\reclength}


%Chosing the colormap
\DeclareOptionX{palette}{%
  \def\my@palette{\csname palette@#1\endcsname}}
\DeclareOptionX{reclength}{%
  \setlength{\reclength}{#1}}
\ExecuteOptionsX{reclength=.086\paperwidth}
\ExecuteOptionsX{palette=ebis}
\ProcessOptionsX

\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Some colormaps %%%%%%%%%%%%%%%%%%%%%%%%%%%
%Une palette
\newcommand{\palette@a}{
    \definecolor{chapa}{RGB}{255,153,0}
    \definecolor{chapb}{RGB}{66,66,66}
    \definecolor{chapc}{RGB}{233,233,233}
    \definecolor{chapd}{RGB}{188,188,188}
    \definecolor{chape}{RGB}{50,153,187}
}

% Munch
\newcommand{\palette@munch}{
    \definecolor{chapa}{HTML}{4D7186}
    \definecolor{chapb}{HTML}{284253}
    \definecolor{chapc}{HTML}{E0542E}
    \definecolor{chapd}{HTML}{F4A720}
    \definecolor{chape}{HTML}{EF8C12}
    \definecolor{chapf}{HTML}{4D7186}
    \definecolor{chapg}{HTML}{284253}
    \definecolor{chaph}{HTML}{E0542E}
    \definecolor{chapi}{HTML}{F4A720}
    \definecolor{chapj}{HTML}{EF8C12}
}

% Night Hill : http://www.colorschemer.com/schemes/viewscheme.php?id=8447#comments
\newcommand{\palette@nighthill}{
    \definecolor{chapa}{HTML}{5CB874}
    \definecolor{chapb}{HTML}{4D6004}
    \definecolor{chapc}{HTML}{41776A}
    \definecolor{chapd}{HTML}{4B8F92}
    \definecolor{chape}{HTML}{3E3701}
    \definecolor{chapf}{HTML}{074A5B}
    \definecolor{chapg}{HTML}{08525B}
    \definecolor{chaph}{HTML}{353D04}
    \definecolor{chapi}{HTML}{262000}
    \definecolor{chapj}{HTML}{2D717C}
    \definecolor{chaph}{HTML}{265336}
    \definecolor{chapi}{HTML}{67A3A1}
}

% Van Gogh's starry night
\newcommand{\palette@starrynight}{
    \definecolor{chapa}{HTML}{263C8B}
    \definecolor{chapb}{HTML}{4E74A6}
    \definecolor{chapc}{HTML}{BDBF78}
    \definecolor{chapd}{HTML}{BFA524}
    \definecolor{chape}{HTML}{2E231F}
    \definecolor{chapf}{HTML}{263C8B}
    \definecolor{chapg}{HTML}{4E74A6}
    \definecolor{chaph}{HTML}{BDBF78}
    \definecolor{chapi}{HTML}{BFA524}
    \definecolor{chapj}{HTML}{2E231F}
}

% One pastels : http://www.colorschemer.com/schemes/viewscheme.php?id=10746
\newcommand{\palette@onepastels}{
    \definecolor{chapa}{HTML}{FF6666}
    \definecolor{chapb}{HTML}{FF9966}
    \definecolor{chapc}{HTML}{FFCC33}
    \definecolor{chapd}{HTML}{FFFF99}
    \definecolor{chape}{HTML}{CCFF99}
    \definecolor{chapf}{HTML}{99CC66}
    \definecolor{chapg}{HTML}{99CCCC}
    \definecolor{chaph}{HTML}{0099FF}
    \definecolor{chapi}{HTML}{CC99FF}
    \definecolor{chapj}{HTML}{990099}
}

% http://www.colorschemer.com/schemes/viewscheme.php?id=10616
\newcommand{\palette@CIbase}{
    \definecolor{chapa}{HTML}{073A70}
    \definecolor{chapb}{HTML}{0080C9}
    \definecolor{chapc}{HTML}{88BCE2}
    \definecolor{chapd}{HTML}{004020}
    \definecolor{chape}{HTML}{009E2D}
    \definecolor{chapf}{HTML}{C8E1C2}
    \definecolor{chapg}{HTML}{D9AF0B}
    \definecolor{chaph}{HTML}{FECC00}
    \definecolor{chapi}{HTML}{FDE890}
    \definecolor{chapj}{HTML}{000000}
    \definecolor{chapk}{HTML}{444444}
    \definecolor{chapl}{HTML}{FFFFFF}
}
%Une autre (yellow tree frog)
\newcommand{\palette@b}{
    \definecolor{chapa}{RGB}{231, 63, 63}
    \definecolor{chapb}{RGB}{247,108,39}
    \definecolor{chapc}{RGB}{231,231,55}
    \definecolor{chapd}{RGB}{109,157,209}
    \definecolor{chape}{RGB}{126,69,211}
}

%Encore une
\newcommand{\palette@c}{
    \definecolor{chapa}{RGB}{41,0,0}
    \definecolor{chapb}{RGB}{255,0,0}
    \definecolor{chapc}{RGB}{255,89,0}
    \definecolor{chapd}{RGB}{255,147,0}
    \definecolor{chape}{RGB}{125,0,0}
}

%Un autre thème
\newcommand{\palette@d}{
    \definecolor{chapa}{HTML}{510000}
    \definecolor{chapb}{HTML}{840000}
    \definecolor{chapc}{HTML}{B70000}
    \definecolor{chapd}{HTML}{EA0000}
    \definecolor{chape}{HTML}{515100}
    \definecolor{chapf}{HTML}{848400}
    \definecolor{chapg}{HTML}{B7B700}
    \definecolor{chaph}{HTML}{EAEA00}
    \definecolor{chapi}{HTML}{512800}
    \definecolor{chapj}{HTML}{844200}
    \definecolor{chapk}{HTML}{B75B00}
    \definecolor{chapl}{HTML}{EA7500}
}

%4 seasons
\newcommand{\palette@e}{
    \definecolor{chapa}{HTML}{DE1841}
    \definecolor{chapb}{HTML}{F5861A}
    \definecolor{chapc}{HTML}{F5DE1A}
    \definecolor{chapd}{HTML}{5DD517}
    \definecolor{chape}{HTML}{1680CA}
    \definecolor{chapf}{HTML}{6016CA}
    \definecolor{chapg}{HTML}{F6451A}
    \definecolor{chaph}{HTML}{F6B41A}
    \definecolor{chapi}{HTML}{D6EB19}
    \definecolor{chapj}{HTML}{15CA7F}
    \definecolor{chapk}{HTML}{152ACA}
    \definecolor{chapl}{HTML}{CA16BD}
    \definecolor{chapm}{HTML}{CA16BD}
    \definecolor{chapn}{HTML}{CA16BD}
    \definecolor{chapo}{HTML}{CA16BD}
    \definecolor{chapp}{HTML}{CA16BD}
}

%4 seasons
\newcommand{\palette@ebis}{
    \definecolor{chapa}{HTML}{DE1841}
    \definecolor{chapb}{HTML}{F5861A}
    \definecolor{chapc}{HTML}{F5DE1A}
    \definecolor{chapd}{HTML}{5DD517}
    \definecolor{chape}{HTML}{1680CA}
    \definecolor{chapf}{HTML}{6016CA}
    \definecolor{chapg}{HTML}{F6451A}
    \definecolor{chaph}{HTML}{F6B41A}
    \definecolor{chapi}{HTML}{15CA7F}
    \definecolor{chapj}{HTML}{152ACA}
    \definecolor{chapk}{HTML}{CA16BD}
    \definecolor{chapl}{HTML}{6CACE2}
}

% Nemo
\newcommand{\palette@f}{
    \definecolor{chapa}{HTML}{9081AC}
    \definecolor{chapb}{HTML}{25D87A}
    \definecolor{chapc}{HTML}{1EC7C0}
    \definecolor{chapd}{HTML}{FFAA43}
    \definecolor{chape}{HTML}{32303A}
}

% Blank colormap to avoid errors when colormaps are to small to handle a big number of chapters.
% chapa is left undefined in order to allow fast compilation when no colormap is selected.
\newcommand{\palette@blank}{
    \definecolor{chapb}{RGB}{255,255,255}
    \definecolor{chapc}{RGB}{255,255,255}
    \definecolor{chapd}{RGB}{255,255,255}
    \definecolor{chape}{RGB}{255,255,255}
    \definecolor{chapf}{RGB}{255,255,255}
    \definecolor{chapg}{RGB}{255,255,255}
    \definecolor{chaph}{RGB}{255,255,255}
    \definecolor{chapi}{RGB}{255,255,255}
    \definecolor{chapj}{RGB}{255,255,255}
    \definecolor{chapk}{RGB}{255,255,255}
    \definecolor{chapl}{RGB}{255,255,255}
    \definecolor{chapm}{RGB}{255,255,255}
    \definecolor{chapn}{RGB}{255,255,255}
    \definecolor{chapo}{RGB}{255,255,255}
    \definecolor{chapp}{RGB}{255,255,255}
    \definecolor{chapq}{RGB}{255,255,255}
    \definecolor{chapr}{RGB}{255,255,255}
    \definecolor{chaps}{RGB}{255,255,255}
    \definecolor{chapt}{RGB}{255,255,255}
    \definecolor{chapu}{RGB}{255,255,255}
    \definecolor{chapv}{RGB}{255,255,255}
    \definecolor{chapw}{RGB}{255,255,255}
    \definecolor{chapx}{RGB}{255,255,255}
    \definecolor{chapy}{RGB}{255,255,255}
    \definecolor{chapz}{RGB}{255,255,255}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\palette@blank

%Chosing the colormap
\my@palette

%Current color is stored in \ch@p
\global\newcommand{\ch@p}{chapa}

%Command to change the current color
\global\newcommand{\ch@ngecolors}[1]{%
    %Select the color corresponding to #1 (current chapter) by redefining \ch@p
    \ifthenelse{#1=0}{\gdef\ch@p{chapa}}{}%
    \ifthenelse{#1=1}{\gdef\ch@p{chapb}}{}%
    \ifthenelse{#1=2}{\gdef\ch@p{chapc}}{}%
    \ifthenelse{#1=3}{\gdef\ch@p{chapd}}{}%
    \ifthenelse{#1=4}{\gdef\ch@p{chape}}{}%
    \ifthenelse{#1=5}{\gdef\ch@p{chapf}}{}%
    \ifthenelse{#1=6}{\gdef\ch@p{chapg}}{}%
    \ifthenelse{#1=7}{\gdef\ch@p{chaph}}{}%
    \ifthenelse{#1=8}{\gdef\ch@p{chapi}}{}%
    \ifthenelse{#1=9}{\gdef\ch@p{chapj}}{}%
    \ifthenelse{#1=10}{\gdef\ch@p{chapk}}{}%
    \ifthenelse{#1=11}{\gdef\ch@p{chapl}}{}%
    \ifthenelse{#1=12}{\gdef\ch@p{chapm}}{}%
    \ifthenelse{#1=13}{\gdef\ch@p{chapn}}{}%
    \ifthenelse{#1=14}{\gdef\ch@p{chapo}}{}%
    \ifthenelse{#1=15}{\gdef\ch@p{chapp}}{}%
    \ifthenelse{#1=16}{\gdef\ch@p{chapq}}{}%
    \ifthenelse{#1=17}{\gdef\ch@p{chapr}}{}%
    \ifthenelse{#1=18}{\gdef\ch@p{chaps}}{}%
    \ifthenelse{#1=19}{\gdef\ch@p{chapt}}{}%
    \ifthenelse{#1=20}{\gdef\ch@p{chapu}}{}%
    \ifthenelse{#1=21}{\gdef\ch@p{chapv}}{}%
    \ifthenelse{#1=22}{\gdef\ch@p{chapw}}{}%
    \ifthenelse{#1=23}{\gdef\ch@p{chapx}}{}%
    \ifthenelse{#1=24}{\gdef\ch@p{chapy}}{}%
    \ifthenelse{#1=25}{\gdef\ch@p{chapz}}{}%
}

%%%%%    Style of the decorations     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tikzset{small rectangle/.style={fill=\ch@p, rounded corners=2pt}}                                                                           %
\tikzset{rectangle for page numbering/.style={rounded corners=2pt,color=\ch@p,text=black}}                                                   %
\tikzset{big rectangle/.style={color=black,fill=white,rounded corners=5pt, line width=4pt}}                                                  %
\tikzset{title color/.style={color=white}}                                                                                                   %
\tikzset{footer style/.style={color=\ch@p,fill=\ch@p}}                                                                                       %
\tikzset{header style/.style={color=\ch@p,fill=\ch@p}}                                                                                       %
\tikzset{toc rectangle/.style={color=\ch@p,fill=\ch@p}}                                                                                      %
%% Note to self:                                                                                                                             %
% small rectangle : style of the rectangles with the chapters numbers at the bottom of the page                                              %
% big rectangle : style of the rectangle that is a little bit higher than the other ones (current chapter) at the bottom of the page         %
% title color : font color of the title in the header of the page                                                                            %
% header style : style of the rectangle in the header                                                                                        %
% footer style : style of the rectangle in the footer                                                                                        %
% toc rectangle : style of the rectangle in the TOC                                                                                          %

                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PAGE STYLE
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{15pt}
\setlength{\footskip}{50pt}

%%%%%%% Macro to draw the footer/header

\newcommand{\draw@emptyfooter}{%
    \begin{textblock}{1}(0,0.927)
        \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
            \clip(0,0) rectangle (\TPHorizModule,.119\TPHorizModule);
            \draw[black] (0,0) rectangle (\TPHorizModule,.0714\TPHorizModule); %Large rectangle spanning over the page width
        \end{tikzpicture}
    \end{textblock}
    }

\newcommand{\draw@emptyheader}[1]{%
    \begin{textblock}{1}(0,0)      
        \begin{tikzpicture}[x=1cm,y=1cm]
            \draw[black] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
            \node[black, right] at  (.2\TPHorizModule,.07\TPHorizModule) {\LARGE \bf #1};
        \end{tikzpicture}
    \end{textblock}
    }

\newcommand{\draw@chapteremptyheader}[1]{%
    \begin{textblock}{1}(0,0)
      \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
        \clip(0,0) rectangle (\TPHorizModule,.105\TPHorizModule);
        \draw[black] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
        \draw[black] (.854\TPHorizModule,0.1) rectangle (.998\TPHorizModule,.126\TPHorizModule);
        \node[scale=5]  at (.926\TPHorizModule,.055\TPHorizModule) {\thechapter};
        \node[black] at (.2\TPHorizModule,.07\TPHorizModule) {\LARGE \bf #1};
      \end{tikzpicture}
    \end{textblock}
    }    

\newcommand{\draw@chaptersemptyheader}[1]{%
    \begin{textblock}{1}(0,0)
      \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
        \clip(0,0) rectangle (\TPHorizModule,.105\TPHorizModule);
        \draw[black] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
        \node[black] at (.2\TPHorizModule,.07\TPHorizModule) {\LARGE \bf #1};
      \end{tikzpicture}
    \end{textblock}
    }      


\newcommand{\draw@footer}{%
    \ifnum\thetotalchapters>0
    \begin{textblock}{1}(0,0.927)
        \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
            \ch@ngecolors{\thetotalchapters} %Select the color corresponding to the current chapter
            \clip(0,0) rectangle (\TPHorizModule,.119\TPHorizModule);
            \draw[footer style] (0,0) rectangle (\TPHorizModule,.0714\TPHorizModule); %Large rectangle spanning over the page width
            \foreach[evaluate=\y using \x-1,evaluate=\z using \x-.5] \x in {1,...,\totvalue{totalchapters}} {
                \ch@ngecolors{\x}
                % Draw the rectangles in the footer : if \x is current chapter, draw a big rectangle, otherwise draw a small one
                \ifthenelse{\equal{\thetotalchapters}{\x}}{%
                     \draw[small rectangle] (\y\reclength,-.03\TPHorizModule) rectangle (\x\reclength,.1\TPHorizModule);
                     %Check whether current chapter is an appendinx or not and write accordingly a letter or a number in the big rectangle
                     \ifthenelse{\(\x>\totvalue{chapter}\)\and\(\totvalue{totalchapters}>\totvalue{chapter}\)}{%
                                    \node[scale=2]  at (\z\reclength,.05\TPHorizModule) {\textcolor{white}{\AlphAlph{\numexpr\x-\totvalue{chapter}}}};
                               }%
                               {%
                                    \node[scale=2]  at (\z\reclength,.05\TPHorizModule) {\textcolor{white}{\x}};
                               }%
                     \node at (\z\reclength,.05\TPHorizModule) {\hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{1.145\reclength}}}}}; %Hidden hyperlink
                }{%
                  \draw[small rectangle] (\y\reclength,.0714\TPHorizModule) rectangle (\x\reclength,0\TPHorizModule);
                  %When drawing a small rectangle, check whether it is an appendix or not and write the corresponding counter in the rectangle.
                  \ifthenelse{\(\x>\totvalue{chapter}\)\and\(\totvalue{totalchapters}>\totvalue{chapter}\)}{%
                                    \node[scale=2]  at (\z\reclength,.04\TPHorizModule) {\textcolor{white}{\AlphAlph{\numexpr\x-\totvalue{chapter}}}};
                               }%
                               {%
                                    \node[scale=2]  at (\z\reclength,.04\TPHorizModule) {\textcolor{white}{\x}};
                               }%
                \node at (\z\reclength,.036\TPHorizModule) {\hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{.85\reclength}}}}}; %Hidden hyperlink
                }
            }
          %Page number at the bottom right of the page
          \clip(0,0) rectangle (\TPHorizModule,.119\TPHorizModule); 
          \ch@ngecolors{\thetotalchapters}
          \draw[rectangle for page numbering] (.93\TPHorizModule,.0714\TPHorizModule) rectangle (\TPHorizModule,.1\TPHorizModule); %rounded corners rectangle
          \node at (.965\TPHorizModule,.0857\TPHorizModule) {{\thepage}}; %page number
        \end{tikzpicture}
    \end{textblock}
    \fi
    }

\newcommand{\draw@header}[1]{%
    \begin{textblock}{1}(0,0)      
        \begin{tikzpicture}[x=1cm,y=1cm]
            \ch@ngecolors{\thetotalchapters}
            \draw[header style] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
            \node[title color,right] at  (.05\TPHorizModule,.07\TPHorizModule) {\LARGE \bf \leftmark};
        \end{tikzpicture}
    \end{textblock}
    }
    
\newcommand{\draw@chapterheader}[1]{%
    \begin{textblock}{1}(0,0)
      \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
        \clip(0,0) rectangle (\TPHorizModule,.105\TPHorizModule);
        \ch@ngecolors{\thetotalchapters}
        \draw[header style] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
        \draw[big rectangle] (.854\TPHorizModule,0.1) rectangle (.998\TPHorizModule,.126\TPHorizModule);
        \node[scale=5]  at (.926\TPHorizModule,.055\TPHorizModule) {\textcolor{\ch@p}{\thechapter}};
        \node[title color,right] at (.05\TPHorizModule,.07\TPHorizModule) {\LARGE \bf #1};
      \end{tikzpicture}
    \end{textblock}
    }
    
\newcommand{\draw@chaptersheader}[1]{%
    \begin{textblock}{1}(0,0)
    \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
        \clip(0,0) rectangle (\TPHorizModule,.105\TPHorizModule);
        \ch@ngecolors{0}
        \draw[header style] (0,.0333\TPHorizModule) rectangle (\TPHorizModule,.105\TPHorizModule);
        \node[title color,right] at (.05\TPHorizModule,.07\TPHorizModule) {\LARGE \bf #1};
    \end{tikzpicture}
    \end{textblock}
    }

\newcommand{\draw@chaptersfooter}{%
\ifnum\thetotalchapters>0
\ifthenelse{\equal{\cc}{bib}}{}{
        \begin{textblock}{1}(0,0.927)
        \begin{tikzpicture}[x=1.0cm,y=1.0cm]%
            \ch@ngecolors{\thetotalchapters} %Select the color corresponding to the current chapter
            \clip(0,0) rectangle (\TPHorizModule,.119\TPHorizModule);
            \draw[footer style] (0,0) rectangle (\TPHorizModule,.0714\TPHorizModule); %Large rectangle spanning over the page width
            \foreach[evaluate=\y using \x-1,evaluate=\z using \x-.5] \x in {1,...,\totvalue{totalchapters}} {
                \ch@ngecolors{\x}
                % Draw the rectangles in the footer : if \x is current chapter, draw a big rectangle, otherwise draw a small one
                \ifthenelse{\equal{\thetotalchapters}{\x}}{%
                     \draw[small rectangle] (\y\reclength,-.03\TPHorizModule) rectangle (\x\reclength,.1\TPHorizModule);
                     %Check whether current chapter is an appendinx or not and write accordingly a letter or a number in the big rectangle
                     \ifthenelse{\(\x>\totvalue{chapter}\)\and\(\totvalue{totalchapters}>\totvalue{chapter}\)}{%
                                    \node[scale=2]  at (\z\reclength,.05\TPHorizModule) {\textcolor{white}{\AlphAlph{\numexpr\x-\totvalue{chapter}}}};
                               }%
                               {%
                                    \node[scale=2]  at (\z\reclength,.05\TPHorizModule) {\textcolor{white}{\x}};
                               }%
%                 \node at (\z\reclength,.036\TPHorizModule) {\hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{.85\reclength}}}}}; %Hidden hyperlink                     
                     \node[scale=2] at (\z\reclength,.05\TPHorizModule) {\textcolor{white}{\thechapter}}; %Write chapter number in the rectangle
                     \node at (\z\reclength,.05\TPHorizModule) {\hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{1.145\reclength}}}}}; %Hidden hyperlink
                }{%
                  \draw[small rectangle] (\y\reclength,.0714\TPHorizModule) rectangle (\x\reclength,0\TPHorizModule);
                  %When drawing a small rectangle, check whether it is an appendix or not and write the corresponding counter in the rectangle.
                  \ifthenelse{\(\x>\totvalue{chapter}\)\and\(\totvalue{totalchapters}>\totvalue{chapter}\)}{%
                                    \node[scale=2]  at (\z\reclength,.04\TPHorizModule) {\textcolor{white}{\AlphAlph{\numexpr\x-\totvalue{chapter}}}};
                               }%
                               {%
                                    \node[scale=2]  at (\z\reclength,.04\TPHorizModule) {\textcolor{white}{\x}};
                               }%
                \node at (\z\reclength,.036\TPHorizModule) {\hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{.85\reclength}}}}}; %Hidden hyperlink
                }
            }
        \end{tikzpicture}
    \end{textblock}
    }
    \fi
    }

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Nexus page style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{plain}{\fancyhf{}}
% \renewcommand\chaptermark[1]{bla\markboth{\textcolor{white}{#1}}{}}
\@ifundefinedcolor{chapa}{%
    \fancypagestyle{nexus}{%
        \fancyfoot{\draw@emptyfooter}%
        \fancyhead{\draw@emptyheader}{\leftmark}%
    }%
}%
{%
    \fancypagestyle{nexus}{%
        \fancyfoot{\draw@footer}%
        \fancyhead{\draw@header}%
    }%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHAPTER HEAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifundefinedcolor{chapa}{%
    \def\@makechapterhead#1{%
        \parindent 0pt%
        \draw@chapteremptyheader{#1}%
        \draw@emptyfooter%
    }%
}%
{%
    \def\@makechapterhead#1{%
        \hypertarget{chapter \thetotalchapters}{}%
        \parindent 0pt%
        \draw@chapterheader{#1}%
        \draw@footer%
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CHAPTER HEAD - STARRED VERSION (TOC) %%%%%%%%%%%%%%%%%%%%%%%
\@ifundefinedcolor{chapa}{%
    \def\@makeschapterhead#1{%
        \parindent 0pt%
        \draw@chaptersemptyheader{#1}%
        \draw@emptyfooter%
        }%
}%
{%
    \def\@makeschapterhead#1{%
        \parindent 0pt%
        \draw@chaptersheader{#1}%
        \draw@chaptersfooter%
        }%
}

\pagestyle{nexus}

%%%%%%%%%%%%%%%%% TOC



\renewcommand\chaptermark[1]{\markboth{\textcolor{white}{#1}}{}}

\renewcommand{\@pnumwidth}{3em}% To avoid a badbox for documents with more than 100 pages
\contentsmargin{-1.5cm}%


\@ifundefinedcolor{chapa}{% if colormap doesn't exist : fast compilation enabled
% Chapter style in the TOC
\titlecontents{chapter}[4pc]
{
\addvspace{30pt}%
\begin{tikzpicture}[remember picture, overlay]%
    \draw[black] (-4.2,-.1) rectangle (-.8,.5);%
    \pgftext[left,x=-3.5cm,y=0.2cm]{\color{black}\large\bfseries\sc\ \thecontentslabel};%
\end{tikzpicture}%
}%
{}
{}
{\;\titlerule\;\large\bfseries Página 
\thecontentspage
\begin{tikzpicture}[remember picture, overlay]
    \draw[black] (2pt,0) rectangle (6,0.1pt);
\end{tikzpicture}%
}%
[\addvspace{.2cm}]%
% Section style in the TOC
\titlecontents{section}[0pc]
{\addvspace{5pt}}
{
\contentslabel[\thecontentslabel]{2pc}\color{black}}
{}
{\hfill\small\thecontentspage\color{black}}
[\addvspace{3pt}]
% Subsection style in the TOC
\titlecontents*{subsection}[1pc]
{\addvspace{-1pt}\small\contentsmargin{-1cm}\normalfont\sffamily\footnotesize}
{}
{}
{}
[~{–}\ ][]
}{% If colormap exists (fast compilation disabled)
% Counter to build the TOC with the appropriate colors. Useless after TOC creation.
\newcounter{charpitre}%
% Chapter style in the TOC
\titlecontents{chapter}[4pc]
{\addvspace{30pt}%
\stepcounter{charpitre}
\ch@ngecolors{\thecharpitre}%
\ifthenelse{\equal{\thecontentslabel}{}}{}{
\begin{tikzpicture}[remember picture, overlay]%
    \draw[toc rectangle] (-4.2,-.1) rectangle (-.8,.5);%
    \node at (-2.5,0.2) {\hyperlink{chapter \thecharpitre}{\XeTeXLinkBox{\phantom{\rule{3.4cm}{.6cm}}}}}; %Hidden hyperlink    
%     \hyperlink{chapter \thecharpitre}{\tikz\draw[toc rectangle] (-4.2,-.1) rectangle (-.8,.5);}
    \pgftext[left,x=-3.5cm,y=0.2cm]{\color{white}\large\bfseries\sc\@chapapp\ %
    \thecontentslabel};%
\end{tikzpicture}%
}
\large\bfseries\color{\ch@p!80!black}}%
{}
{}
{\;\titlerule\;\large\bfseries Página 
\thecontentspage
\begin{tikzpicture}[remember picture, overlay]
    \draw[toc rectangle] (2pt,0) rectangle (6,0.1pt);
\end{tikzpicture}%
}%
[\addvspace{.2cm}]%


% Section style in the TOC
\titlecontents{section}[0pc]
{\addvspace{5pt}}
{%
\ch@ngecolors{\thecharpitre}%
\color{\ch@p!80!black}\contentslabel[\thecontentslabel]{2pc}\color{black}}
{}
{\hfill\small\color{\ch@p!80!black}\thecontentspage\color{black}}
[\addvspace{3pt}]


% Subsection style in the TOC
\titlecontents*{subsection}[1pc]
{\addvspace{-1pt}\small\contentsmargin{-1cm}\normalfont\sffamily\footnotesize}
{}
{}
{}
[~{–}\ ][]
}
% Correct spacing between page header and TOC
\renewcommand{\tableofcontents}{%
\chapter*{\contentsname}%
\markboth{\contentsname}{}
% \def\@leftmark{\contentsname}%
\vspace{-30pt}%
\@starttoc{toc}}

% \hyperlink{chapter \x}{\XeTeXLinkBox{\phantom{\rule{\reclength}{1.145\reclength}}}}