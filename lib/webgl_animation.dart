import 'dart:html' as HTML;
import 'dart:typed_data';
import 'package:flutter_wgl/flutter_wgl.dart';
import 'package:vector_math/vector_math.dart' as VM;
import 'dart:math' as Math;

///Sooooooooooooon
class WGLAnimation {
  WGLAnimation._privateConstructor();

  static final WGLAnimation _instance = WGLAnimation._privateConstructor();

  static WGLAnimation get instance => _instance;

  final instancedVertexShader = ShaderObject("finalV")
    ..AddAttributeVars([aPosition, aNormal, aTexUV])
    ..AddAttributeVars([iaRotation, iaTranslation, iaScale])
    ..AddVaryingVars([vColor, vNormal, vTexUV, vPosition])
    ..AddUniformVars([uPerspectiveViewMatrix, uModelMatrix, uTime])
    ..SetBody([
      """
vec3 rotate_vertex_position(vec3 pos, vec4 rot) { 
    rot.xyz *= sin(0.5 * rot.w * ${uTime}) /  length(rot.xyz);
    rot.w = cos(0.5 * rot.w * ${uTime});
    return pos + 2.0 * cross(rot.xyz, cross(rot.xyz, pos) + rot.w * pos);
}

void main() {
  {
    vec3 p = ${aPosition} * ${iaScale};
    p = rotate_vertex_position(p, ${iaRotation});
    p = p + ${iaTranslation};
    gl_Position = ${uPerspectiveViewMatrix} * ${uModelMatrix} * vec4(p, 1);
  }
  {
      vec3 n = ${aNormal};
      n = rotate_vertex_position(n, ${iaRotation});
      ${vNormal} = normalize(n);
  }
  ${vTexUV} = ${aTexUV};
  ${vPosition} = gl_Position.xyz;
}
"""
    ]);

  final instancedFragmentShader = ShaderObject("finalF")
    ..AddVaryingVars([vColor, vNormal, vTexUV, vPosition])
    ..AddUniformVars([
      uTexture,
      uTexture2,
      uLightDescs,
      uLightTypes,
      uShininess,
      uEyePosition
    ])
    ..SetBody([
      """
float Edge(sampler2D t, ivec2 p) {
		vec4 hEdge = vec4(0.0);
		hEdge -= texelFetch(t, ivec2(p.x - 1, p.y - 1), 0) * 1.0;
		hEdge -= texelFetch(t, ivec2(p.x - 1, p.y    ), 0) * 2.0;
		hEdge -= texelFetch(t, ivec2(p.x - 1, p.y + 1), 0) * 1.0;
		hEdge += texelFetch(t, ivec2(p.x + 1, p.y - 1), 0) * 1.0;
		hEdge += texelFetch(t, ivec2(p.x + 1, p.y    ), 0) * 2.0;
		hEdge += texelFetch(t, ivec2(p.x + 1, p.y + 1), 0) * 1.0;
		vec4 vEdge = vec4(0.0);
		vEdge -= texelFetch(t, ivec2(p.x - 1, p.y - 1), 0) * 1.0;
		vEdge -= texelFetch(t, ivec2(p.x    , p.y - 1), 0) * 2.0;
		vEdge -= texelFetch(t, ivec2(p.x + 1, p.y - 1), 0) * 1.0;
		vEdge += texelFetch(t, ivec2(p.x - 1, p.y + 1), 0) * 1.0;
		vEdge += texelFetch(t, ivec2(p.x    , p.y + 1), 0) * 2.0;
		vEdge += texelFetch(t, ivec2(p.x + 1, p.y + 1), 0) * 1.0;
		vec3 edge = sqrt((hEdge.rgb * hEdge.rgb) + (vEdge.rgb * vEdge.rgb));
		return length(edge);
}

void main() {
  ColorComponents acc = CombinedLight(${vPosition},
                                      ${vNormal},
                                      ${uEyePosition},
                                      ${uLightDescs},
                                      ${uLightTypes},
                                      ${uShininess});
                                    
  float edge = Edge(${uTexture}, ivec2(gl_FragCoord.xy));
  vec4 info = texelFetch(${uTexture}, ivec2(gl_FragCoord.xy), 0);
  if (edge > 0.3) {
      //${oFragColor}.rgb = vec3(0.0); 
      ${oFragColor}.rgb = vec3(0.5 - edge); 
     // ${oFragColor}.rgb = vec3(edge / (100.0 * info.w));
    return;
  } 
    
  ${oFragColor}.rgb = texture(${uTexture2}, ${vTexUV}).rgb * 0.5 + 
                      acc.diffuse +
                      acc.specular;
}
  """
    ], prolog: [
      StdLibShader
    ]);

//
// Preparation Shader
//

