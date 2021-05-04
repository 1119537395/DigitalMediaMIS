package com.fish.test;

/**
 * @ClassName MainTest
 * @Description 测试
 * @Author 柚子茶
 * @Date 2021/3/22 13:21
 * @Version 1.0
 */
public class MainTest {

	public static void main(String[] args) {

		String path = "2021-03-18/202103181210478451085.jpg";

		String oldName = path.substring(path.lastIndexOf("/")+1);
		System.out.println(oldName);


	}


}
