Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAA9AFA0
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07CEDA2FEA0;
	Fri, 23 Aug 2019 12:35:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A64721C6;
	Fri, 23 Aug 2019 12:35:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BCBC24F30;
	Fri, 23 Aug 2019 12:35:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7N4KmsR017035 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 00:20:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93E986DB9A; Fri, 23 Aug 2019 04:20:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFB95D9E5
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 04:20:45 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AABDBA2FC49
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 04:20:43 +0000 (UTC)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20190823042041epoutp0320d4a30275c33c2ac166f377ea38339c~9cmkmyqaB0317803178epoutp03t
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 04:20:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20190823042041epoutp0320d4a30275c33c2ac166f377ea38339c~9cmkmyqaB0317803178epoutp03t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1566534041;
	bh=U9CQGfPf7Zxphg8CE4vj2CGEfHozLAw9BdLrulJXIpQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QhzQ99Q+s7OJyjefXhpYoDvAsW3DK7/LFIU21EA7b4+6nh13DmSti3lqMKcmGAKWO
	lzD+8En9ocjh3hZIFpZ81fbsnqaYkA5jsajtaBr/CI/RjF1UQLRbTd9OwkMga6N/8V
	xC6VaLUUqY9vM+HB9jVKYNeeRf7T5kz4Cxj0x1l8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20190823042040epcas2p17215f2c69bfbe74bf1dd25f056d546a5~9cmkK5AaC1326813268epcas2p1e;
	Fri, 23 Aug 2019 04:20:40 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 46F7VZ6Kj9zMqYkl;
	Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	49.3F.04068.6996F5D5; Fri, 23 Aug 2019 13:20:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99~9cmh6hZPJ2766127661epcas2p2u;
	Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20190823042038epsmtrp1c49a7bd6aa12bbb926aaf66ce98445cf~9cmh5Y2xO1457414574epsmtrp1Y;
	Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
X-AuditID: b6c32a47-5a1ff70000000fe4-76-5d5f6996ca5e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.DA.03638.6996F5D5; Fri, 23 Aug 2019 13:20:38 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20190823042038epsmtip202663c369e2490843c132f4082264787~9cmhs-2qz3185331853epsmtip2_;
	Fri, 23 Aug 2019 04:20:38 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Herbert Xu'" <herbert@gondor.apana.org.au>