  final preparationVertexShader = ShaderObject("preparationV")
    ..AddAttributeVars([aPosition, aNormal, aTexUV])
    ..AddAttributeVars([iaRotation, iaTranslation, iaScale])
    ..AddVaryingVars([vNormal])
    ..AddUniformVars([uPerspectiveViewMatrix, uModelMatrix, uTime])
    ..SetBody([
      """
vec3 rotate_vertex_position(vec3 pos, vec4 rot) { 
    rot.xyz *= sin(0.5 * rot.w * ${uTime}) /  length(rot.xyz);
    rot.w = cos(0.5 * rot.w * ${uTime});
    return pos + 2.0 * cross(rot.xyz, cross(rot.xyz, pos) + rot.w * pos);
}

void main() {
    {
      vec3 p = ${aPosition} * ${iaScale};
      p = rotate_vertex_position(p, ${iaRotation});
      p = p + ${iaTranslation};
      gl_Position = ${uPerspectiveViewMatrix} * ${uModelMatrix} * vec4(p, 1);
    }
    {
      vec3 n = ${aNormal};
      n = rotate_vertex_position(n, ${iaRotation});
      ${vNormal} = normalize(n);
    }
}
"""
    ]);

  final preparationFragmentShader = ShaderObject("preparationF")
    ..AddVaryingVars([vNormal])
    ..SetBody([
      """
void main() {
  ${oFragColor} = vec4(${vNormal}, gl_FragCoord.w);
}
  """
    ]);

  void addInstanceData(MeshData md, Math.Random rand, int count) {
    final Float32List scales = Float32List(count * 1);
    final Float32List translations = Float32List(count * 3);
    final Float32List rotations = Float32List(count * 4);

    for (int i = 0; i < count; i++) {
      final VM.Vector3 t = VM.Vector3.random(rand) - VM.Vector3(0.5, 0.5, 0.5);
      t.scale(60.0);
      translations.setAll(i * 3, t.storage);
      final VM.Vector3 u = VM.Vector3.random(rand);
      final VM.Quaternion q =
          VM.Quaternion.axisAngle(u, 2.0 * rand.nextDouble() * Math.pi);
      rotations.setAll(i * 4, q.storage);

      scales.setAll(i, [2.0 + rand.nextDouble() * 4.0]);
    }

    md.AddAttribute(iaRotation, rotations, 4);
    md.AddAttribute(iaTranslation, translations, 3);
    md.AddAttribute(iaScale, scales, 1);
  }

  final VM.Vector3 dirLight = VM.Vector3(-30.0, 0.0, -30.0);

  Framebuffer makePrepareFb(FlutterWGL cgl, int width, int height) {
    TypedTexture tex = TypedTexture(
        cgl, "float", width, height, GL_RGBA32F, TexturePropertiesFramebuffer);
    TypedTexture depthTexture = TypedTexture(cgl, "frame::depth", width, height,
        GL_DEPTH_COMPONENT24, TexturePropertiesShadowMap);
    return Framebuffer(cgl, tex, depthTexture);
  }

