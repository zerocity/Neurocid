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

#ifdef _GPU_KMEANS
#include "../src/KMeans.hpp"
#include <ctime>
#endif

namespace neurocid {

pair<Vector2D, Coord> ClusterScanner::findNearestCenter(const vector<Vector2D>& centers, const Vector2D& loc) {
	Coord distance = NO_COORD;
	Vector2D nearest = NO_VECTOR2D;

	for(const Vector2D& c : centers) {
		Coord candidate = c.distance(loc);
		if(candidate < distance) {
			distance = candidate;
			nearest = c;
		}
	}

	assert(nearest != NO_VECTOR2D);
	assert(distance != NO_COORD);

	return {nearest,distance};
}

void ClusterScanner::scanClusterCenters(Population& team, vector<Vector2D>& result, size_t numCenters) {
    size_t teamSize = team.size();
	if(teamSize < numCenters) {
	    	size_t n = 0;
	    	while(n < numCenters) {
				for(size_t i = 0;  i < team.size(); ++i) {
					result.push_back(team[i].loc_);

					if(++n == numCenters)
						break;
				}
	    	}
	    } else {
	#ifndef _GPU_KMEANS
			int	stages = 20;		// number of stages

			KMterm term(100, 0, 0, 0,		// run for 100 stages
					0.10,			// min consec RDL
					0.10,			// min accum RDL
					3,			// max run stages
					0.50,			// init. prob. of acceptance
					10,			// temp. run length
					0.95);			// temp. reduction factor

			term.setAbsMaxTotStage(stages);		// set number of stages

			KMdata dataPts(2, std::max(teamSize, numCenters));		// allocate data storage
			KMdataArray pts = dataPts.getPts();

			for(size_t i = 0;  i < team.size(); ++i) {
				Tank& t = team[i];
				pts[i][0] = t.loc_.x_;
				pts[i][1] = t.loc_.y_;
			}

			dataPts.buildKcTree();			// build filtering structure
			KMfilterCenters ctrs(numCenters, dataPts);		// allocate centers

	/*	    KMlocalLloyds kmLloyds(ctrs, term);		// repeated Lloyd's
			ctrs = kmLloyds.execute();			// execute

			KMlocalSwap kmSwap(ctrs, term);		// Swap heuristic
			ctrs = kmSwap.execute();
	*/

/*			KMlocalEZ_Hybrid kmEZ_Hybrid(ctrs, term);	// EZ-Hybrid heuristic
			ctrs = kmEZ_Hybrid.execute();
*/
			KMlocalHybrid kmHybrid(ctrs, term);		// Hybrid heuristic
			ctrs = kmHybrid.execute();

			for (size_t i = 0; i < numCenters; i++) {
				result.push_back(Vector2D(ctrs[i][0], ctrs[i][1]));
			}
		   // std::cerr << "### stages: " << kmHybrid.getTotalStages() << std::endl;
#else
		using namespace GPUMLib;

		HostMatrix<float> data(teamSize,2);
		float* pd = data.Pointer();
		for(size_t i = 0; i < teamSize; ++i) {
			pd[i * 2] = team[i].loc_.x_;
			pd[i * 2 + 1] = team[i].loc_.y_;
		}

		DeviceMatrix<float> dData(data);
		KMeans km;
		km.SetSeed(time(0));
        DeviceMatrix<float> dCenters = km.Execute(dData, numCenters);
		assert(dCenters.Rows() == numCenters);
		assert(dCenters.Elements() == (numCenters * 2));
		HostMatrix<float> centers(dCenters);

		float *pc = centers.Pointer();

		for (size_t i = 0; i < numCenters; ++i) {
			result.push_back(Vector2D(pc[ i ], pc[ i + 1]));
		}
#endif
	}

	assert(result.size() == numCenters);
}

void ClusterScanner::prepare(BattleField& field) {
	assert(field.teams_.size() == 2);
	Population& teamA = field.teams_[0];
	Population& teamB = field.teams_[1];

	if(!layout_.disableClusterCenters) {
		assert(layout_.numClusters_ > 0);
		centersA_.clear();
		centersB_.clear();
		scanClusterCenters(teamA, centersA_, layout_.numClusters_);
		scanClusterCenters(teamB, centersB_, layout_.numClusters_);
		assert(centersA_.size() == layout_.numClusters_);
		assert(centersB_.size() == layout_.numClusters_);
	}
}

} /* namespace neurocid */
