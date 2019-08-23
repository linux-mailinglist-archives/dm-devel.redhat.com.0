Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D419AF9F
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B12018C8910;
	Fri, 23 Aug 2019 12:35:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106B169736;
	Fri, 23 Aug 2019 12:35:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FDC2180BA9C;
	Fri, 23 Aug 2019 12:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7N0orrA011783 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 20:50:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D757F5C228; Fri, 23 Aug 2019 00:50:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D19F55C21A
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 00:50:51 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BE5B18C426B
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 00:50:49 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20190823005045epoutp03ef182b896df69d8878bb904c79bcdd0e~9ZvReerfN2277022770epoutp031
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 00:50:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20190823005045epoutp03ef182b896df69d8878bb904c79bcdd0e~9ZvReerfN2277022770epoutp031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1566521445;
	bh=f2ThUHwqU6SxyDkaBykTiPQlcm0wcRMy3IpQiQiChcs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qjJP3CPDZUoPqC+TllhSHlEzayDCNEEA/ZeZhRffZlSa6IWzZNyyy/WghomGNCSH3
	Ll12acSDQNebr7Gm85XsT73lLM+iAcMPvCd+fTuz8IXicflKfBccxTrV2stA77r50K
	SbznIaYWExt+HtvjAggHXAnol3/leqScWyxLjaic=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20190823005044epcas2p4d26d2085b61ee54bd5954b1c574ebbe6~9ZvRA3S2Y1951719517epcas2p4w;
	Fri, 23 Aug 2019 00:50:44 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.184]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 46F2rL3vD7zMqYkk;
	Fri, 23 Aug 2019 00:50:42 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.38.04149.2683F5D5; Fri, 23 Aug 2019 09:50:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20190823005041epcas2p3c8550c3fabbd6a6db6429cb06dbbf3a6~9ZvObUZVL1059310593epcas2p3U;
	Fri, 23 Aug 2019 00:50:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20190823005041epsmtrp1e67b842e0eeb29d74f2dcb22b227f249~9ZvOaIzfb2194621946epsmtrp1o;
	Fri, 23 Aug 2019 00:50:41 +0000 (GMT)
X-AuditID: b6c32a46-fd5ff70000001035-b2-5d5f38625f08
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F7.1A.03706.1683F5D5; Fri, 23 Aug 2019 09:50:41 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20190823005041epsmtip2748af0669304060f493849067826a76f~9ZvOI_Fjj0682606826epsmtip2h;
	Fri, 23 Aug 2019 00:50:41 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Date: Fri, 23 Aug 2019 09:50:41 +0900
