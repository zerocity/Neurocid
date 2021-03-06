#ifndef CGENALG_H
#define CGENALG_H

#include "util.hpp"
#include "ship.hpp"
#include "bsp.hpp"
#include "population.hpp"

using namespace std;

namespace neurocid {

struct GeneticParams {
	double mutationRate;
	double crossoverRate;
	size_t crossoverIterations;
	double maxPertubation;
	size_t numElite_;
	size_t numEliteCopies_;
	bool usePerfDesc_;
};


//-----------------------------------------------------------------------
//
//	the genetic algorithm class
//-----------------------------------------------------------------------
class GeneticPool {
private:
	bool initialized_ = false;
	void mutate(Brain& brain);
	Ship& pickSpecimen(Population& pop);
	std::pair<Ship, Ship> crossover(Ship &mum, Ship &dad, size_t iterations);
	void copyNBest(size_t n, const size_t numCopies, Population& in, Population& out);
	void calculateStatistics(Population& pop);
public:
	GeneticParams params_;
	GeneticPool(GeneticParams params);
	GeneticPool();

	//this runs the GA for one generation.
	virtual Population epoch(Population& old_pop);
};
}

#endif

