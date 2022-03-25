# Built Environment

This project is licensed under the terms of the [Creative Commons Attribution-NonCommercial (CC-BY-NC)](https://creativecommons.org/licenses/by-nc/4.0/)

## Folder structure:

-   analysis: final reports (i.e. RMD files)

-   scr: scripts (e.g., Define functions, Load data, data wrangling)

-   output: data artifacts (e.g., Load data, data wrangling)

-   raw_data: raw source data (it could be git-ignored if large data-sets exisit)

-   doc: documentation

-   ext: external files (e.g., SQL, images)

## Data-set

### Energy/Display Performance Certificates database

The [Energy Performance of Buildings Register](https://find-energy-certificate.digital.communities.gov.uk/) (the register) is the official place for all Energy Performance Certificates (EPCs), Display Energy Certificates (DECs) and Air Conditioning Inspection Reports (ACIRs).

The open data published on this website has been made available for data analysis to enable independent research into energy efficiency issues such as fuel poverty and climate change. The department has chosen only to publish data from 1 October 2008. The open data should not be relied upon to check if a valid EPC has been produced on sale or rent of a building, if a DEC has been produced for a public authority building over a certain size or if an ACIR has been produced for an air conditioning system.

#### Data included in this site

-   **Domestic EPCs:** to 31 December 2021

-   **Non-Domestic EPCs:** to 31 December 2021

-   **Display Energy Certificates:** to 31 December 2021

On 20 September 2020 the register transitioned to www.gov.uk. All data before that date was provided from the Landmark register.

The EPC dataset is open and available on-line from the Department for Levelling Up, Housing & Communities - DLUHC (<https://epc.opendatacommunities.org/>). The EPC dataset used in this research is download in 23/03/2022. It contains 22,248,283 Domestic EPC, 1,035,588 Non-Domestic EPC and 435,371 Display Energy Certificates issued between 1/10/2008 and 31/12/2021.

For Energy Performance of Buildings Documentation, please visit this page: (<https://epc.opendatacommunities.org/docs/index>)

### **The National Statistics Postcode Lookup(NSPL)**

Download NSPL (May 2021) from the Open Geography portal of the Office for National Statistics (ONS) (<https://geoportal.statistics.gov.uk/datasets/ons::national-statistics-postcode-lookup-may-2021/about>) This file contains the National Statistics Postcode Lookup (NSPL) for the United Kingdom as at May 2021 in Comma Separated Variable (CSV) and ASCII text (TXT) formats.

### **The Land Registry Price Paid PPD**

Download the Land Registry PPD from the UK goverment website (<https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads>) Contains HM Land Registry data © Crown copyright and database right 2021. This data is licensed under the Open Government Licence v3.0.

Price Paid Data is released under the [Open Government Licence (OGL)](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). You need to make sure you understand the terms of the OGL before using the data.

Under the OGL, HM Land Registry permits you to use the Price Paid Data for commercial or non-commercial purposes. However, OGL does not cover the use of third party rights, which we are not authorised to license.

Price Paid Data contains [address data](https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads#address-data) processed against Ordnance Survey's AddressBase Premium product, which incorporates Royal Mail's PAF® database (Address Data). Royal Mail and Ordnance Survey permit your use of Address Data in the Price Paid Data:

-   for personal and/or non-commercial use

-   to display for the purpose of providing residential property price information services

If you want to use the Address Data in any other way, you must contact Royal Mail. Email [address.management\@royalmail.com](mailto:address.management@royalmail.com).

#### **Address data**

The following fields comprise the address data included in Price Paid Data:

-   Postcode

-   PAON Primary Addressable Object Name (typically the house number or name)

-   SAON Secondary Addressable Object Name – if there is a sub-building, for example, the building is divided into flats, there will be a SAON

-   Street

-   Locality

-   Town/City

-   District

-   County

These include standard and additional price paid data transactions received at HM Land Registry from 1 January 1995 to March 2022 (when the data was downloaded).

### Planning permissions on the London Development Database (LDD)

The London Development Database (LDD) records significant planning permissions in London.

<https://data.london.gov.uk/dataset/planning-permissions-on-the-london-development-database--ldd->

The data is entered by London's planning authorities, and is checked by the GLA to ensure consistency across London. The LDD records any planning consent that permits one or more of the following:

-   any new build residential units

-   any loss or gain of residential units through change of use or conversion of existing dwellings

-   creation of seven or more new bedrooms for use as either a hotel, a hostel, student housing or for residential care through new build or change of use

-   1,000m^2 or more of floor space changing from one use class to another or created through new build or extension for any other use

-   the loss or gain or change of use of open space.

Note that the LDD is being replaced and this data set is no longer being updated. For more information please see the [Planning London Datahub](https://www.london.gov.uk/what-we-do/planning/digital-planning/planning-london-datahub).