Message-ID: <00da01d5594c$c9d87390$5d895ab0$@samsung.com>
MIME-Version: 1.0
Thread-Index: AdVZTE1TDvDE+uWuReO+5O58h7ifGg==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLsWRmVeSWpSXmKPExsWy7bCmhW6SRXysweKVkhZfv3SwWKw/dYzZ
	YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
	42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
	WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
	mT3e77vK5tG3ZRWjx+dNcgE8UTk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
	eYm5qbZKLj4Bum6ZOUC/KymUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKDA0L9IoT
	c4tL89L1kvNzrQwNDIxMgSoTcjI6Ly5kKvjFXLFyz1PWBsaJzF2MnBwSAiYSL6bdBLK5OIQE
	djBKHLn/Csr5xCix9PRDFgjnG6PEowUX2GFafl3vYoNI7GWUuPn/HVTLS0aJna+nsoBUsQlo
	S2w+vooRxBYR0JXYfGM5O0gRs8A/doknnw6BFQkL6EnMeLCYCcRmEVCV2PysF2gsBwevgKXE
	q49qIGFeAUGJkzOfgJUzC8hLbH87B+pwBYkdZ19DzdeTeN4xnR2iRkRidmcb2EESAj/ZJSb9
	ameBaHCR6JtwBcoWlnh1fAvUO1ISL/vboOx6iavLFrNDNPcwSpz5BZMwlpj1rJ0R5DhmAU2J
	9bv0QUwJAWWJI7egbuOT6Dj8lx0izCvR0SYE0agiMffTZSaIsJTEh546iLCHRPPBDrYJjIqz
	kDw5C8mTs5A8Mwth7QJGllWMYqkFxbnpqcVGBUbIkb2JEZwvtNx2MC4553OIUYCDUYmHt6Aj
	LlaINbGsuDL3EKMEB7OSCG/ZRKAQb0piZVVqUX58UWlOavEhRlNgFExklhJNzgfmsrySeENT
	IzMzA0tTC1MzIwslcd5N3DdjhATSE0tSs1NTC1KLYPqYODilGhhb2VZ9bj/4j9m9Iuf7vUUs
	J3MWHf0j1lTS2eO4QTdzw8b5G6K8pjDqvjtzN9nhxX13G1vnkq0G1TZrtL/4bHvHupRDP5rx
	VqSo+KHqV+sObK02DLrOElD9o+/Xi+W1bfOcdJRutyZXXz9cM4dTcjbnAX/x5gzHh1uvntDf
	efu79KO5c470TF6hxFKckWioxVxUnAgA7+Q96S0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7bCSvG6iRXyswZrzuhZfv3SwWKw/dYzZ
	YvXdfjaL01PPMlnMOd/CYrH33WxWi7V7/jBbdL+SsXiyfhazxY1fbawW/Y9fM1ucP7+B3WLT
	42usFntvaVvcv/eTyWLmvDtsFpcWuVu8mveNxWLP3pMsFpd3zWGzOPK/n9Fixvl9TBZtG78y
	WrT2/GS3OL423EHSY8vKm0weLZvLPbYdUPW4fLbUY9OqTjaPO9f2sHlsXlLvsXvBZyaPpjNH
	mT3e77vK5tG3ZRWjx+dNcgE8UVw2Kak5mWWpRfp2CVwZnRcXMhX8Yq5YuecpawPjROYuRk4O
	CQETiV/Xu9i6GLk4hAR2M0qc+72aHSIhJbG1fQ9UkbDE/ZYjrBBFzxklDhw4BVbEJqAtsfn4
	KkYQW0RAV2LzjeVgcWaBaRwSuz6Ig9jCAnoSMx4sZgKxWQRUJTY/6wXaxsHBK2Ap8eqjGkiY
	V0BQ4uTMJywgYWag8raNjBBT5CW2v50DdYKCxI6zr6E26Uk875gOtUlEYnZnG/MERsFZSCbN
	Qpg0C8mkWUg6FjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECE4BWpo7GC8viT/E
	KMDBqMTDW9ARFyvEmlhWXJl7iFGCg1lJhLdsIlCINyWxsiq1KD++qDQntfgQozQHi5I479O8
	Y5FCAumJJanZqakFqUUwWSYOTqkGxpkCz5+oMws9PX3b/Iwkf+SF3W8rQ53jHge67jXfcttX
	XfWf/YkDt2PWHm6XO/JJRet0fPHMFRtncfxadl8yhy+f9dwq5ZWcKeFMbiHrX7L3Sj37OZvd
	4obsuk/CfvZi882OzLqbKXEtsXAff8/CwM0+Hnof3BSz71z2LO/ouybA31ka2n+AWYmlOCPR
	UIu5qDgRAIuCqND9AgAA
X-CMS-MailID: 20190823005041epcas2p3c8550c3fabbd6a6db6429cb06dbbf3a6
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190823005041epcas2p3c8550c3fabbd6a6db6429cb06dbbf3a6
References: <CGME20190823005041epcas2p3c8550c3fabbd6a6db6429cb06dbbf3a6@epcas2p3.samsung.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Fri, 23 Aug 2019 00:50:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Fri, 23 Aug 2019 00:50:50 +0000 (UTC) for IP:'203.254.224.33'
	DOMAIN:'mailout3.samsung.com' HELO:'mailout3.samsung.com'
	FROM:'boojin.kim@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 203.254.224.33 mailout3.samsung.com 203.254.224.33
	mailout3.samsung.com <boojin.kim@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Subject: Re: [dm-devel] [PATCH 1/9] crypt: Add diskcipher
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 12:35:21 +0000 (UTC)

On Wed, 22 Aug 2019 at 17:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Your patch looks corrupted - wrapped by mailer. The easiest way
> usually is to use git format-patch and git send-email - then you do
> not have to worry about formatting etc.
>
> Best regards,
> Krzysztof

I'm using outlook instead of 'git send-email' because of workplace policy.
It's probably broken when I copied the code.
Thanks for your notice. I will be more careful.

Thanks for your reply
Boojin Kim.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
