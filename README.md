# Szakdolgozat — Humán mobilitási mintázatok feltárása és elemzése mobilhálózati (CDR) adatok alapján

**Intézmény:** Óbudai Egyetem, Neumann János Informatikai Kar (OE-NIK)  
**Szak:** Mérnökinformatikus BSc  
**Tárgy:** Szakdolgozat II

---

## Téma rövid leírása

A mobiltelefon-hálózatok cellaforgalmi adatai (Call Detail Record, CDR) a humán mobilitáskutatás egyik legértékesebb forrásai. A dolgozat egy teljes körű, nyílt forráskódú adatfeldolgozó és elemző rendszer megtervezésével és implementálásával foglalkozik, amely a japán Nagoya nagyvárost leíró **YJMob100K** nyílt CDR-adathalmazon kerül bemutatásra (~141 millió rekord, 100 000 felhasználó, 75 nap, 30 perces felbontás).

---

## A könyvtár tartalma

```
Szakdoga/
├── README.md                       ← ez a fájl
├── feladatkiiras-teljesules.md     ← feladatkiírás teljesülésének nyomon követése
├── Szakdoga követelmények.pdf      ← leadási és tartalmi követelmények
└── Szakdoga latex/                 ← a dolgozat teljes LaTeX-forrása
    ├── main.tex                    ← fő belépési pont
    ├── template.tex                ← OE-NIK sablon (ne módosítsd)
    ├── references.bib              ← irodalomjegyzék (BibTeX)
    ├── acronyms.tex                ← rövidítések
    ├── chapters/                   ← fejezetek (.tex fájlonként)
    ├── img/                        ← ábrák (PNG/PDF)
    └── includes/                   ← borító, feladatlap, nyilatkozat, napló (PDF)
```

---

## Fejezetstruktúra

| Fájl | Fejezet | Tartalom |
|------|---------|----------|
| `1Bevezetés.tex` | 1. | Motiváció, célkitűzések, dolgozat felépítése |
| `2ElmeletiHatter.tex` | 2. | CDR elméleti háttere, adatvédelmi szempontok |
| `3szakirodalmiAttekintes.tex` | 3. | Szakirodalmi áttekintés (CDR-feldolgozási megoldások) |
| `4MobilitasMetrikak.tex` | 4. | Mobilitási metrikák számítási eljárásai (RoG, entrópia, stb.) |
| `5OpenSourceCDR.tex` | 5. | YJMob100K adathalmaz bemutatása |
| `6RedszertervCDR.tex` | 6. | Rendszerterv: ETL-pipeline, csillagséma, georeferálás |
| `7Implementacio.tex` | 7. | Implementáció: DuckDB, Python ETL, anomáliadetekció |
| `8GIS.tex` | 8. | GIS-alkalmazás: EPSG:2449 → WGS84, folium térképek |
| `9Eredmenyek.tex` | 9. | Elemzések: napi minták, archetípusok, eseménydetekció |
| `10Osszefoglalas.tex` | 10. | Összefoglalás, jövőbeli irányok |
| `AfuggelekPOI.tex` | — | Függelék: POI-kategóriák |

---

## Fordítás

A LaTeX-forrás **XeLaTeX** motorral fordítható. Ajánlott parancs a gyökérkönyvtárból:

```bash
cd "Szakdoga latex"
latexmk -xelatex main.tex
```

A `.latexmkrc` konfig fájl már be van állítva a helyes fordítási sorrendre (bibliográfia, glossary, index).

> **Megjegyzés:** A gyors szerkesztéshez a `main.tex` elején kommentezd ki a négy `\includepdf` sort (borító, feladatlap, nyilatkozat, napló) — ez ~40%-kal csökkenti a fordítási időt.

### Függőségek

- XeLaTeX (pl. TeX Live 2023+ vagy MiKTeX)
- `latexmk`
- Csomagok: `glossaries-extra`, `biblatex`, `pdfpages`, `tikz`, `listings`, `geometry`

---

## A feladatkiírás teljesülése

A nyolc kiírt feladatpont teljesítési állapota a [`feladatkiiras-teljesules.md`](feladatkiiras-teljesules.md) fájlban követhető nyomon.

A dolgozat három önálló alkalmazási esettel egészíti ki a kiírást:
1. Pintér-féle „ébredő város"-elemzés reprodukciója
2. Négyosztályú felhasználói archetípus-modell (Anchorite / Commuter / Explorer / Nomad)
3. Városszintű mobilitási események detektálása (Nagoya Dome, Paloma Mizuho Stadium)

---

## Kapcsolódó könyvtárak (a szülő repóban)

| Könyvtár | Szerepe |
|----------|---------|
| `src/` | Python ETL-pipeline és GIS-modul |
| `src/notebooks/` | Elemzési notebookok (05–12) |
| `data/yjmob100k/` | Nyers CDR-adatok |
| `output/` | DuckDB-adatbázis és Parquet-fájlok |
| `figures/` | Exportált ábrák (thesis-minőség) |
| `reverse-engineering-YJMob100K-grid/` | Georeferálási alalprojekt |
