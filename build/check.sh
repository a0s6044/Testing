#!/usr/bin/env bash
# Usage: bash check.sh file.tex   -> compiles twice, reports pages, slack on last page, warnings
set -u
f="$1"; d="$(cd "$(dirname "$f")" && pwd)"; b="$(basename "$f" .tex)"
cd "$d" || exit 2
pdflatex -interaction=nonstopmode -halt-on-error "$b.tex" >/dev/null 2>&1
pdflatex -interaction=nonstopmode -halt-on-error "$b.tex" > "$b.compile.log" 2>&1
rc=$?
if [ $rc -ne 0 ]; then echo "COMPILE FAILED (rc=$rc). Errors:"; grep -A3 '^!' "$b.compile.log" | head -40; exit 1; fi
pages=$(pdfinfo "$b.pdf" | awk '/^Pages:/{print $2}')
echo "PAGES: $pages   (limit 6)"
python3 - "$b.pdf" <<'PY'
import subprocess,re,sys
pdf=sys.argv[1]
out=subprocess.run(['pdftotext','-bbox',pdf,'-'],capture_output=True,text=True).stdout
pages=out.split('<page ')[1:]
for i,p in enumerate(pages,1):
    ys=[float(m) for m in re.findall(r'yMax="([\d.]+)"',p) if float(m)<800]
    bottom=max(ys) if ys else 0
    slack=793.7-bottom
    print(f"  page {i}: text ends at {bottom:.0f}pt; slack {slack:.0f}pt (~{slack/14.5:.1f} lines of 12pt text)")
PY
echo "WARNINGS:"
grep -E "^(Overfull|Underfull) \\\\hbox|LaTeX Warning: (Reference|Citation|There were undefined)" "$b.compile.log" | head -20
echo "CITES: $(grep -o '\\cite{[^}]*}' "$b.tex" | tr ',' '\n' | sed 's/.*{//;s/}//' | sort -u | wc -l) distinct keys cited;  BIBITEMS: $(grep -c '\\bibitem' "$b.tex")"
grep -o '\\bibitem{[^}]*}' "$b.tex" | sed 's/.*{//;s/}//' | sort > /tmp/_bib_$$; grep -o '\\cite{[^}]*}' "$b.tex" | tr ',' '\n' | sed 's/.*{//;s/}//' | sort -u > /tmp/_cit_$$
echo "  bibitems never cited: $(comm -23 /tmp/_bib_$$ /tmp/_cit_$$ | tr '\n' ' ')"
echo "  cites without bibitem: $(comm -13 /tmp/_bib_$$ /tmp/_cit_$$ | tr '\n' ' ')"
rm -f /tmp/_bib_$$ /tmp/_cit_$$
