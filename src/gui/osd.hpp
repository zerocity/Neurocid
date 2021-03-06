#ifndef OSD_HPP_
#define OSD_HPP_

#include "../gui/gui.hpp"
#include <string>

namespace neurocid {

using std::string;

class BattleField;

class OsdWidget : public NeurocidWidget<gcn::TextBox> {
public:
	OsdWidget();

	void clear();
	void addLine(const string& key, const string& value);
	void addLine(const string& value);
};

class OsdScreenWidget : public NeurocidWidget<gcn::Container> {
	OsdWidget* osdStatistics_;
	OsdWidget* osdTracker_;
	OsdWidget* osdStatus_;

	static OsdScreenWidget* instance_;
	OsdScreenWidget(Sint16 width, Sint16 height);
public:
	static void init(Sint16 width, Sint16 height) {
		assert(instance_ == NULL);
		instance_ = new OsdScreenWidget(width, height);
	}

	static OsdScreenWidget* getInstance() {
		assert(instance_ != NULL);
		return instance_;
	}

	~OsdScreenWidget() {
		delete osdStatistics_;
		delete osdTracker_;
		delete osdStatus_;
	}

	void update(BattleField& field);

	void showOsdStatistics(bool s) {
		osdStatistics_->setVisible(s);
	}

	void showOsdTracker(bool s) {
		osdTracker_->setVisible(s);
	}

	void showOsdStatus(bool s) {
		osdStatus_->setVisible(s);
	}

	bool isOsdStatisticsVisible() {
		return osdStatistics_->isVisible();
	}

	bool isOsdTrackerVisible() {
		return osdTracker_->isVisible();
	}

	bool isOsdStatusVisible() {
		return osdStatus_->isVisible();
	}
};

} /* namespace neurocid */

#endif /* OSD_HPP_ */
