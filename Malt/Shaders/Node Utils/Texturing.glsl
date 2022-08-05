#ifndef NODE_UTILS_TEXTURING_GLSL
#define NODE_UTILS_TEXTURING_GLSL

#include "Procedural/Fractal_Noise.glsl"
#include "Procedural/Cell_Noise.glsl"

/*  META GLOBAL
    @meta: category=Texturing;
*/

/*  META
    @UV: default=UV[0];
    @Smooth_Interpolation: default=true;
*/
void Image(sampler2D Image, vec2 UV, bool Smooth_Interpolation, out vec4 Color, out vec2 Resolution)
{
    Resolution = vec2(textureSize(Image, 0));
    if(Smooth_Interpolation)
    {
        Color = texture(Image, UV);
    }
    else
    {
        ivec2 texel = ivec2(mod(UV * Resolution, Resolution));
        Color = texelFetch(Image, texel, 0);
    }
}

/*  META
    @Normal: subtype=Normal; default=NORMAL;
*/
void Matcap(sampler2D Matcap, vec3 Normal, out vec4 Color, out vec2 UV)
{
    UV = matcap_uv(Normal);
    Color = sample_matcap(Matcap, Normal);
}

/*  META
    @meta: label=HDRI;
    @Normal: subtype=Normal; default=NORMAL;
*/
void Hdri(sampler2D Hdri, vec3 Normal, out vec4 Color, out vec2 UV)
{
    UV = hdri_uv(Normal);
    Color = sample_hdri(Hdri, Normal);
}

/*  META
    @coord: subtype=Vector; default=vec4(POSITION,0);
    @detail: default=3.0; min=1.0;
    @roughness: subtype=Slider; min=0.0; max=1.0; default = 0.5;
    @tile_size: subtype=Vector; default=vec4(1);
*/
vec4 noise( vec4 coord, float detail, float roughness, bool tile, vec4 tile_size )
{
    return fractal_noise_ex(coord, detail, roughness, tile, tile_size);
}

/* META
    @coord: subtype=Vector; default=vec4(POSITION,0);
    @tile_size: subtype=Vector; default = vec4(1.0);
*/
void voronoi( 
    vec4 coord, 
    bool tile, 
    vec4 tile_size,
    out vec4 cell_color,
    out vec3 cell_position,
    out float cell_distance
)
{
    CellNoiseResult result = cell_noise_ex(coord, tile, tile_size);
    cell_color = result.cell_color;
    cell_position = result.cell_position;
    cell_distance = result.cell_distance;
}

#include "Procedural/Bayer.glsl"

/* META
    @size: subtype=ENUM(2x2,3x3,4x4,8x8); default=2;
    @texel: default=vec2(screen_pixel());
*/
float bayer_pattern(int size, vec2 texel)
{
    switch(size)
    {
        case 0: return bayer_2x2(ivec2(texel));
        case 1: return bayer_3x3(ivec2(texel));
        case 2: return bayer_4x4(ivec2(texel));
        case 3: return bayer_8x8(ivec2(texel));
    }

    return 0;
}

#endif //NODE_UTILS_TEXTURING_GLSL
