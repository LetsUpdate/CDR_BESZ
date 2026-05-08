# PDF mode (pdflatex)
$pdf_mode = 1;

# Biber futtatasa biblatex-hez
$bibtex_use = 2;

# makeglossaries futtatasa az out/ mappaban
add_cus_dep("glo", "gls", 0, "run_makeglossaries");
add_cus_dep("acn", "acr", 0, "run_makeglossaries");

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    return system("makeglossaries -d " . $path . " " . $base_name);
}

push @generated_exts, "glo", "gls", "glg";
push @generated_exts, "acn", "acr", "alg";
push @generated_exts, "ist", "bcf", "run.xml";
