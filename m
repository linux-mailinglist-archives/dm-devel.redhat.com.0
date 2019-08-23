Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F09AF9B
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6853618C4271;
	Fri, 23 Aug 2019 12:35:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3532F721DF;
	Fri, 23 Aug 2019 12:35:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B206D180BA99;
	Fri, 23 Aug 2019 12:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7N7IxUv021796 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 03:19:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB25860610; Fri, 23 Aug 2019 07:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D7F60933
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 07:18:57 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8EDBA2F86B
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 07:18:54 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20190823071851epoutp032a55818bd0fb69cdc090199228c27463~9fCJBaP8c1749517495epoutp03j
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 07:18:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20190823071851epoutp032a55818bd0fb69cdc090199228c27463~9fCJBaP8c1749517495epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1566544732;
	bh=+fYE/jWK1CRZuDZ2tVBT+Ef/F2Gp0hZ+OjNZD7CcuN0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=JPCoQLPyMnwUsXcRJAb87lIbwjVAz8UJnhO9geXbleKdINR95oS+Pk7MPNyeSIKlr
	Ie5LM4HsFuPx33ZSSTfcMnvc55/lFYB3Po/KTATm56/rPppRH16qhqPtM2q1rTtoUK
	Y+RZMMMZQWD9EG8hvLGNnIEbSL4l0oI/7oyWJQfs=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20190823071851epcas2p2a4a203c12c80c1285afac51eb7c84d8f~9fCIdn5SC1459514595epcas2p2h;
	Fri, 23 Aug 2019 07:18:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.182]) by
	epsnrtp5.localdomain (Postfix) with ESMTP id 46FCS92KMhzMqYkd;
	Fri, 23 Aug 2019 07:18:49 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.3F.04112.9539F5D5; Fri, 23 Aug 2019 16:18:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2~9fCGBJdVk1882918829epcas2p3k;
	Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20190823071848epsmtrp10b85cadf4258caf7cfd003e7d6717ccd~9fCF-zuWg1973319733epsmtrp1u;
	Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
X-AuditID: b6c32a48-f37ff70000001010-57-5d5f935942ee
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	77.E5.03706.8539F5D5; Fri, 23 Aug 2019 16:18:48 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20190823071848epsmtip1133664f58af60792a11a792437cc8f99~9fCFn2bUi1770217702epsmtip1x;
	Fri, 23 Aug 2019 07:18:48 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Herbert Xu'" <herbert@gondor.apana.org.au>
