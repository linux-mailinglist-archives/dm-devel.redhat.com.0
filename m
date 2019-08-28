Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BCB9FE80
	for <lists+dm-devel@lfdr.de>; Wed, 28 Aug 2019 11:32:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EAF681DFF;
	Wed, 28 Aug 2019 09:32:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4DC4108;
	Wed, 28 Aug 2019 09:32:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D71C61802216;
	Wed, 28 Aug 2019 09:32:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7S2L3wr015668 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 22:21:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D43760BF7; Wed, 28 Aug 2019 02:21:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A0860BEC
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 02:21:00 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F943308FC22
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 02:20:59 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20190828022057epoutp0218e8cd851abea00e529cacf9cf623c52~_9MdSMSHP2281322813epoutp02u
	for <dm-devel@redhat.com>; Wed, 28 Aug 2019 02:20:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20190828022057epoutp0218e8cd851abea00e529cacf9cf623c52~_9MdSMSHP2281322813epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1566958857;
	bh=2Id8G/Xn6V06sAdZYXMptUi6MUxaX2z3h414AQSi5/I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=k98yVcHoY5eRWy55whZ8rcavcrMGw1LpHMDptIqy9vdMw+WVazwzt15mo01XkRRd9
	7l4/CVj1LA+KD2X9zJQ7pDyqu9or8QDc9Y8Ar0ut0xku1LRrop+z5Ki0aMLe43HoyD
	3N5pbfTIZQ6BYehWU3Hx+E4IXA0zFrHfzsrXO79E=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20190828022056epcas2p488315cc4e34969caaecc606d9bbd2c6e~_9Mc2Raic1168911689epcas2p4l;
	Wed, 28 Aug 2019 02:20:56 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.181]) by
	epsnrtp5.localdomain (Postfix) with ESMTP id 46J8c74t4rzMqYkf;
	Wed, 28 Aug 2019 02:20:55 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.C7.04156.705E56D5; Wed, 28 Aug 2019 11:20:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1~_9MbUtf8v2048620486epcas2p2Q;
	Wed, 28 Aug 2019 02:20:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20190828022055epsmtrp247236feb1b81a6eaa608658d164e62a4~_9MbTgesT1110211102epsmtrp2U;
	Wed, 28 Aug 2019 02:20:55 +0000 (GMT)
X-AuditID: b6c32a45-ddfff7000000103c-c4-5d65e5073e36
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.33.03706.605E56D5; Wed, 28 Aug 2019 11:20:55 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20190828022054epsmtip1cb959d74740696d9b606a29b76e0110e~_9MbAmhuG2545625456epsmtip1A;
	Wed, 28 Aug 2019 02:20:54 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Theodore Y. Ts'o'" <tytso@mit.edu>
