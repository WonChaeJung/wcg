package com.ytcares.bean;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public abstract class YTCaresBean {
	private static final String getter = "get";
	private static final String setter = "set";
	
	@SuppressWarnings("unchecked")
	public void map2Bean(Map map) throws SecurityException, NoSuchMethodException, IllegalArgumentException, InstantiationException, IllegalAccessException, InvocationTargetException{
		//상속클래스의 public메소드
		Method[] methods = this.getClass().getMethods();
		for(Iterator<String> iter = map.keySet().iterator(); iter.hasNext();) {
			//맵내의 키 전체에 대하여 반복처리
			String key = iter.next();
			Object val = map.get(key);
			
			for (int i = 0; i < methods.length; i++) {
				//메소드명
				String methodName 	= methods[i].getName();
				//메소드의 클래스타입과 개수
				Class[] param		= methods[i].getParameterTypes();
				
				if (setter.concat(key).equalsIgnoreCase(methodName)) {
					//메소드명이 set+key명인 경우
					if (param.length == 1) {
						//파라미터 하나를 받는 메소드인 경우(JavaBean규칙)
						
						//파라미터의 클래스타입
						String pClassName = param[0].getName();
						
						if (param[0].isPrimitive()) {
							//setter메소드의 파라미터가 원시타입인 경우
							try {
								
								//각 원시타입의 래퍼클래스로 형변환하여 setter메소드를 invoke
								if (Boolean.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Boolean.valueOf(String.valueOf(val)));
								} else if (Character.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, (Character)val);
								} else if (Byte.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Byte.valueOf(String.valueOf(val)));
								} else if (Short.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Short.valueOf(String.valueOf(val)));
								} else if (Integer.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Integer.valueOf(String.valueOf(val)));
								} else if (Long.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Long.valueOf(String.valueOf(val)));
								} else if (Float.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Float.valueOf(String.valueOf(val)));
								} else if (Double.TYPE.getName().equals(pClassName)) {
									methods[i].invoke(this, Double.valueOf(String.valueOf(val)));
								}
							} catch (IllegalAccessException e) {
							} catch (InvocationTargetException e) {
							}
							
							break;
						} else {
							if (val == null) {
								try {
									//널값으로 setter호출
									methods[i].invoke(this, param[0].cast(null));
									
								} catch (IllegalArgumentException e) {
								} catch (IllegalAccessException e) {
								} catch (InvocationTargetException e) {
								}
								continue;
							}
							
							try {
								//파라미터 클래스에 valueOf(String str)메소드가 있는지 확인
								Method valueOf = param[0].getMethod("valueOf", String.class);
								//valueOf 메소드를 이용하여 파라미터 타입으로 맵의 값을 형변환(파라미터타입은 Integer이지만 문자열 123인 경우 등)
								val = valueOf.invoke(param[0], String.valueOf(val));
								
								//setter 메소드호출
								methods[i].invoke(this, param[0].cast(val));
								break;
							} catch (NoSuchMethodException e) {
							} catch (IllegalAccessException e) {
							} catch (InvocationTargetException e) {
							}
							
							//문자열을 생성자의 파라미터로 하여 객체생성시도
							//해당클래스에 문자열을 파라미터로 받는 생성자가 없거나 생성도중 예외 발생시는 호출클래스로 예외전파
							Constructor constructor = param[0].getConstructor(String.class);
							val = constructor.newInstance(String.valueOf(val));
							
							try {
								//setter메소드의 파라미터 클래스타입으로 형변환하여 setter호출
								//예외 발생시 예외를 catch하여 다음 처리
								methods[i].invoke(this, param[0].cast(val));
							} catch (IllegalArgumentException e) {
							} catch (IllegalAccessException e) {
							} catch (InvocationTargetException e) {
							} catch (ClassCastException e) {
							}
						}
					}

				}
			}
		}
	}

	public Map<String, Object> bean2Map() {
		Map<String, Object> map = new HashMap<String, Object>();
		Field[] fields = this.getClass().getDeclaredFields();
		for(Field f : fields) {
			try {
				Method method = this.getClass().getMethod(getter.concat(String.valueOf(f.getName().charAt(0)).toUpperCase()).concat(f.getName().substring(1)));
				map.put(f.getName(), method.invoke(this));
				continue;
			} catch (SecurityException e) {
			} catch (NoSuchMethodException e) {
			} catch (IllegalArgumentException e) {
			} catch (InvocationTargetException e) {
			} catch (IllegalAccessException e) {
			}
			if (Modifier.isPublic(f.getModifiers()) || Modifier.isProtected(f.getModifiers())) {
				try {
					map.put(f.getName(), f.get(this));
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return map;
	}

	@SuppressWarnings("unchecked")
	public String bean2Json() {
		StringBuilder sb = new StringBuilder();
		sb.append("{");

		Map map = this.bean2Map();
		int i = 0;
		for (Iterator iter = map.keySet().iterator();iter.hasNext();) {
			String key = String.valueOf(iter.next());
			sb.append((i++==0)?"":",").append("\"").append(key).append("\"").append(":").append("\"");
			
			Object val = map.get(key);
			if (val != null) {
				sb.append(String.valueOf(val).replace("'", "\\'").replace("\"", "\\\"").replace("\r", "").replace("\n", " "));
			}
			sb.append("\"");
		}

		sb.append("}");
		return sb.toString();
	}
}
