:- dynamic movies/5, category/1, language/1, age/1, season/1, result1/1, result2/1, result3/1, result4/1, flag/1.

category(["'Drama'","'Science'","'Fantasy'","'Mystery'","'Action'","'Crime'","'Romance'","'Comedy'","'Animation'","'Horror'"]).
language(["'English'","'Korean'","'Indian'","'Japanese'","'No preference'"]).
age(["'G'","'PG'","'R'","'NC-17'","'No preference'"]).
season(["'2019 first quarter'","'2019 second quarter'","'2019 third quarter'","'2019 fourth quarter'","'No preference'"]).

admin(admin, 123).

movies('Doctor Sleep', "'Horror'", "'English'", "'R'", "'2019 fourth quarter'").
movies('Midway', "'Action'", "'English'", "'PG'", "'2019 fourth quarter'").
movies('The Goldfinch', "'Drama'", "'English'", "'R'", "'2019 third quarter'").
movies('Toy Story 4', "'Animation'", "'English'", "'G'", "'2019 second quarter'").
movies('Noelle', "'Fantasy'", "'English'", "'G'", "'2019 fourth quarter'").
movies('Crawl', "'Action'", "'English'", "'R'", "'2019 third quarter'").
movies('Motherless Brooklyn', "'Crime'", "'English'", "'R'", "'2019 fourth quarter'").
movies('Let It Snow', "'Romance'", "'English'", "'PG'", "'2019 fourth quarter'").

movies('Until I Meet Septembers Love', "'Romance'", "'Japanese'", "'G'", "'2019 first quarter'").
movies('Snow Flower', "'Romance'", "'Japanese'", "'G'", "'2019 first quarter'").
movies('Kingdom', "'Action'", "'Japanese'", "'R'", "'2019 third quarter'").
movies('Weathering with You', "'Animation'", "'Japanese'", "'PG'", "'2019 first quarter'").
movies('Parallel World Love Story', "'Mystery'", "'Japanese'", "'PG'", "'2019 second quarter'").
movies('Hit Me Anyone One More Time', "'Comedy'", "'Japanese'", "'PG'", "'2019 second quarter'").
movies('12 Suicidal Teens', "'Mystery'", "'Japanese'", "'NC-17'", "'2019 third quarter'").
movies('Sadako', "'Horror'", "'Japanese'", "'NC-17'", "'2019 first quarter'").
movies('Bento Harassment', "'Drama'", "'Japanese'", "'PG'", "'2019 second quarter'").
movies('Makuko', "'Science'", "'Japanese'", "'PG'", "'2019 third quarter'").

movies('Gully Boy', "'Drama'", "'Indian'", "'PG'", "'2019 first quarter'").
movies('Kabir Singh', "'Romance'", "'Indian'", "'NC-17'", "'2019 second quarter'").
movies('De De Pyaar De', "'Comedy'", "'Indian'", "'PG'", "'2019 second quarter'").
movies('Chhichhore', "'Comedy'", "'Indian'", "'PG'", "'2019 third quarter'").
movies('Mission Mangal', "'Drama'", "'Indian'", "'PG'", "'2019 third quarter'").
movies('The Zoya Factor', "'Romance'", "'Indian'", "'PG'", "'2019 third quarter'").
movies('Article 15', "'Crime'", "'Indian'", "'PG'", "'2019 second quarter'").
movies('Section 375', "'Crime'", "'Indian'", "'PG'", "'2019 third quarter'").
movies('9: Nine', "'Horror'", "'Indian'", "'PG'", "'2019 first quarter'").
movies('Bypass Road', "'Drama'", "'Indian'", "'R'", "'2019 fourth quarter'").
movies('706', "'Horror'", "'Indian'", "'R'", "'2019 first quarter'").
movies('Ghost', "'Horror'", "'Indian'", "'R'", "'2019 fourth quarter'").

