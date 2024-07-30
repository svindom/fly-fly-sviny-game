extends Node

# Emited in the Score Managere Script inside the set_score() function.
signal on_score_updated()

# Emited in the Sviny Script inside the destroy_sviny() function.
signal on_sviny_destroyed()