Date: Fri, 23 Aug 2019 16:18:47 +0900
Message-ID: <002b01d55983$01b40320$051c0960$@samsung.com>
MIME-Version: 1.0
Thread-Index: AdVZgoTeM6vEQWOMSaO8aX0QkbtHrA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjN7Xt9r6JdrqVudw3bujc0EQO2ne0uC2xmY/jMTMSZuOjGujf6
	Uoj9lb6WqdmEbFAB2dAYEQoSf8XNbgQtiMS1hCCs4kSyEYwarVskqwIriIABRdbycOO/853v
	nPt9J1+ujFAcoVWyApuLd9o4C0MlkK2XVhtStx8y5mrC1XI8OVFG4qYrvxL4pztVFP7tcK8E
	1/eVkDgYrZPixsBTAu8fSsKDTV4C35jxSHHVvWEC9/WdpbH/3nUpDt5ag++GpyW4tuE2hf84
	sQEPNUyROBDsIXH/xXoKd81VAVzT1y7BnnOTAJdWTtM41Pjx+pfZljM3JWxJ85dsa8dKtr/X
	zfp95RR7+3qAYptPFbG/HHskYb+52k2wo+0DFPt9iw+wj/yv5izbYcnI5zkT71Tztjy7qcBm
	zmQ+3Gp836g3aLSp2nT8FqO2cVY+k8nalJOaXWCJZWfUhZzFHaNyOEFg1r6T4bS7Xbw63y64
	MhneYbI4tFpHmsBZBbfNnJZnt76t1Wh0+pjyc0v+yPkfpY4QvevOz2GiGBynKsASGYLrUPnI
	abICJMgUsA2gga4wIRbjAEWiE7RYTAE0fqD2P0v0/jAdxwoYBOjxRLYoegDQ04fnpfEGBdeg
	5pAPxLESatAF/xMQFxHwGY0GxzvJeCMR6lG4a3/sVZmMhCtRw6QxTsthOmo82kOJeDnqqR2c
	lxPwNXThn3pCXEKN2nqHQdyqhGnIU+IUJUpUV+5ZkEzT6Er/chFnobpvRyUiTkRDoRZaxCr0
	oMqzgIvQwOmT84ERrATo6szzxpvI+/e++VkEXI2aLq6NQwTfQF23FjZ7AZVdmqVFWo7KPArR
	mIyOjvdLRFqFxir3ijSLhh6XggPgde+iiN5FEb2Lsnj/H3sMkD7wIu8QrGZe0DnWLb60H8x/
	ihS2DXRc29QJoAwwy+SXKz7LVUi5QmG3tRMgGcEo5YUHY5TcxO3ewzvtRqfbwgudQB87wEFC
	tSLPHvtiNpdRq9cZDJp0PdYbdJh5Se5fevNTBTRzLn4nzzt453OfRLZEVQzWp3SsqI8EehAc
	G/xA+D0yV5R8ZiL4SQgmrNr6Q7mueOmN4u+UjRHSvfH+u9fYVaaxqZzWuj0j1dtqyo7MKLt3
	Hv6o4VDyX1knc7/elr1xy+xkS0Yi0335meYLvW/vn9GkVONcYPNs5Kz2q+pXkvZ17zrVXjlq
	vlvzXulszY7pJ5HoQ4YU8jltCuEUuH8B2IqajSoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSnG7E5PhYg87bihZfv3SwWKw/dYzZ
	YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
	42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
	WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
	mT3e77vK5tG3ZRWjx+dNcgE8UVw2Kak5mWWpRfp2CVwZb7auYC04zl5xd8095gbGhWxdjJwc
	EgImEu9evGYHsYUEdjNK9B0xgYhLSWxt38MMYQtL3G85wtrFyAVU85xR4syCxWANbALaEpuP
	r2IEsUUEDCS2b/oNZjMLTOOQ2PVBHMQWFjCVuHekG2gZBweLgKrEvK/xIGFeAUuJtXNPskHY
	ghInZz5hASlhFtCTaNsINUVeYvvbOVAnKEjsOPuaEaREBKSkpQiiRERidmcb8wRGwVlIBs1C
	GDQLyaBZSDoWMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjn8tzR2Ml5fEH2IU
	4GBU4uEt6IiLFWJNLCuuzD3EKMHBrCTCWzYRKMSbklhZlVqUH19UmpNafIhRmoNFSZz3ad6x
	SCGB9MSS1OzU1ILUIpgsEwenVAPj/OSa9W1d/dfS9K63n54b1X3C+cSWAqnD/vI1HyIsY87q
	y9e/2CLn6c+WUXD5Ym3vnseaC/u2PP5mt3a5zZYUj0uvzY7c3Zv15QDjJeHpgkwt3gwHH/eF
	CF+KdStfHfH8kRKHhM5DuXgjtzMbfnMVufJKnMreU1zOr6S3rV5ln++hk4tZLD4qsRRnJBpq
	MRcVJwIAsdKINPsCAAA=
X-CMS-MailID: 20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2
References: <CGME20190823071848epcas2p3fe4d229d22b14162c354f88a29f366c2@epcas2p3.samsung.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 23 Aug 2019 07:18:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 23 Aug 2019 07:18:55 +0000 (UTC) for IP:'203.254.224.33'
	DOMAIN:'mailout3.samsung.com' HELO:'mailout3.samsung.com'
	FROM:'boojin.kim@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 203.254.224.33 mailout3.samsung.com 203.254.224.33
	mailout3.samsung.com <boojin.kim@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
Cc: 'Ulf
	Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
	dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
	'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	'Herbert Xu' <herbert@gondor.apana.org.au>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Kukjin Kim' <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	'Chao Yu' <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	'Jens Axboe' <axboe@kernel.dk>, 'Theodore Ts'o' <tytso@mit.edu>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"'David S. Miller'" <davem@davemloft.net>
Subject: Re: [dm-devel] [PATCH 6/9] dm crypt: support diskcipher
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Fri, 23 Aug 2019 12:35:16 +0000 (UTC)

On Fri, Aug 23, 2019 at 01:28:37PM +0900, Herbert Xu wrote:
>
> No.  If you're after total offload then the crypto API is not for
> you.  What we can support is the offloading of encryption/decryption
> over many sectors.
>
> Cheers,

FMP doesn't use encrypt/decrypt of crypto API because it doesn't
expose cipher-text to DRAM.
But, Crypto API has many useful features such as cipher management,
cipher allocation with cipher name, key management and test manager.
All these features are useful for FMP.
FMP has been cerified with FIPS as below by using test vectors and
test manager of Crypto API.
https://csrc.nist.gov/projects/cryptographic-module-validation-program/Certi
ficate/3255
https://csrc.nist.gov/CSRC/media/projects/cryptographic-module-validation-pr
ogram/documents/security-policies/140sp3255.pdf

Can't I use crypto APIs to take advantage of this?
I want to find a good way that FMP can use crypto API.

Thanks
Boojin Kim.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
