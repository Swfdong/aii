package aii.bitmap {
	import flash.display.BitmapData;
	import aii.bitmap.effects.core.IBitmapEffect;

	/**
	 * 二值化位图处理
	 * @author Swfdong
	 */
	public class BinaryBitmapProcessor {
		/**
		 *图像细化，处理后的图像为严格的1象素骨架
		 * @param data 需要处理的位图
		 * @return 处理后的位图
		 */
		public function thinning(data:BitmapData):BitmapData {
			var processor:BitmapEdge=new BitmapEdge();
			data = processor.expand(data, 1);
			//使用整型数据，泛型数组及位运算来优化计算速度
			var i:uint, j:uint, k:uint,count:uint = 0;
			var changed:Boolean;
			var THINNINGWIDTH:uint = data.width;
			var THINNINGHEIGHT:uint = data.height;
			var nbr:uint, tmp1:uint, tmp2:uint, nbn:uint, nbw:uint;
			//使用Boolean数据类型，节约内存
			var ORIBMPDATA:Vector.<Vector.<uint>>= new Vector.<Vector.<uint>>(THINNINGWIDTH, true);
			var FOTBMPDATA:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(THINNINGWIDTH, true);
			var SOTBMPDATA:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(THINNINGWIDTH, true);
			//二值化
			for (i = 0; i < THINNINGWIDTH; i += 1) {
				ORIBMPDATA[i] = new Vector.<uint>(THINNINGHEIGHT, true);
				FOTBMPDATA[i] = new Vector.<uint>(THINNINGHEIGHT, true);
				SOTBMPDATA[i] = new Vector.<uint>(THINNINGHEIGHT, true);
				for (j = 0; j < THINNINGHEIGHT; j += 1) {
					FOTBMPDATA[i][j] = SOTBMPDATA[i][j] = ORIBMPDATA[i][j] = data.getPixel(i, j) == 0 ? 1 : 0;
				}
			}
			var p1:Vector.<Vector.<uint>>, p2:Vector.<Vector.<uint>>, p3:Vector.<Vector.<uint>>;
			p1 = ORIBMPDATA;
			p2 = FOTBMPDATA;
			p3 = SOTBMPDATA;
			var p4:Vector.<int> = new <int>[0,0,0,0,0,0,1,0,0,0, 0,0,1,0,1,0,0,0,0,0,
																			1,0,1,0,1,0,0,0,1,0, 1,0,0,0,0,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,1,0, 0,0,1,0,1,0,1,0,0,0,
																			1,0,1,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			1,3,0,4,1,0,1,0,1,3, 0,4,1,0,1,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,0,0, 0,0,1,3,0,4,1,0,1,0,
																			1,3,0,4,1,0,1,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			0,0,0,0,0,0,0,0,1,1, 0,2,1,0,1,0,1,1,0,2,
																			1,0,1,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
																			1,1,0,2,1,0,1,0,1,1, 0,2,1,0,1,0];
			p4.fixed=true;
			for (i = 1; i < THINNINGWIDTH - 1; i += 1) {
				for (j = 1; j < THINNINGHEIGHT - 1; j += 1) {
					if (!p1[i][j]) {
						p2[i][j] = 0;
						continue;
					}
					nbr = p1[i - 1][j] | (p1[i - 1][j + 1] << 1) | (p1[i][j + 1] << 2) | (p1[i + 1][j + 1] << 3) | (p1[i + 1][j] << 4) | (p1[i + 1][j - 1] << 5) | (p1[i][j - 1] << 6) | (p1[i - 1][j - 1] << 7);
					k = p4[nbr];
					if (k < 2) {
						p2[i][j] = 1 - k;
						continue;
					}
					if (i > 1) {
						nbn = p1[i - 2][j] | (p1[i - 2][j + 1] << 1) | (p1[i - 1][j + 1] << 2) | (p1[i][j + 1] << 3) | (p1[i][j] << 4) | (p1[i][j - 1] << 5) | (p1[i - 1][j - 1] << 6) | (p1[i - 2][j - 1] << 7);
					} else {
						nbn = (p1[i - 1][j + 1] << 2) | (p1[i][j + 1] << 3) | (p1[i][j] << 4) | (p1[i][j - 1] << 5) | (p1[i - 1][j - 1] << 6);
					}
					if (j > 1) {
						nbw = p1[i - 1][j - 1] | (p1[i - 1][j] << 1) | (p1[i][j] << 2) | (p1[i + 1][j] << 3) | (p1[i + 1][j - 1] << 4) | (p1[i + 1][j - 2] << 5) | (p1[i][j - 2] << 6) | (p1[i - 1][j - 2] << 7);
					} else {
						nbw = p1[i - 1][j - 1] | (p1[i - 1][j] << 1) | (p1[i][j] << 2) | (p1[i + 1][j] << 3) | (p1[i + 1][j - 1] << 4);
					}
					switch (k) {
						case 2:
							if (p1[i - 1][j] == 0) {
								p2[i][j] =1;
								continue;
							}
							//North(p)不可删除
							if (p4[nbn] == 0) {
								p2[i][j] = 0; //删除 p
								continue;
							} else {
								p2[i][j] = 1; //保留 p
								continue;
							}
							break;
						case 3:
							if (p1[i][j - 1] == 0) {
								p2[i][j] = 1;
								continue;
							}
							//West(p)不可删除
							if (p4[nbw] == 0) {
								p2[i][j] = 0; //删除 p
								continue;
							} else {
								p2[i][j] = 1; //保留 p
								continue;
							}
							break;
						case 4:
							if ((p1[i - 1][j] == 0) || (p1[i][j - 1] == 0)) {
								p2[i][j] = 1;
								continue;
							}
							//North(p)&West(p)均不可删
							if ((p4[nbn] == 0) && (p4[nbw] == 0)) {
								p2[i][j] = 0; //删除 p
								continue;
							} else {
								p2[i][j] = 1; //保留 p
								continue;
							}
							break;
					}
				}
			}
			changed = true;
			count = 2;
			for (; changed; ) {
				changed = false;
				if ((count & 1) == 0) {
					p2 = FOTBMPDATA; //输入
					p3 = SOTBMPDATA; //输出
				} else {
					p2 = SOTBMPDATA; //输入
					p3 = FOTBMPDATA; //输出
				}
				for (i = 1; i < THINNINGWIDTH - 1; i += 1) {
					for (j = 1; j < THINNINGHEIGHT - 1; j += 1) {
						if (p2[i][j] ==0) {
							p3[i][j] = 0;
							continue;
						}
						tmp1 = p2[i - 1][j] | (p2[i - 1][j + 1] << 1) | (p2[i][j + 1] << 2) | (p2[i + 1][j + 1] << 3);
						tmp2 = p2[i + 1][j] | (p2[i + 1][j - 1] << 1) | (p2[i][j - 1] << 2) | (p2[i - 1][j - 1] << 3);
						if ((count & 1) == 0) {
							nbr = tmp2 | (tmp1 << 4);
						} else {
							nbr = tmp1 | (tmp2 << 4);
						}
						k = p4[nbr];
						switch (k) {
							case 0: //不可删除
								p3[i][j] = 1;
								break;
							case 1: //可以删除
								p3[i][j] = 0;
								changed = true;
								break;
							//看看其北邻点是否可删,只有其北邻点不可删,当前点才可删
							case 2:
								if (p2[i - 1][j] == 0) {
									p3[i][j] = 1;
									continue;
								}
								if (i > 1) {
									tmp1 = p2[i - 2][j] | (p2[i - 2][j + 1] << 1) | (p2[i - 1][j + 1] << 2) | (p2[i][j + 1] << 3);
									tmp2 = (p2[i][j]) | (p2[i][j - 1] << 1) | (p2[i - 1][j - 1] << 2) | (p2[i - 2][j - 1] << 3);
								} else {
									tmp1 = (p1[i - 1][j + 1] << 2) | (p1[i][j + 1] << 3);
									tmp2 = (p1[i][j]) | (p1[i][j - 1] << 1) | (p1[i - 1][j - 1] << 2);
								}
								if ((count & 1) == 0) {
									nbn = tmp2 | (tmp1 << 4);
								} else {
									nbn = tmp1 | (tmp2 << 4);
								}
								//North(p)不可删
								if (p4[nbn] == 0) {
									p3[i][j] = 0;
									changed = true;
									break;
								}
								p3[i][j] = 1;
								break;
							//看看其西邻点是否可删,只有其西邻点不可删,当前点才可删
							case 3:
								if (p2[i][j - 1] == 0) {
									p3[i][j] =1;
									continue;
								}
								if (j > 1) {
									tmp1 = p2[i - 1][j - 1] | (p2[i - 1][j] << 1) | (p2[i][j] << 2) | (p2[i + 1][j] << 3);
									tmp2 = (p2[i + 1][j - 1]) | (p2[i + 1][j - 2] << 1) | (p2[i][j - 2] << 2) | (p2[i - 1][j - 2] << 3);
								} else {
									tmp1 = p2[i - 1][j - 1] | (p2[i - 1][j] << 1) | (p2[i][j] << 2) | (p2[i + 1][j] << 3);
									tmp2 = p2[i + 1][j - 1];
								}
								if ((count & 1) == 0) {
									nbw = tmp2 | (tmp1 << 4);
								} else {
									nbw = tmp1 | (tmp2 << 4);
								}
								//West(p)不可删
								if (p4[nbw] == 0) {
									p3[i][j] = 0;
									changed = true;
									break;
								}
								p3[i][j] = 1;
								break;
							case 4:
								if ((p2[i][j - 1] == 0) || (p2[i - 1][j] == 0)) {
									p3[i][j] = 1;
									continue;
								}
								if (i > 1) {
									tmp1 = p2[i - 2][j] | (p2[i - 2][j + 1] << 1) | (p2[i - 1][j + 1] << 2) | (p2[i][j + 1] << 3);
									tmp2 = (p2[i][j]) | (p2[i][j - 1] << 1) | (p2[i - 1][j - 1] << 2) | (p2[i - 2][j - 1] << 3);
								} else {
									tmp1 = (p1[i - 1][j + 1] << 2) | (p1[i][j + 1] << 3);
									tmp2 = (p1[i][j]) | (p1[i][j - 1] << 1) | (p1[i - 1][j - 1] << 2);
								}
								if ((count & 1) == 0) {
									nbn = tmp2 | (tmp1 << 4);
								} else {
									nbn = tmp1 | (tmp2 << 4);
								}
								if (j > 1) {
									tmp1 = p2[i - 1][j - 1] | (p2[i - 1][j] << 1) | (p2[i][j] << 2) | (p2[i + 1][j] << 3);
									tmp2 = (p2[i + 1][j - 1]) | (p2[i + 1][j - 2] << 1) | (p2[i][j - 2] << 2) | (p2[i - 1][j - 2] << 3);
								} else {
									tmp1 = p2[i - 1][j - 1] | (p2[i - 1][j] << 1) | (p2[i][j] << 2) | (p2[i + 1][j] << 3);
									tmp2 = p2[i + 1][j - 1];
								}
								if ((count & 1) == 0) {
									nbw = tmp2 | (tmp1 << 4);
								} else {
									nbw = tmp1 | (tmp2 << 4);
								}
								if ((p4[nbn] == 0) && (p4[nbw] == 0)) {
									p3[i][j] =0;
									changed = true;
									break;
								}
								p3[i][j] = 1;
								break;
						}
					}
				}
				count += 1;
			}
			for (i = 0; i < THINNINGWIDTH; i += 1) {
				for (j = 0; j < THINNINGHEIGHT; j += 1) {
					data.setPixel(i, j, SOTBMPDATA[i][j] ? 0x0 : 0xFFFFFF);
				}
			}
			return (processor.inset(data, 1));
		}
	}
}