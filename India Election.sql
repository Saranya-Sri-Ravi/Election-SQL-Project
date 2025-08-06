use i_election;

select * from election_india;

-- 1. total seats allocated for 'BJP' party state-wise
select state,sum(no_of_seats) as total_seats from election_india where party="Bharatiya Janta Party" group by state order by total_seats desc;

-- 2. overall average votes got by each party
select party,avg(votes) as avg_votes from election_india group by party order by avg_votes desc;

-- 3. all winning candidates of 'Indian National Congress' ordered by their votes
select Winning_Candidate,state from election_india where party='Indian National Congress' order by votes;

-- 4. creating a view 'party vote summary'--> vote obtained by each party
create view party_vote_summary as
select party,sum(votes) as Votes_Gained from election_india group by party order by Votes_Gained desc;
select * from party_vote_summary;

-- 5. winning candidates and their votes in 'Gujarat'
select winning_candidate,votes from election_india where state='Gujarat' order by votes limit 2;

-- 6. creating view 'winning_margin'--> less than 1.5 %
create view winning_margin as
select state,Winning_Candidate,party,votes,margin,margin_percent from election_india where margin_percent is not null and margin_percent<1.5 order by margin_percent;
select * from winning_margin;

-- 7. total votes obtained by each party in every state
select state,party,sum(votes) as total_vote from election_india group by state,party order by state,total_vote desc;

-- 8. returns the winning party in the state 'Kerala'
select state,party,sum(votes) as total_vote from election_india where state='kerala' group by party order by total_vote desc limit 1;

-- 9. Top 5 parties
select party,sum(votes) as total_vote from election_india group by party order by total_vote desc limit 5;

-- 10. top 10 states with high population in eligibility to vote
select state,sum(electors) as total_eligibility from election_india group by state order by total_eligibility desc limit 10;

-- 11. number of people did not voted state-wise
select state,sum(electors-votes) as Non_Voted_population from election_india group by state order by Non_Voted_population desc;