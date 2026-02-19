Balatest.TestPlay({
	name = "kitchen_inactive_normal_flush",
	category = {"jokers"},
	execute = function()
		Balatest.play_hand({"2S", "3S", "4S", "5S", "7S"});
	end,
	assert = function()
		Balatest.assert_chips((35 + 2 + 3 + 4 + 5 + 7) * 4);
	end
});

Balatest.TestPlay({
	name = "kitchen_inactive_stone_no_flush",
	category = {"jokers"},
	deck = {
		cards = {
			{r = "2", s = "S", e = "m_stone"},
			{r = "3", s = "S"},
			{r = "4", s = "S"},
			{r = "5", s = "S"},
			{r = "7", s = "S"},
			{r = "A", s = "S"},
			{r = "A", s = "H"},
			{r = "A", s = "D"}
		}
	},
	execute = function()
		Balatest.play_hand({"2S", "3S", "4S", "5S", "7S"});
	end,
	assert = function()
		Balatest.assert_chips((5 + 7 + 50) * 1);
	end
});

Balatest.TestPlay({
	name = "kitchen_active_stone_flush_spades",
	category = {"jokers"},
	jokers = {"j_moss_kitchen"},
	deck = {
		cards = {
			{r = "2", s = "S", e = "m_stone"},
			{r = "3", s = "S"},
			{r = "4", s = "S"},
			{r = "5", s = "S"},
			{r = "7", s = "S"},
			{r = "A", s = "S"},
			{r = "A", s = "H"},
			{r = "A", s = "D"}
		}
	},
	no_auto_start = true,
	execute = function()
		Balatest.q(function()
			G.GAME.current_round.kitchen_card = {suit = "Spades"};
		end);

		Balatest.start_round();

		Balatest.play_hand({"2S", "3S", "4S", "5S", "7S"});
	end,
	assert = function()
		Balatest.assert_chips((35 + 50 + 3 + 4 + 5 + 7) * 4);
	end
});

Balatest.TestPlay({
	name = "kitchen_active_stone_wrong_suit",
	category = {"jokers"},
	jokers = {"j_moss_kitchen"},
	deck = {
		cards = {
			{r = "2", s = "S", e = "m_stone"},
			{r = "3", s = "S"},
			{r = "4", s = "S"},
			{r = "5", s = "S"},
			{r = "7", s = "S"},
			{r = "A", s = "S"},
			{r = "A", s = "H"},
			{r = "A", s = "D"}
		}
	},
	no_auto_start = true,
	execute = function()
		Balatest.q(function()
			G.GAME.current_round.kitchen_card = {suit = "Hearts"};
		end);

		Balatest.start_round();

		Balatest.play_hand({"2S", "3S", "4S", "5S", "7S"});
	end,
	assert = function()
		Balatest.assert_chips(5 + 7 + 50);
	end
});

Balatest.TestPlay({
	name = "kitchen_active_stone_flush_hearts",
	category = {"jokers"},
	jokers = {"j_moss_kitchen"},
	deck = {
		cards = {
			{r = "2", s = "H", e = "m_stone"},
			{r = "3", s = "H"},
			{r = "4", s = "H"},
			{r = "5", s = "H"},
			{r = "7", s = "H"},
			{r = "A", s = "S"},
			{r = "A", s = "D"},
			{r = "A", s = "C"}
		}
	},
	no_auto_start = true,
	execute = function()
		Balatest.q(function()
			G.GAME.current_round.kitchen_card = {suit = "Hearts"};
		end);

		Balatest.start_round();

		Balatest.play_hand({"2H", "3H", "4H", "5H", "7H"});
	end,
	assert = function()
		Balatest.assert_chips((35 + 50 + 3 + 4 + 5 + 7) * 4);
	end
});

Balatest.TestPlay({
	name = "kitchen_active_normal_flush",
	category = {"jokers"},
	jokers = {"j_moss_kitchen"},
	execute = function()
		Balatest.play_hand({"2S", "3S", "4S", "5S", "7S"});
	end,
	assert = function()
		Balatest.assert_chips((35 + 2 + 3 + 4 + 5 + 7) * 4);
	end
});

Balatest.TestPlay({
	name = "kitchen_suit_changes_each_round",
	category = {"jokers"},
	jokers = {"j_moss_kitchen"},
	execute = function()
		Balatest.next_round();
	end,
	assert = function()
		local suit = G.GAME.current_round.kitchen_card.suit;

		Balatest.assert(
			suit == "Spades" or suit == "Hearts" or suit == "Diamonds" or
			suit == "Clubs",
			"kitchen suit should be a valid suit after round change"
		);
	end
});
