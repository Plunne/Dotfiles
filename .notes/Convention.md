# DOTFILES CONVENTION

Dotfiles project management convention.

# TABLE OF CONTENT
- [DOTFILES CONVENTION](#dotfiles-convention)
- [TABLE OF CONTENT](#table-of-content)
- [TICKET ID](#ticket-id)
  - [Prefix](#prefix)
  - [Sufix](#sufix)
  - [Example](#example)
- [TICKET TAGS](#ticket-tags)
  - [List of ticket tags](#list-of-ticket-tags)
- [TICKET TITLE](#ticket-title)
  - [Title template](#title-template)
  - [Example](#example-1)

# TICKET ID

Every tickets should have a prefix and a sufix.

`PREFIX-SUFIX`

## Prefix

The prefix consists of the category which the ticket is part of. Below an array that lists all prefixes corresponding to the application they are created for.

|  Prefix   | Application                                                                        |
|:---------:|:-----------------------------------------------------------------------------------|
|  `DOTS`   | Dotfiles related                                                                   |
| `DOTSCVN` | Dotfiles convention improvements                                                   |
| `MISCCFG` | Miscelaneous application that are rarely configured *(ex : Discord, Spotify, ...)* |
| `AWMCFG`  | Awesome WM related                                                                 |
|  `EMCFG`  | EMACS related                                                                      |
|  `VSCFG`  | Visual Studio Code related                                                         |
| `NVIMCFG` | NeoVim related                                                                     |
| `ZSHCFG`  | Zsh related                                                                        |

## Sufix

The sufix is the ID increment number of the ticket.

**Format :** YYMMxx

| Symbol | Description       |
|:------:|:------------------|
|  `YY`  | Year              |
|  `MM`  | Month             |
|  `xx`  | ID incrementation |

## Example

> For a ticket about AwesomeWM created in July 2025,  
> That is the third concerning awesome in this month :  
> **Ticket ID :** `AWMCFG-250703`

# TICKET TAGS

Different tags shall be filled to precise some informations about the subject.

## List of ticket tags

| Priority |      Tag       | Description                                                                                  |
|:--------:|:--------------:|:---------------------------------------------------------------------------------------------|
|    1     |    `[NEW]`     | New Release                                                                                  |
|    2     |     `[RW]`     | Rework (Big changes regarding the architecture)                                              |
|    3     |   `[SETUP]`    | About Setting-up or Installing an application                                                |
|    3     |  `[PROJECT]`   | Project management related                                                                   |
|    3     |   `[README]`   | README changes                                                                               |
|    3     |   `[THEME]`    | Theming                                                                                      |
|    3     |   `[PATCH]`    | Patch application                                                                            |
|    4     |   `[SYSTEM]`   | System backend related                                                                       |
|    5     |  `[APP_NAME]`  | For MISC apps, name of the application concerned </br> (e.g. [DISCORD] when Discord related) |
|    5     | `[TOPIC_NAME]` | To add precision of the TOPIC </br> (e.g. [MAKE] when working on a Makefile)                 |

> **Tags priority :**  
> *The priority determines the order of the tags that shall be respected.*

# TICKET TITLE

A title is required after ID and Tags.


## Title template

In the end, the full ticket title shall follow this template :  
`PREFIX-SUFIX : [TAGS] Title of the ticket`

## Example

> For a ticket about AwesomeWM created in July 2025,  
> That is the third concerning awesome in this month
> Regarding a rework of the configuration that
> Required a new Release on a new branch :  
> **Ticket Title :** `AWMCFG-250703 : [NEW][RW] AwesomeWM configuration rework`