  Texture makeNoiseTexture(FlutterWGL cgl, Math.Random rand) {
    HTML.CanvasElement canvas = new HTML.CanvasElement();
    canvas.width = 512;
    canvas.height = 512;
    var context = canvas.context2D;
    var image = context.getImageData(0, 0, canvas.width, canvas.height);

    for (int i = 0; i < image.data.length; i += 4) {
      int v = 30 + rand.nextInt(100);
      image.data[i + 0] = v;
      image.data[i + 1] = v;
      image.data[i + 2] = v;
      image.data[i + 3] = 255;
    }
    context.putImageData(image, 0, 0);

    return ImageTexture(cgl, "noise", canvas, TexturePropertiesMipmap);
  }

  void build() {
    HTML.CanvasElement canvas = HTML.document.querySelector('#webgl-canvas');

    final FlutterWGL cgl = FlutterWGL(canvas, faceCulling: false)
      ..clearColor(0.172, 0.165, 0.165, 1.0);

    Illumination illumination = Illumination()
      ..AddLight(DirectionalLight(
          "dir", dirLight, ColorWhite * 0.5, ColorWhite, 100.0));

    final dynamic ext = cgl.getExtension("EXT_color_buffer_float");
    if (ext == null) {
      HTML.window.alert("extension not available: EXT_color_buffer_float");
    }
    OrbitCamera orbit = OrbitCamera(70.0, 0.0, 0.0, canvas);

    final Perspective perspective = Perspective(orbit, 0.1, 1000.0);

    final width = canvas.clientWidth;
    final height = canvas.clientHeight;
    canvas.width = width;
    canvas.height = height;
    perspective.AdjustAspect(width, height);

    final Math.Random rand = Math.Random(1);

    final progPreparation = RenderProgram(
        "preparation", cgl, preparationVertexShader, preparationFragmentShader);

    final progInstanced = RenderProgram(
        "instanced", cgl, instancedVertexShader, instancedFragmentShader);

    final cubes = ShapeWedge(progInstanced, x: 0.1, y: 0.1, z: 0.1);
    addInstanceData(cubes, rand, 500);
    print("instances: $cubes.GetNumInstances()}");

    final prepare =
        Phase(progPreparation, cubes, makePrepareFb(cgl, width, height))
          ..mat.SetUniform(uModelMatrix, VM.Matrix4.identity());

    final Phase render = Phase(progInstanced, cubes, Framebuffer.Screen(cgl))
      ..mat.SetUniform(uModelMatrix, VM.Matrix4.identity())
      ..mat.SetUniform(uShininess, 10.0)
      ..mat.SetUniform(uTexture2, makeNoiseTexture(cgl, rand))
      ..mat.SetUniform(uTexture, prepare.fb.colorTexture);

    double _lastTimeMs = 0.0;
    void animate(num timeMs) {
      double elapsed = timeMs - _lastTimeMs;
      _lastTimeMs = timeMs + 0.0;
      orbit.azimuth += 0.001;
      orbit.animate(elapsed);

      prepare.mat.ForceUniform(uTime, _lastTimeMs / 2000.0);
      prepare.Run(width, height, [perspective]);

      render.mat.ForceUniform(uTime, _lastTimeMs / 2000.0);
      render.Run(width, height, [perspective, illumination]);
      HTML.window.animationFrame.then(animate);
    }

    animate(0.0);
  }
}

class Phase {
  Phase(this.program, this.md, this.fb);

  final Framebuffer fb;
  final Material mat = Material("mat");
  final RenderProgram program;
  final MeshData md;

  void Run(int width, int height, [List<UniformGroup> extra]) {
    fb.Activate(GL_CLEAR_ALL, 0, 0, width, height);
    List<UniformGroup> uniforms = [mat];
    if (extra != null) {
      uniforms.addAll(extra);
    }
    program.Draw(md, uniforms);
  }
}
