#ifndef VEC2_GLSL
#define VEC2_GLSL

/*  META GLOBAL
    @meta: category=Math; subcategory=Vector 2D;
*/

/* META @meta: label=Add; */
vec2 vec2_add(vec2 a, vec2 b){ return a+b; }
/* META @meta: label=Subtract; */
vec2 vec2_subtract(vec2 a, vec2 b){ return a-b; }
/* META @meta: label=Multiply; */
vec2 vec2_multiply(vec2 a, vec2 b){ return a*b; }
/* META @meta: label=Divide; */
vec2 vec2_divide(vec2 a, vec2 b){ return a/b; }
/* META @meta: label=Scale; */
vec2 vec2_scale(vec2 a, float fac){ return a*fac; }
/*META 
    @meta: label=Map Range; 
    @clamped: default=true;
    @a: label=UV; default = 'vec2(0.5)';
    @from_min: default = vec2(0.0);
    @from_max: default = vec2(1.0);
    @to_min: default = vec2(0.0);
    @to_max: default = vec2(1.0);
*/
vec2 vec2_map_range(bool clamped, vec2 a, vec2 from_min, vec2 from_max, vec2 to_min, vec2 to_max)
{
    if(clamped)
    {
        return map_range_clamped(a, from_min, from_max, to_min, to_max);
    }
    else
    {
        return map_range(a, from_min, from_max, to_min, to_max);
    }
}
/* META @meta: label=Modulo; */
vec2 vec2_modulo(vec2 a, vec2 b){ return mod(a,b); }
/* META @meta: label=Power; */
vec2 vec2_pow(vec2 a, vec2 b){ return pow(a, b); }
/* META @meta: label=Square Root; */
vec2 vec2_sqrt(vec2 a){ return sqrt(a); }
/* META @meta: label=Distort; */
vec2 vec2_distort(vec2 a, vec2 b, float fac) { return distort(a,b,fac); }

/* META @meta: label=Round; */
vec2 vec2_round(vec2 a){ return round(a); }
/* META @meta: label=Fraction; */
vec2 vec2_fract(vec2 a){ return fract(a); }
/* META @meta: label=Floor; */
vec2 vec2_floor(vec2 a){ return floor(a); }
/* META @meta: label=Ceil; */
vec2 vec2_ceil(vec2 a){ return ceil(a); }
/* META @meta: label=Snap; */
vec2 vec2_snap(vec2 a, vec2 b){ return snap(a,b);}

/* META @meta: label=Clamp; @b: label=Min; @c: label=Max; */
vec2 vec2_clamp(vec2 a, vec2 b, vec2 c){ return clamp(a, b, c); }

/* META @meta: label=Sign; */
vec2 vec2_sign(vec2 a){ return sign(a); }
/* META @meta: label=Absolute; */
vec2 vec2_abs(vec2 a){ return abs(a); }
/* META @meta: label=Min; */
vec2 vec2_min(vec2 a, vec2 b){ return min(a,b); }
/* META @meta: label=Max; */
vec2 vec2_max(vec2 a, vec2 b){ return max(a,b); }

/* META @meta: label=Mix 2D; @c: label=Factor; */
vec2 vec2_mix(vec2 a, vec2 b, vec2 c){ return mix(a,b,c); }
/* META @meta: label=Mix; */
vec2 vec2_mix_float(vec2 a, vec2 b, float fac){ return mix(a,b,fac); }

/* META @meta: label=Normalize; */
vec2 vec2_normalize(vec2 a){ return normalize(a); }

/* META @meta: label=Length; */
float vec2_length(vec2 a){ return length(a); }
/* META @meta: label=Distance; */
float vec2_distance(vec2 a, vec2 b){ return distance(a,b); }
/* META @meta: label=Dot Product; */
float vec2_dot_product(vec2 a, vec2 b){ return dot(a,b); }

/* META @meta: label=Sine; */
vec2 vec2_sin(vec2 a) { return sin(a); }
/* META @meta: label=Cosine; */
vec2 vec2_cos(vec2 a) { return cos(a); }
/* META @meta: label=Tangent; */
vec2 vec2_tan(vec2 a) { return tan(a); }
/* META @meta: label=Rotate; */
vec2 vec2_rotate(vec2 a, float angle) { return rotate_2d(a, angle); }
/* META @meta: label=Angle; */
float vec2_angle(vec2 a, vec2 b) { return vector_angle(a, b); }

/* META @meta: label=Equal; */
bool vec2_equal(vec2 a, vec2 b){ return a == b; }
/* META @meta: label=Not Equal; */
bool vec2_not_equal(vec2 a, vec2 b){ return a != b; }

/* META @meta: label=If Else; @a: label=If True; @b: label=If False; */
vec2 vec2_if_else(bool condition, vec2 a, vec2 b){ return condition ? a : b; }

/* META @meta: label=Join; */
vec2 vec2_join(float x, float y) { return vec2(x,y);}
/* META @meta: label=Split; */
void vec2_split(vec2 a, out float x, out float y){ x=a.x; y=a.y; }

#endif //VEC2_GLSL
