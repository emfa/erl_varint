-module(varint).

-type varint() :: binary().
-export_type([varint/0]).

-export([encode/1, decode/1]).

-spec encode(non_neg_integer()) -> binary().
encode(Int) when Int < 128 ->
    <<Int>>;
encode(Int) when Int < 16384 ->
    <<1:1, 0:1, Int:14>>;
encode(Int) when is_integer(Int) ->
    error(unimplemented).

decode(<<0:1, Int:7, Rest/binary>>) ->
    {Int, Rest};
decode(<<1:1, 0:1, Int:14, Rest/binary>>) ->
    {Int, Rest};
decode(Bin) when is_binary(Bin) ->
    error(unimplemented).
