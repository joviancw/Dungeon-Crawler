extends Node

var player: KinematicBody2D
var map: TileMap
const GRID_SIZE = 16

var gold = 0
var depth = 1
var kills = 0


const ENTITIES = {
		"MONSTERS": {
			"skeleton": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-skel.gd")
			},
			"slime": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-slime.gd")
			},
			"goblin": {
				"scene": preload("res://entities/monsters/monster.tscn"),
				"script": preload("res://entities/monsters/monster-goblin.gd")
			}
		},
		"PLAYERS": {
			"knight": {
				"scene": preload("res://entities/players/player-knight.tscn")
			},
			"lizard": {
				"scene": preload("res://entities/players/player-lizard.tscn")
			},
			"elf": {
				"scene": preload("res://entities/players/player-elf.tscn")
			},
			"wizard": {
				"scene": preload("res://entities/players/player-wizard.tscn")
			}
		},
		"WEAPONS": {
			"Sword": {
				"scene": preload("res://entities/weapons/Sword.tscn"),
				"script": preload("res://entities/weapons/Sword.gd"),
			},
			"Daggers": {
				"scene": preload("res://entities/weapons/Daggers.tscn"),
				"script": preload("res://entities/weapons/Daggers.gd"),
			},
			"Wand": {
				"scene": preload("res://entities/weapons/Wand.tscn"),
				"script": preload("res://entities/weapons/Wand.gd"),
			},
			"Bow": {
				"scene": preload("res://entities/weapons/Bow.tscn"),
				"script": preload("res://entities/weapons/Bow.gd"),
			}
		}
	}
	
var selectablePlayers = ENTITIES.PLAYERS.keys()
var equipableWeapons = ENTITIES.WEAPONS.keys()
