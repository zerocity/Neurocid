/*
 * physics.cpp
 *
 *  Created on: Mar 15, 2014
 *      Author: elchaschab
 */

#include "physics.hpp"
#include "battlefield.hpp"
#include "tank.hpp"
#include "projectile.hpp"
#include "population.hpp"

namespace tankwar {
using std::vector;

void Physics::collide(Projectile& p1, Projectile& p2) {
	p1.dead_ = true;
	p1.explode_ = true;
	p2.dead_ = true;
	p2.explode_ = true;
}

void Physics::collide(Projectile& p, Tank& t) {
	if (t != (*p.owner_)) {
		p.dead_ = true;
		p.explode_ = true;
		t.damage_++;
		if (t.damage_ >= t.tl_.max_damage_) {
			t.dead_ = true;
			t.explode_ = true;
		}

		if (p.owner_->teamID_ != t.teamID_) {
			p.owner_->hits_++;
			p.enemyHitter_ = true;
		} else {
			p.owner_->friendly_fire_++;
			p.friendHitter_ = true;
		}
	}
}

void Physics::BeginContact(b2Contact* contact) {
  Object* oA = static_cast<Object*>(contact->GetFixtureA()->GetBody()->GetUserData());
  Object* oB = static_cast<Object*>(contact->GetFixtureB()->GetBody()->GetUserData());

  if(oA != NULL && oB != NULL && !oA->dead_ && !oB->dead_) {
	  if(oA->type() == PROJECTILE && oB->type() == PROJECTILE) {
		  collide(*static_cast<Projectile*>(oA), *static_cast<Projectile*>(oB));
	  } else if(oA->type() == PROJECTILE && oB->type() == TANK) {
		  collide(*static_cast<Projectile*>(oA), *static_cast<Tank*>(oB));
	  } else if(oA->type() == TANK && oB->type() == PROJECTILE) {
		  collide(*static_cast<Projectile*>(oB), *static_cast<Tank*>(oA));
	  }

	  if(oA->dead_)
		  deadBodies_.push_back(contact->GetFixtureA()->GetBody());

	  if(oB->dead_)
		  deadBodies_.push_back(contact->GetFixtureB()->GetBody());
  }
}

void Physics::EndContact(b2Contact* contact) {

}

float32 Physics::toMeters(Coord c) {
	return round(c * layout_.coordToMetersFactor_);
}

Coord Physics::toCoord(float32 m) {
	return m / layout_.coordToMetersFactor_;
}

b2Body* Physics::makeWorldBox(BattleFieldLayout& bfl) {
	b2Body* body;
	b2BodyDef bodyDef;
	bodyDef.type = b2_staticBody;
    bodyDef.position.Set(0, 0);
    bodyDef.userData = NULL;
    //shape definition
    b2EdgeShape topShape;
    b2EdgeShape leftShape;
    b2EdgeShape bottomShape;
    b2EdgeShape rightShape;
    float32 w = toMeters(bfl.width_);
    float32 h = toMeters(bfl.height_);

    topShape.Set(	b2Vec2(0,0),  b2Vec2(w,0));
    leftShape.Set(	b2Vec2(0,0),  b2Vec2(0,h));
    bottomShape.Set(b2Vec2(0,h),  b2Vec2(w,h));
    rightShape.Set(	b2Vec2(w,0),  b2Vec2(w,h));

	//fixture definition
	b2FixtureDef topFixdef;
	topFixdef.shape = &topShape;
	topFixdef.density = 1;

	b2FixtureDef leftFixdef;
	leftFixdef.shape = &leftShape;
	leftFixdef.density = 1;

	b2FixtureDef bottomFixdef;
	bottomFixdef.shape = &bottomShape;
	bottomFixdef.density = 1;

	b2FixtureDef rightFixdef;
	rightFixdef.shape = &rightShape;
	rightFixdef.density = 1;

	body = world_.CreateBody(&bodyDef);
	body->CreateFixture(&topFixdef);
	body->CreateFixture(&leftFixdef);
	body->CreateFixture(&bottomFixdef);
	body->CreateFixture(&rightFixdef);
	return body;
}

b2Body* Physics::makeTankBody(Tank& t) {
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(toMeters(t.loc_.x), toMeters(t.loc_.y));

    assert(t.rotation_ < M_PI);
    bodyDef.angle = t.rotation_;
    bodyDef.userData = static_cast<Object*>(&t);
    b2Body* body = world_.CreateBody(&bodyDef);

    // Define another box shape for our dynamic body.
    b2CircleShape dynamicCircle;
    dynamicCircle.m_p.Set(0, 0);
    dynamicCircle.m_radius = toMeters(t.range_);

    // Define the dynamic body fixture.
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicCircle;

    // Set the box density to be non-zero, so it will be dynamic.
    fixtureDef.density = 1.0f;

    fixtureDef.restitution = 0.3f;

    // Override the default friction.
    fixtureDef.friction = 0.3f;


    // Add the shape to the body.
    body->CreateFixture(&fixtureDef);

    return body;
}

b2Body* Physics::makeProjectileBody(Projectile& p) {
	b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(toMeters(p.loc_.x), toMeters(p.loc_.y));
    assert(p.rotation_ < M_PI);
    bodyDef.angle = p.rotation_;
    bodyDef.linearDamping = 0.0f;
    bodyDef.userData = static_cast<Object*>(&p);
    b2Body* body = world_.CreateBody(&bodyDef);

    // Define another box shape for our dynamic body.
    b2CircleShape dynamicCircle;
    dynamicCircle.m_p.Set(0, 0);
    dynamicCircle.m_radius = toMeters(p.range_);

    // Define the dynamic body fixture.
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &dynamicCircle;

    // Set the box density to be non-zero, so it will be dynamic.
    fixtureDef.density = 1;

    // Override the default friction.
    fixtureDef.friction = 0.3f;

    // Add the shape to the body.
    body->CreateFixture(&fixtureDef);
    body->SetFixedRotation(true);
    return body;
}

Physics::Physics(PhysicsLayout pl) :
	world_(b2Vec2(layout_.gravity_.x, layout_.gravity_.y)),
	layout_(pl) {
	//FIXME why do we have to set the gravity after construction?
	b2Vec2 g1 = b2Vec2(layout_.gravity_.x, layout_.gravity_.y);
	world_.SetGravity(g1);
}

Physics::~Physics() {
	world_.ClearForces();
}

void Physics::create(BattleField& field) {
	makeWorldBox(field.layout_);
	for(Population& team : field.teams_) {
		for(Tank& t: team) {
			makeTankBody(t);
			for(Projectile* p : t.projectiles_) {
				makeProjectileBody(*p);
			}
		}
	}

	world_.SetContactListener(this);
}

void Physics::update(vector<Projectile*> spawned) {
	for(Projectile* p : spawned) {
		makeProjectileBody(*p);
	}
}

void Physics::update(vector<Tank*> spawned) {
	for(Tank* t : spawned) {
		makeTankBody(*t);
	}
}

void Physics::step() {
	for (b2Body* body = world_.GetBodyList(); body; body = body->GetNext()) {
		if(body->GetUserData() != NULL) {
			Object* o = (Object*)body->GetUserData();
			if(o->type() == TANK) {
				Vector2D force = o->getDirection() * o->speed_ * 20;
	//			std::cerr << "tank: " << force << std::endl;
			    body->SetLinearVelocity(b2Vec2(force.x, force.y));
	//		    std::cerr << "rotforce:" << o->rotForce_ << std::endl;
			    body->SetAngularVelocity(o->rotForce_);
			    assert(o->rotation_ < M_PI);
			} else if(o->type() == PROJECTILE) {
				//body->ApplyTorque(o->rotForce_ * 200);
				Vector2D force = o->getDirection() * 1000;
			    body->SetAwake(true);
				body->SetLinearVelocity(b2Vec2(force.x, force.y));
	//			std::cerr << "projectile: " << force << std::endl;
				//body->ApplyLinearImpulse(b2Vec2(force.x,force.y), body->GetWorldCenter());
			}
		}
	}

	world_.Step(layout_.timeStep_, layout_.velocityIterations_, layout_.positionIterations_);
	//cleanup the dead
	for(b2Body* body : deadBodies_) {
		world_.DestroyBody(body);
	}
	deadBodies_.clear();

	//FIXME don't copy coordinates
	for (b2Body* body = world_.GetBodyList(); body; body = body->GetNext()) {
		if(body->GetUserData() != NULL) {
			b2Vec2 pos = body->GetPosition();
			Object* obj = (Object*)body->GetUserData();
			obj->loc_.x = toCoord(pos.x);
			obj->loc_.y = toCoord(pos.y);
			obj->rotation_ = normRotation(body->GetAngle());
			assert(obj->rotation_ < M_PI);
		}
	}
}

} /* namespace tankwar */