Date: Wed, 28 Aug 2019 11:20:53 +0900
Message-ID: <009301d55d47$38606400$a9212c00$@samsung.com>
MIME-Version: 1.0
Thread-Index: AdVdRkQ7u+BKrKHPSQuBNN28o4N3VA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wbZRjOd3e9OybFs6vus6LrThYdE9arFj50qNG5XbL9gb+iMc56KZcW
	7a/0WjbUbATXUhiRQXRuhbG5GeNgla3UjQzKXGGSOqBOZGEEt8QxDKBsApuBiNr2WOS/53m+
	5/ne9/3efDSu+pzS0CV2t+iyC1aWXEGc7l6Xn0PdELfrWnqy0O05P4Faf/geRy2/1JLo4mf9
	GGqM7yFQZLpBgYKdf+No72QmGmsN4Gh4wadAtdencBSPn6RQ6PplBYqMrEfXrs5j6GDTKIl+
	OroFTTbdIVBnJEagwbONJOr5txagA/EuDPlO3QbIWzNPod7gG88/yIePX8H4PW07+NPfreUH
	+z18qLmK5Ecvd5J825e7+Y4jsxhf0XcB5292DZH8J+FmwM+GHilKf8u60SIKxaJLK9pNjuIS
	u7mQ3fqq8UWjIU/H5XAFKJ/V2gWbWMhu2laUs7nEmpid1ZYKVk9CKhIkid3w7EaXw+MWtRaH
	5C5kRWex1clxzlxJsEkeuznX5LA9zel0ekPC+a7VUn/1EOWsTN/Zd7hWUQ4uplUDmobMUzBY
	KVaDFbSKaQfw5/EmhUxmALw5vI+UyZ0E8VaAuwlveIusRwD8bfhPXCYTAJ7/ay4RT6NJZj1s
	620GSaxmHodDi/Opa3HmHwqOzUSJ5MFKRg+91XuxJCaYtXCi6hKWrKBkCuCl/auTspK5D8YO
	jqXsOLManvmjEU9iyGhhe/9UqiE1kwuPjr8iW9SwocqX6gcyixQcb/ATsn8T/NgbWcquhJO9
	YUrGGjg7HSFlvBsOfXWMksM1APYt+JZMT8LAeGWqGM6sg61nN8gP8SjsGVlqLQP6uxcpWVZC
	v08lB7PgoZlBTJY18FbNLlnmYThcD/aBNYFlMwaWzRhYNkzg/7JHANEMHhCdks0sSnont3zT
	IZD6FNkvtYMDA9uigKEBm6703ytuVymEUqnMFgWQxlm18teshKQsFso+EF0Oo8tjFaUoMCQ2
	UIdr7jc5El/M7jZyBn1enq7AgAx5esSuUrbdc+VtFWMW3OL7ougUXXdzGJ2mKQdm9e/PFMRj
	773zBV9v6lKSE4+Fdg3MVVyYek5SKp6IvRms40syMn5sObHq/EM7TOdOZkd21tVrz2WWWSYa
	Tk1jU4dBJy2xr58IfXvmNZtpf0UpZ87vuHGreyBmffiFeJeR+Kaj91prJhoJlleXfXpsob0n
	mv91KTg++mHN1o/EzJdZQrIIXDbukoT/AJPWV5kqBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCSnC7709RYg94Ki69fOlgs1p86xmyx
	+m4/m8XpqWeZLOacb2Gx2PtuNqvF2j1/mC26X8lYPFk/i9nixq82Vov+x6+ZLc6f38Busenx
	NVaLvbe0Le7f+8lkMXPeHTaLS4vcLV7N+8ZisWfvSRaLy7vmsFkc+d/PaDHj/D4mi7aNXxkt
	Wnt+slscXxvuIOmxZeVNJo+WzeUe2w6oelw+W+qxaVUnm8eda3vYPDYvqffYveAzk0fTmaPM
	Hu/3XWXz6NuyitHj8ya5AJ4oLpuU1JzMstQifbsEroxJ9+ayF7TzVJyZ38/awHias4uRg0NC
	wESidYt7FyMXh5DAbkaJkzPfsHYxcgLFpSS2tu9hhrCFJe63HAGLCwk8Z5T43FQAYrMJaEts
	Pr6KEcQWEdCQuPr3J1gNs8A0DoldH8RBbGEBI4nWrm4mEJtFQFXiZedFJpC9vAKWEhenyYOE
	eQUEgdY+YQEJMwvoSbRtZISYIi+x/e0cqAsUJHacfc0IUiICVLLoWRBEiYjE7M425gmMgrOQ
	DJqFMGgWkkGzkHQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHPtamjsYLy+J
	P8QowMGoxMPbwZ8aK8SaWFZcmXuIUYKDWUmE95EKUIg3JbGyKrUoP76oNCe1+BCjNAeLkjjv
	07xjkUIC6YklqdmpqQWpRTBZJg5OqQbGCe6KPu0piqufKnP1tu34wfCOpXqGoZpO67oI2VcH
	eqz4CosPzjLUeH51hWb/iW3c2p8WGrj7dMxw+SJmk/ti5rSjDMePZCbVPPVd3qPhWBbPHjtv
	ZbFB6qVNv9OePpv046uo851LB0VeyiS+PenWVX+k+d80Jp7Pto/8NjFKWcr4L715Z/M0JZbi
	jERDLeai4kQAn059LPkCAAA=
X-CMS-MailID: 20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1
References: <CGME20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1@epcas2p2.samsung.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Wed, 28 Aug 2019 02:20:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 28 Aug 2019 02:20:59 +0000 (UTC) for IP:'203.254.224.25'
	DOMAIN:'mailout2.samsung.com' HELO:'mailout2.samsung.com'
	FROM:'boojin.kim@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 203.254.224.25 mailout2.samsung.com 203.254.224.25
	mailout2.samsung.com <boojin.kim@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 28 Aug 2019 05:31:41 -0400
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
Subject: Re: [dm-devel] [PATCH 5/9] block: support diskcipher
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 28 Aug 2019 09:32:07 +0000 (UTC)

On Tue, Aug 27, 2019 at 05:33:33PM +0900, boojin.kim wrote:
>
> Hi Boojin,
>
> I think the important thing to realize here is that there are a large
> number of hardware devices for which the keyslot manager *is* needed.
> And from the upstream kernel's perspective, supporting two different
> schemes for supporting the inline encryption feature is more
> complexity than just supporting one which is general enough to support
> a wider variety of hardware devices.
>
> If you want somethig which is only good for the hardware platform you
> are charged to support, that's fine if it's only going to be in a
> Samsung-specific kernel.  But if your goal is to get something that
> works upstream, especially if it requires changes in core layers of
> the kernel, it's important that it's general enough to support most,
> if not all, if the hardware devices in the industry.
>
> Regards,

I understood your reply.
But, Please consider the diskcipher isn't just for FMP. 
The UFS in Samsung SoC also has UFS ICE. This UFS ICE can be registered 
as an algorithm of diskcipher like FMP.

Following is my opinion to introduce diskcipher.
I think the common feature of ICE like FMP and UFS ICE, 
is 'exposing cipher text to storage".
And, Crypto test is also important for ICE.  Diskcipher supports
the common feature of ICE. 
I think specific functions for each ICE such as the key control of UFS ICE
and the writing crypto table of FMP can be processed at algorithm level.

Thanks for your reply.
Boojin Kim.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
