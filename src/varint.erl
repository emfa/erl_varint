-module(varint).

-type varint() :: binary().
-export_type([varint/0]).

-export([encode/1, decode/1]).

-spec encode(non_neg_integer()) -> binary().
encode(Int) when Int =< 127 ->
    <<Int>>.

decode(<<Int, Rest/binary>>) when Int =< 127 ->
    {ok, Int, Rest}.