movies('Extreme Job', "'Action'", "'Korean'", "'R'", "'2019 second quarter'").
movies('The Gangster, the Cop, the Devil', "'Action'", "'Korean'", "'PG'", "'2019 second quarter'").
movies('The Divine Fury', "'Horror'", "'Korean'", "'PG'", "'2019 third quarter'").
movies('Parasite', "'Comedy'", "'Korean'", "'R'", "'2019 second quarter'").
movies('The Man Inside Me', "'Comedy'", "'Korean'", "'R'", "'2019 first quarter'").
movies('Bad Guys: The Movie', "'Crime'", "'Korean'", "'PG'", "'2019 third quarter'").
movies('Eorin uiroein', "'Drama'", "'Korean'", "'R'", "'2019 second quarter'").
movies('No Mercy', "'Action'", "'Korean'", "'R'", "'2019 first quarter'").
movies('Exit', "'Action'", "'Korean'", "'PG'", "'2019 third quarter'").
movies('Tazza: One Eyed Jack', "'Crime'", "'Korean'", "'NC-17'", "'2019 third quarter'").
movies('Witness', "'Crime'", "'Korean'", "'PG'", "'2019 first quarter'").
movies('Birthday', "'Drama'", "'Korean'", "'PG'", "'2019 second quarter'").
movies('Idol', "'Crime'", "'Korean'", "'PG'", "'2019 first quarter'").
movies('Romang', "'Romance'", "'Korean'", "'PG'", "'2019 second quarter'").

start:-
    write('*** Movies Recommendation System ***'), nl, nl,
    write('** Our system will make a recommendation to the movie lover by showing the best-matched movie based on the user selections or preferences. **'), nl,
    menu.

menu:- 
    nl, nl,
    write('Do you want to watch a movie? "Select 1, 2 or 3"'), nl,
    write('1- Yes'), nl,
    write('2- No'), nl,
    write('3- I am admin'), nl,
    write('Enter your choice:'), nl,
    read(X),
    option(X).

menutwo:-
    nl, nl,
    write('Do you want another recommendation? "Select 1 or 2"'), nl,
    write('1- Yes'), nl,
    write('2- No'), nl,
    write('Enter your choice:'), nl,
    read(X),
    option(X).

option(1):-
    write(' What is your mode? "Select from 1 to 10"'), nl,
    category(L),
    display(L, 0),
    write('Enter your choice:'), nl, 
    read(X), 
    checkinput(X, L), 
    mode(X).

option(2):-
    write('Thank you for using our system').

option(3):-
    nl,
    write('User name: '), nl, read(U),
    write('Password: '), nl, read(P),
    (admin(U, P) -> admenu ; (write("invalid user or pass"), option(3))).

admenu:-
    nl,
    write('Select from the following: "Select 1, 2, 3, or 4"'), nl,
    write('1- Display all movies'), nl,
    write('2- Add a movie'), nl,
    write('3- Delete a movie'), nl,
    write('4- Exit'), nl,
    write('Enter your choice:'), nl,
    read(X),
    editselection(X).

editselection(1):- 
    nl,
    write('The movies name: '),
    (printFinalResult(_, _, _, _); true),
    nl, admenu, nl.

editselection(2):-
    nl,
    write('Enter the movie information. Please embed your input with single quotation'), nl, 
    write('Movie name: '),
    read(Moviename), nl, 
    write('Movie category: '),
    read(Moviecategory), nl, 
    write('Movie language: '),
    read(Movielang), nl, 
    write('Movie age restrictions: '),
    read(Movieagerest), nl, 
    write('Movie season: '),
    read(Movieseason),
    assert(movies(Moviename, Moviecategory, Movielang, Movieagerest, Movieseason)), nl,
    admenu.

editselection(3):- 
    nl,
    write('Enter the movie name you want to delete. Please embed your input with single quotation'), nl,
    read(Moviename),
    retract(movies(Moviename, _, _, _, _)), nl,
    admenu.

editselection(4):-
    nl,
    write('Thank you. Your Exit the admin authority.'), nl, nl,
    start.

