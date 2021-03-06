#include "scan.hpp"

namespace neurocid {
	void ScanObject::scale(Vector2D& v, const Coord& distance, const Coord& maxDistance) const {
		Coord dist = distance;
		if(dist > maxDistance)
			dist = maxDistance;

		Coord scale = 1 / ((dist / maxDistance) + 1);
		v.x_ *= scale;
		v.y_ *= scale;
		assert(v.x_ >= -1 && v.x_ <= 1 && v.y_ >= -1 && v.y_ <= 1);
	}

	void ScanObject::calculate(Scan& scan) {
		Vector2D toObject = (loc_ - scan.loc_).normalize();
		vector_ = toObject;
		vector_.rotate(scan.dir_);
		if(vector_.x_ > 0)
			angDist_ = vector_.y_;
		else
			angDist_ = -vector_.y_;

		scale(vector_, dis_, 30000);
	}
} /* namespace neurocid */
