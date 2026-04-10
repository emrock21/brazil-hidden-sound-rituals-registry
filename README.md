# Brazil Hidden Sound Rituals Registry

On-chain registry of real, lesser-known Amazonian ritual sound instruments from Brazil.

This contract focuses on ceremonial sound technologies that are culturally significant but not widely documented, such as:

- Huni Kuin maracas used in healing rituals  
- Tikuna sacred flutes for initiation rites  
- Kayapo bamboo trumpets for communal announcements  
- Yawanawa double flutes representing duality  
- Yanomami spirit flutes used in night ceremonies  

Each entry is tied to a specific Brazilian region and indigenous community, emphasizing cultural context rather than generic musical categories.

---

## Why a country-specific contract?

Brazil preserves one of the richest ritual sound traditions in the Amazon.  
Many of its most meaningful instruments are:

- Used in healing, initiation, and seasonal ceremonies  
- Played as part of shamanic navigation and spiritual journeys  
- Crafted with forest materials and transmitted orally  

A global “instrument registry” would dilute this context.  
This registry is explicitly designed for Brazil’s Amazonian ritual sound practices.

---

## Contract

Deployed on Base:  
`0xc47e41d32db65c2efde23cf98bfc3b4505bc48ef`  
🔗 https://basescan.org/address/0xc47e41d32db65c2efde23cf98bfc3b4505bc48ef#code

---

## Data model

Each recorded instrument includes:

- `region` – e.g., Amazonas, Acre, Roraima  
- `community` – specific indigenous community  
- `instrumentName` – name of the ritual instrument  
- `instrumentType` – flute, rattle, drum, etc.  
- `culturalNote` – brief factual context  
- `whyItMatters` – explanation of cultural significance  
- `likes` / `dislikes` – community voting  

---

## Example entries (conceptual)

These are examples of the kind of instruments this registry is meant to capture:

- A maraca used to guide healing chants  
- A sacred flute played during youth initiation  
- A bamboo trumpet announcing ritual gatherings  
- A double flute representing cosmological duality  
- A bone whistle used in shamanic journeys  

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

solidity

recordSoundInstrument(
  string region,
  string community,
  string instrumentName,
  string instrumentType,
  string culturalNote,
  string whyItMatters
);

voteSoundInstrument(uint256 id, bool like);

totalInstruments();

---

## Conclusion

This contract provides a country-specific, culturally grounded registry for Brazil.
It is not a generic music list, but a curated log of ritual sound instruments that matter to the cultural memory and ceremonial identity of the Amazon.
