-module(sudoku).
-export([solve/1]).

%% Public API
solve(Board) ->
    case solve_board(Board) of
        false -> {error, no_solution};
        Solved -> {ok, Solved}
    end.

%% Recursive solver
solve_board(Board) ->
    case find_empty(Board) of
        none -> Board;  % solved!
        {Row, Col} ->
            try_numbers(Board, Row, Col, lists:seq(1,9))
    end.

%% Try each possible number (recursion + pattern matching)
try_numbers(_, _, _, []) -> false;
try_numbers(Board, Row, Col, [N|Rest]) ->
    case valid(Board, Row, Col, N) of
        true ->
            NewBoard = set_cell(Board, Row, Col, N),
            case solve_board(NewBoard) of
                false -> try_numbers(Board, Row, Col, Rest);
                Solved -> Solved
            end;
        false ->
            try_numbers(Board, Row, Col, Rest)
    end.

%% Find first empty cell
find_empty(Board) ->
    find_empty(Board, 0).

find_empty([], _) -> none;
find_empty([Row|Rows], RIndex) ->
    case find_zero(Row, 0) of
        none -> find_empty(Rows, RIndex+1);
        CIndex -> {RIndex, CIndex}
    end.

find_zero([], _) -> none;
find_zero([0|_], CIndex) -> CIndex;
find_zero([_|T], CIndex) -> find_zero(T, CIndex+1).

%% Validate placement (guards + lists)
valid(Board, Row, Col, N) when N >= 1, N =< 9 ->
    RowVals = lists:nth(Row+1, Board),
    ColVals = [lists:nth(Col+1, R) || R <- Board],
    SubVals = subgrid(Board, Row, Col),
    not lists:member(N, RowVals)
    andalso not lists:member(N, ColVals)
    andalso not lists:member(N, SubVals);
valid(_, _, _, _) -> false.

%% Extract 3x3 subgrid
subgrid(Board, Row, Col) ->
    RStart = (Row div 3) * 3,
    CStart = (Col div 3) * 3,
    lists:flatten(
        lists:map(
            fun(R) ->
                lists:sublist(lists:nth(R+1, Board), CStart+1, 3)
            end,
            lists:seq(RStart, RStart+2)
        )
    ).

%% Update board immutably
set_cell(Board, Row, Col, Value) ->
    lists:map(
        fun({RIndex, R}) ->
            case RIndex of
                Row ->
                    lists:map(
                        fun({CIndex, Cell}) ->
                            case CIndex of
                                Col -> Value;
                                _ -> Cell
                            end
                        end,
                        lists:zip(lists:seq(0,8), R)
                    );
                _ -> R
            end
        end,
        lists:zip(lists:seq(0,8), Board)
    ).
