//
//  GFDrawingPrimitives.m
//
//  Created by Jay Roberts on 9/8/10.
//

#import "GFDrawingPrimitives.h"
#import "cocos2d.h"

void gfDrawFilledRect( CGPoint v1, CGPoint v2 ) {
	CGPoint poli[]={CC_POINTS_TO_PIXELS(v1),CGPointMake(CC_CONTENT_SCALE_FACTOR()*v1.x,CC_CONTENT_SCALE_FACTOR()*v2.y),CC_POINTS_TO_PIXELS(v2),CGPointMake(CC_CONTENT_SCALE_FACTOR()*v2.x,CC_CONTENT_SCALE_FACTOR()*v1.y)};
  
    
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);
  
	glVertexPointer(2, GL_FLOAT, 0, poli);
	glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
  
	// restore default state
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glEnable(GL_TEXTURE_2D);
}

void gfDrawInvertedCircle(CGPoint center1, float radius1, NSUInteger segs) {
    CGPoint center = CC_POINTS_TO_PIXELS(center1);
    float radius = radius1*CC_CONTENT_SCALE_FACTOR();
	const float coef = (2.0f * (float)M_PI / segs) / 4;
	
  GLfloat *vertices = calloc( (sizeof(GLfloat) * 2 * (segs + 2)), 1);
  
	if(!vertices) {		
  	return;
  }
  
  glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);
  
	for (int angle = 0; angle <= 270; angle += 90) {
    
  	if (angle == 0) {
      vertices[0] = center.x + radius; 
      vertices[1] = center.y + radius; 
    } else if (angle == 90) {
      vertices[0] = center.x - radius; 
      vertices[1] = center.y + radius;  
    } else if (angle == 180) {
      vertices[0] = center.x - radius; 
      vertices[1] = center.y - radius; 
    } else if (angle == 270) {
      vertices[0] = center.x + radius; 
      vertices[1] = center.y - radius; 
    }
    
    for(int i = 0; i <= (int) segs; i++) {
    	int offset = (angle % 90) * segs;
      
      float rads = (i + offset) * coef;
      
      GLfloat j = radius * cosf(rads + CC_DEGREES_TO_RADIANS(angle)) + center.x;
      GLfloat k = radius * sinf(rads + CC_DEGREES_TO_RADIANS(angle)) + center.y;
      
      vertices[2 + i * 2] = j;
      vertices[2 + i * 2 +1] = k;
    }
    
    glVertexPointer(2, GL_FLOAT, 0, vertices);	
    glDrawArrays(GL_TRIANGLE_FAN, 0, segs + 2);
    
  } 
	
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glEnable(GL_TEXTURE_2D);	
	
	free( vertices );  
}