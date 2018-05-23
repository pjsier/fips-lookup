all: data/fips.csv

clean:
	rm data/*.csv

.PHONY: clean

data/fips.csv: data/states.csv data/counties.csv data/cities.csv
	csvstack $^ | \
	python3 scripts/process.py > $@

data/%.csv:
	aws s3 cp s3://eviction-lab-data-downloads/US/$*.csv - | \
	csvgrep -c year -m 2010 | \
	csvcut -c GEOID,name,parent-location > $@
