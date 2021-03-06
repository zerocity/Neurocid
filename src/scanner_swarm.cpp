/*
 * scanner1.cpp
 *
 *  Created on: Mar 14, 2014
 *      Author: elchaschab
 */

#include "scanner.hpp"
#include "population.hpp"
#include "battlefield.hpp"
#include "bsp.hpp"
#include "util.hpp"

namespace neurocid {

void SwarmScanner::pickRandomN(ScanObjectType type, Ship& t, Population& team, ScanObjectVector& result, size_t n) {
	size_t s = team.size();

	if(s > 0) {
		for(size_t i = 0; i < n; ++i) {
			Ship& p = team[iRand(0, s -1)];
			result.push_back(ScanObject{type, p.loc_, t.distance(p)});
		}
	} else {
		for(size_t i = 0; i < n; ++i) {
			result.push_back(ScanObject{type, NO_VECTOR2D, NO_COORD});
		}
	}
}

void SwarmScanner::teamScan(Population& active, Population& passive, ObjectBsp& bspFriends, ObjectBsp& bspEnemies, BattleFieldLayout& bfl) {
	size_t numFriends = 3;
	size_t numEnemies = 3;

	for(size_t i = 0; i < active.size(); ++i) {
		Ship& t = active[i];
		if(t.dead_)
			continue;

		Scan& scan = t.scan_;
		scan.dir_ = t.getDirection();
		scan.loc_ = t.loc_;
		scan.objects_.clear();

		//findInRange(bspFriends, t, FRIEND, scan.objects_, 300);
		size_t s =  scan.objects_.size();
		if(s > numFriends) {
			scan.objects_.resize(numFriends);
			s = numFriends;
		}
		pickRandomN(FRIEND, t, active, scan.objects_, numFriends - s);

		//findInRange(bspEnemies, t, ENEMY, scan.objects_, 3000);
		s = scan.objects_.size();
		if (s > (numEnemies + numFriends)) {
			scan.objects_.resize(numEnemies + numFriends);
			s = numEnemies + numFriends;
		}

		pickRandomN(ENEMY, t, passive, scan.objects_, numEnemies - (s - numFriends));

		for(Projectile* p : t.projectiles_) {
			if(p->dead_)
				continue;

			p->scan_.loc_ = p->loc_;
			auto result = findNearest(bspEnemies, *p);
			Ship* penemy = static_cast<Ship*>(result.first);
			assert(p->scan_.objects_.empty() || p->scan_.objects_.size() == 2);

			if(result.second != NO_COORD) {
				if(p->scan_.objects_.empty()) {
					p->scan_.objects_.push_back(ScanObject{
						ENEMY,
						penemy->loc_,
						result.second
					});
				} else if(result.second < p->scan_.objects_[0].dis_){
					p->scan_.objects_[0].loc_ = penemy->loc_;
					p->scan_.objects_[0].dis_ = result.second;
				}
			} else {
				p->scan_.objects_.push_back(ScanObject{
					ENEMY,
					NO_VECTOR2D,
					NO_COORD
				});
			}

			result = findNearest(bspFriends, *p);
			Ship* pfriend = static_cast<Ship*>(result.first);

			if(result.second != NO_COORD) {
				if(p->scan_.objects_.size() == 1) {
					p->scan_.objects_.push_back(ScanObject{
						FRIEND,
						pfriend->loc_,
						result.second
					});
				} else if(result.second < p->scan_.objects_[0].dis_){
					p->scan_.objects_[1].loc_ = pfriend->loc_;
					p->scan_.objects_[1].dis_ = result.second;
				}
			} else {
				p->scan_.objects_.push_back(ScanObject{
					FRIEND,
					NO_VECTOR2D,
					NO_COORD
				});
			}
		}
	}
}

void SwarmScanner::scan(BattleField& field) {
	assert(field.teams_.size() == 2);
	prepare(field);
	Population& teamA = field.teams_[0];
	Population& teamB = field.teams_[1];
	teamScan(teamA, teamB, bspA_, bspB_, field.layout_);
	teamScan(teamB, teamA, bspB_, bspA_, field.layout_);
}

void SwarmScanner::prepare(BattleField& field) {
	BspScanner::prepare(field);
}

} /* namespace neurocid */