Date: Fri, 23 Aug 2019 13:20:37 +0900
Message-ID: <017901d5596a$1df3a590$59daf0b0$@samsung.com>
MIME-Version: 1.0
Thread-Index: AdVZag9UHlxLlVT+SOip4zSP4KGOkw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTZxjOd3e9qz+6nRX1s1m27oZ/qAFa8LoPAwtjTC/OP0imWdx09VIu
	Be2v9FoGJhMnrivIKPwxlcoMKjFaZbBCEB1ls7IhE4SIuEGcU2mWFaIYWEmqxa3tYcZ/z/u8
	z5Pvfb43rxxXNlAqeYnFIdgtvIkhlxKd19fr0o6V6Pdoqh5pUOQfN4Faf/0FRxf/8JDo5jeD
	GGocOkKgwJOTMtTSHcPR0cnXUKjVi6Pfn7lkyDMxhaOhoTYK+SfuylBgfCP6834UQw2n7pHo
	9pmtaPLUHIG6A/0EGrnaSKLefz0AnRjqwZDr+whAX9ZEKdTX8lHeWq7jwhjGHWn/jOv8aR03
	Mujk/L4qkrt3t5vk2psruB+aZjHu8MDPODfdM0pytR0+wM36Xy9c/rEpp1jgiwS7WrAYrEUl
	FmMu88GH+vf0rE6jTdNmo7cZtYU3C7lMwfbCtC0lpnh2Rl3Km5xxqpAXRSbjnRy71ekQ1MVW
	0ZHLCLYik02rtaWLvFl0WozpBqt5s1ajyWTjyr2m4vovLlE2F1UWGBmQHQLDsmqwRA7pTfBY
	7QO8GiyVK+kuAKPtNwipmAHw5umzWEKlpOcAnLtRUQ3kScfxW0pJEwAwGI0AqQgDOFxZSSYM
	JL0Rtvf5QAKn0Bp42f88KcLpFxQMzQSJRGMlzcL7vUeTBoJeByN143gCK+hsGIr1AgmvgP0N
	oaQep9+Alx834tLcatg1OLXwQDpscdXhkiYFnqxyJfNAep6C1+YfAclQAJ9MP10IvRJO9nVQ
	ElbBsMe1gCvg6LmzlGSuAXDg2ctGFvT+9RVI5Mfp9bD1aob0FW/B3vGF2V6B7uvzlEQroNul
	lIyp8NuZEUyiVfBpzUGJ5mCsthGrA296F4X0LgrpXRTG+/+zTYDwgdWCTTQbBTHTlrV4136Q
	PIsNW7tA563tQUDLAbNcYXN/ukcp40vFcnMQQDnOpChK6+OUoogvPyDYrXq70ySIQcDGd1CP
	q1YZrPEjszj0WjZTp9Nks4jVZSJmjcK/bGy3kjbyDmG/INgE+0sfJl+iOgTa0qbqm/V9jtVf
	Z53v3rUv9mOVO/zQb9j/fojKM/szUtnjO9JbI7R9H/XJeHN5bvnE7RVOLv9M0528fo/Rmk37
	rtxZdW1L5eiuVw/4luGzhbETBZvCZWNthwV273QPp3qQvzOwO+U7w+f5D09Hr2zjU3c6h8uY
	/hfhd9fk/P3b8yBDiMW8dgNuF/n/AHcjOXksBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7bCSvO60zPhYg5vd4hZfv3SwWKw/dYzZ
	YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
	42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
	WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
	mT3e77vK5tG3ZRWjx+dNcgE8UVw2Kak5mWWpRfp2CVwZExvXsBe0sVfsvXyGtYHxAmsXIweH
	hICJxPRzQl2MXBxCArsZJfZt2goU5wSKS0lsbd/DDGELS9xvOcIKUfScUaJ5wlYmkASbgLbE
	5uOrGEFsEQEDie2bfoPZzALTOCR2fRAHsYUFTCXuHelmA7FZBFQlvk64BTaUV8BS4smfI4wQ
	tqDEyZlPWEAOYhbQk2jbCDVGXmL72zlQNyhI7Dj7GmqVnsTatgnMEDUiErM725gnMArOQjJp
	FsKkWUgmzULSsYCRZRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnAK0NLawXjiRPwh
	RgEORiUe3oKOuFgh1sSy4srcQ4wSHMxKIrxlE4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeeXz
	j0UKCaQnlqRmp6YWpBbBZJk4OKUaGJleBy6rntzmuGvaFQ/TC0tPxR1V2Lv0/O0JJTxHt4iq
	PW/OX3fnooDzAs+gmqwVK5juHXgRWVM+MbmyWHaWdmiF5pRFR3sX/+qpvK/L7ugiasB35P8l
	BRYdxbOKQgI+W66KntnNPbVk0132vqUn7/1Z+4+jPnjLzQahq/ZME2X+cSm0zQy9bKDEUpyR
	aKjFXFScCADJMiVD/QIAAA==
X-CMS-MailID: 20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99
References: <CGME20190823042038epcas2p2000738f3ca7f5f3d92ea1c32de2bcf99@epcas2p2.samsung.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 23 Aug 2019 04:20:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 23 Aug 2019 04:20:44 +0000 (UTC) for IP:'203.254.224.33'
	DOMAIN:'mailout3.samsung.com' HELO:'mailout3.samsung.com'
	FROM:'boojin.kim@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 203.254.224.33 mailout3.samsung.com 203.254.224.33
	mailout3.samsung.com <boojin.kim@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Fri, 23 Aug 2019 12:35:25 +0000 (UTC)

On Wed, Aug 21, 2019 at 17:19:41PM +0900, Herbert Xu wrote:

> On Wed, Aug 21, 2019 at 04:57:41PM +0900, boojin.kim wrote:
> >
> > Can you tell me which patch you mentioned? Is this?
> > https://patches.linaro.org/project/linux-crypto/list/?series=22762
> >
>
> Yes this is the one.
>
> Cheers,

I looked at ESSIV patch-set.
Can you please confirm that you mean:
'Register FMP as the template of skcipher instead of diskcipher,
and simplify the interface for FMP user'

If yes, I think the following API needs to be added to skcipher:  
- _set(): BIO submitter (dm-crypt, f2fs, ext4) sets cipher to BIO.
- _mergeable(): Block layer checks if two BIOs have the same cipher.
- _get(): Storage driver gets cipher from BIO.
- _set_crypt(): Storage driver gets crypto information from cipher and 
writes it on the descriptor of Storage controller.
Is it acceptable to skcipher ?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
