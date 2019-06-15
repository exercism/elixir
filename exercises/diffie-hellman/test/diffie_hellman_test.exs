defmodule DiffieHellmanTest do
  use ExUnit.Case

  # @tag :pending
  test "private key should be between 1 and P-1, inclusive" do
    prime_p = 23

    assert DiffieHellman.generate_private_key(prime_p) in Range.new(1, prime_p - 1)
  end

  @tag :pending
  test "private key generator should support very large primes" do
    prime_p =
      120_227_323_036_150_778_550_155_526_710_966_921_740_030_662_694_578_947_298_423_549_235_265_759_593_711_587_341_037_426_347_114_541_533_006_628_856_300_552_706_996_143_592_240_453_345_642_869_233_562_886_752_930_249_953_227_657_883_929_905_072_620_233_073_626_594_386_072_962_776_144_691_433_658_814_261_874_113_232_461_749_035_425_712_805_067_202_910_389_407_991_986_070_558_964_461_330_091_797_026_762_932_543

    assert DiffieHellman.generate_private_key(prime_p) in Range.new(1, prime_p - 1)
  end

  @tag :pending
  test "private keys should be random" do
    prime_p = 23

    # Due to the nature of random generators, there's a small chance it could generate
    # the same numbers over an over, so this may fail, but the RNG should be good enough
    # that 100 generated keys between 1 and 22 ought to be at least half unique.

    unique_key_count =
      Stream.repeatedly(fn -> DiffieHellman.generate_private_key(prime_p) end)
      |> Enum.take(100)
      |> Enum.uniq()
      |> length

    min_expected_unique_keys = div(prime_p, 2)

    assert unique_key_count > min_expected_unique_keys
  end

  @tag :pending
  test "public key correctly calculated from two primes and private key" do
    prime_p = 23
    prime_g = 5
    private_key = 6
    expected_public_key = 8

    assert DiffieHellman.generate_public_key(prime_p, prime_g, private_key) == expected_public_key
  end

  @tag :pending
  test "public key generator should support very large primes" do
    prime_p =
      120_227_323_036_150_778_550_155_526_710_966_921_740_030_662_694_578_947_298_423_549_235_265_759_593_711_587_341_037_426_347_114_541_533_006_628_856_300_552_706_996_143_592_240_453_345_642_869_233_562_886_752_930_249_953_227_657_883_929_905_072_620_233_073_626_594_386_072_962_776_144_691_433_658_814_261_874_113_232_461_749_035_425_712_805_067_202_910_389_407_991_986_070_558_964_461_330_091_797_026_762_932_543

    prime_g =
      75_205_441_154_357_919_442_925_546_169_208_711_235_485_855_904_969_178_206_313_309_299_205_868_312_399_046_149_367_516_336_607_966_149_689_640_419_216_591_714_331_722_664_409_474_612_463_910_928_128_055_994_157_922_930_443_733_535_659_848_264_364_106_037_925_315_974_095_321_112_757_711_756_912_144_137_705_613_776_063_541_350_548_911_512_715_512_539_186_192_176_020_596_861_210_448_363_099_541_947_258_202_188

    private_key = 8_675_309

    expected_public_key =
      81_945_102_766_205_597_052_444_239_927_191_366_879_878_802_281_637_258_134_656_723_311_532_689_587_789_695_879_960_502_348_293_388_789_700_383_121_890_410_484_395_608_064_685_866_057_972_603_193_444_399_431_765_316_092_443_741_213_175_747_052_166_212_523_610_645_396_217_140_238_838_864_033_970_876_203_333_493_173_215_068_467_082_830_013_531_737_232_331_628_864_212_666_452_277_691_016_389_511_356_912_249_174

    assert DiffieHellman.generate_public_key(prime_p, prime_g, private_key) == expected_public_key
  end

  @tag :pending
  test "shared secret key correctly calculated from initial prime, Bob's public key, and Alice's private key" do
    prime_p = 23
    bob_public_key = 19
    alice_private_key = 6
    expected_shared_secret = 2

    assert DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key) ==
             expected_shared_secret
  end

  @tag :pending
  test "shared secret correctly calculated when using large primes" do
    prime_p =
      120_227_323_036_150_778_550_155_526_710_966_921_740_030_662_694_578_947_298_423_549_235_265_759_593_711_587_341_037_426_347_114_541_533_006_628_856_300_552_706_996_143_592_240_453_345_642_869_233_562_886_752_930_249_953_227_657_883_929_905_072_620_233_073_626_594_386_072_962_776_144_691_433_658_814_261_874_113_232_461_749_035_425_712_805_067_202_910_389_407_991_986_070_558_964_461_330_091_797_026_762_932_543

    bob_public_key =
      75_205_441_154_357_919_442_925_546_169_208_711_235_485_855_904_969_178_206_313_309_299_205_868_312_399_046_149_367_516_336_607_966_149_689_640_419_216_591_714_331_722_664_409_474_612_463_910_928_128_055_994_157_922_930_443_733_535_659_848_264_364_106_037_925_315_974_095_321_112_757_711_756_912_144_137_705_613_776_063_541_350_548_911_512_715_512_539_186_192_176_020_596_861_210_448_363_099_541_947_258_202_188

    alice_private_key =
      2_483_479_393_625_932_939_911_081_304_356_888_505_153_797_135_447_327_501_792_696_199_190_469_015_215_177_630_758_617_902_200_417_377_685_436_170_904_594_686_456_961_202_706_692_908_603_181_062_371_925_882

    expected_shared_secret =
      70_900_735_223_964_890_815_905_879_227_737_819_348_808_518_698_920_446_491_346_508_980_461_201_746_567_735_331_455_825_644_429_877_946_556_431_095_820_785_835_497_384_849_778_344_216_981_228_226_252_639_932_672_153_547_963_980_483_673_419_756_271_345_828_771_971_984_887_453_014_488_572_245_819_864_454_136_618_980_914_729_839_523_581_263_886_740_821_363_010_486_083_940_557_620_831_348_661_126_601_106_717_071

    assert DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key) ==
             expected_shared_secret
  end

  @tag :pending
  test "exchanging public keys between Alice and Bob should calculate the same shared secret" do
    prime_p = 23
    prime_g = 5

    alice_private_key = DiffieHellman.generate_private_key(prime_p)
    bob_private_key = DiffieHellman.generate_private_key(prime_p)

    alice_public_key = DiffieHellman.generate_public_key(prime_p, prime_g, alice_private_key)
    bob_public_key = DiffieHellman.generate_public_key(prime_p, prime_g, bob_private_key)

    alice_shared_secret =
      DiffieHellman.generate_shared_secret(prime_p, bob_public_key, alice_private_key)

    bob_shared_secret =
      DiffieHellman.generate_shared_secret(prime_p, alice_public_key, bob_private_key)

    assert alice_shared_secret == bob_shared_secret
  end
end
