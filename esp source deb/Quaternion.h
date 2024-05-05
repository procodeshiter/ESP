struct Quaternion {
public:
  // System.Single UnityEngine.Quaternion::x
  float x;
  // System.Single UnityEngine.Quaternion::y
  float y;
  // System.Single UnityEngine.Quaternion::z
  float z;
  // System.Single UnityEngine.Quaternion::w
  float w;

  static Quaternion LookRotation(Vector3 forward, Vector3 up) {
   

    Vector3 vector = Vector3::Normalized(forward);
    Vector3 vector2 = Vector3::Normalized(Vector3::Cross(up, vector));
    Vector3 vector3 = Vector3::Cross(vector, vector2);
    auto m00 = vector2.x;
    auto m01 = vector2.y;
    auto m02 = vector2.z;
    auto m10 = vector3.x;
    auto m11 = vector3.y;
    auto m12 = vector3.z;
    auto m20 = vector.x;
    auto m21 = vector.y;
    auto m22 = vector.z;


    float num8 = (m00 + m11) + m22;
    Quaternion quaternion;
    if (num8 > 0) {
      auto num = (float)sqrt(num8 + 1.0f);
      quaternion.w = num * 0.5f;
      num = 0.5f / num;
      quaternion.x = (m12 - m21) * num;
      quaternion.y = (m20 - m02) * num;
      quaternion.z = (m01 - m10) * num;
      return quaternion;
    }

    if ((m00 >= m11) && (m00 >= m22)) {
      auto num7 = (float)sqrt(((1.0f + m00) - m11) - m22);
      auto num4 = 0.5f / num7;
      quaternion.x = 0.5f * num7;
      quaternion.y = (m01 + m10) * num4;
      quaternion.z = (m02 + m20) * num4;
      quaternion.w = (m12 - m21) * num4;
      return quaternion;
    }

    if (m11 > m22) {
      auto num6 = (float)sqrt(((1.0f + m11) - m00) - m22);
      auto num3 = 0.5f / num6;
      quaternion.x = (m10 + m01) * num3;
      quaternion.y = 0.5f * num6;
      quaternion.z = (m21 + m12) * num3;
      quaternion.w = (m20 - m02) * num3;
      return quaternion;
    }

    auto num5 = (float)sqrt(((1.0f + m22) - m00) - m11);
    auto num2 = 0.5f / num5;
    quaternion.x = (m20 + m02) * num2;
    quaternion.y = (m21 + m12) * num2;
    quaternion.z = 0.5f * num5;
    quaternion.w = (m01 - m10) * num2;
    return quaternion;
  }

  Quaternion(float _x, float _y, float _z, float _w){
    x = _x;
    y = _y;
    z = _z;
    w = _w;
  }

  Quaternion() {
    x = 0;
    y = 0;
    z = 0;
    w = 0;
  }

  Quaternion(const Quaternion &v) : x(v.x), y(v.y), z(v.z) , w(v.w) {
  //
  }

};