mode(X):-
    T is X - 1,
    category(L),
    nth0(T, L, Result1),
    assert(result1(Result1)),
    write('What is your preferred movie language? "Select from 1 to 5 or 0 to print recommendation"'), nl,
    language(R),
    display(R, 0),
    write('Enter your choice:'), nl,
    read(S), 
    checkinput(S, R),
    (S =:= 0 -> assert(flag(1)), end ; languageRest(S)).

languageRest(X):-
    N is X - 1,
    language(R),
    nth0(N, R, Result2),
    (Result2 == "'No preference'" -> assert(result2('')) ; assert(result2(Result2))),
    write('What is your preferred age? "Select from 1 to 5 or 0 to print recommendation"'), nl,
    age(A),
    display(A, 0),
    write('Enter your choice:'), nl,
    read(L),
    checkinput(L, A),
    (L =:= 0 -> assert(flag(2)), end ; ageRest(L)).

ageRest(X):-
    N is X - 1,
    age(R),
    nth0(N, R, Result3),
    (Result3 == "'No preference'" -> assert(result3('')) ; assert(result3(Result3))),
    write('Movie season? "Select from 1 to 5 or 0 to print recommendation"'), nl,
    season(A),
    display(A, 0),
    write('Enter your choice:'), nl,
    read(L),
    checkinput(L, A),
    (L =:= 0 -> assert(flag(3)), end ; seasonRest(L)).

seasonRest(X):-
    U is X - 1,
    season(P),
    nth0(U, P, Result4),
    (Result4 == "'No preference'" -> assert(result4('')) ; assert(result4(Result4))),
    assert(flag(4)),
    end.

end:-
    flag(Flag),
    print(Flag).

print(1):-
    result1(Result1), nl,
    write('** Based on your preferences **'), nl,
    write('Category: '), write(Result1), nl,
    write('I Recommend: '), nl,
    (printFinalResult(Result1, _, _, _); true), nl, nl,
    write('**Note: if there is no result that it means there is no match with your preferences**'),
    menutwo.

print(2):- 
    result1(Result1),
    result2(Result2),
    write('** Based on your preferences **'), nl,
    write('Category: '), write(Result1), nl,
    write('Language: '), (Result2 == '' -> write(' No preferences ') ; write(Result2)), nl,
    write('I Recommend: '), nl,
    (printFinalResult(Result1, Result2, _, _); true), nl, nl,
    write('**Note: if there is no result that it means there is no match with your preferences**'),
    menutwo.

print(3):- 
    result1(Result1),
    result2(Result2),
    result3(Result3),
    write('** Based on your preferences **'), nl,
    write('Category: '), write(Result1), nl,
    write('Language: '), (Result2 == '' -> write(' No preferences ') ; write(Result2)), nl,
    write('Age Restriction: '), (Result3 == '' -> write(' No preferences ') ; write(Result3)), nl,
    write('I Recommend: '), nl,
    (printFinalResult(Result1, Result2, Result3, _); true), nl, nl,
    write('**Note: if there is no result that it means there is no match with your preferences**'),
    menutwo.

print(4):- 
    result1(Result1),
    result2(Result2),
    result3(Result3),
    result4(Result4),
    write('** Based on your preferences **'), nl,
    write('Category: '), write(Result1), nl,
    write('Language: '), (Result2 == '' -> write(' No preferences ') ; write(Result2)), nl,
    write('Age Restriction: '), (Result3 == '' -> write(' No preferences ') ; write(Result3)), nl,
    write('Season: '), (Result4 == '' -> write(' No preferences ') ; write(Result4)), nl,
    write('I Recommend: '), nl,
    (printFinalResult(Result1, Result2, Result3, Result4); true), nl, nl,
    write('**Note: if there is no result that it means there is no match with your preferences**'),
    menutwo.

printFinalResult(Result1, Result2, Result3, Result4):- 
    nl,
    movies(J, Result1, Result2, Result3, Result4),
    nl, write(J), nl,
    display(J).

display([]).
display([H|T], A):-  
    M is A + 1,
    write(M), write('- '), write(H), nl, write(' '),
    display(T, M).

checkinput(A, L):-
    length(L, Len),
    (A > Len -> (write('Please enter valid number: '), read(D), checkinput(D, L)) ; true).
