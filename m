Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DC8FA204945
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jun 2020 07:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592890587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mLQ/WridmULqwOWeX5VekqhxwfIGIXUTnprgTbj2Zgw=;
	b=KPOYNYw67qyA9MHEBiGNyf3E5O3xf0KdMFofXJJP+IcKMILIhowZa9qw0VY1ZhLUMKiFdB
	T/2/yh9OkTSOQoBdH6GxkKJTP3mDmVF7whM6i5jVeBYZb5bbexWhgaWjRlEhRLuFKC24jz
	P3sKUJy4hkzaN590ALVfAl/CCq0upaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-VAqrLa7zPee7nWviZfVMXw-1; Tue, 23 Jun 2020 01:36:25 -0400
X-MC-Unique: VAqrLa7zPee7nWviZfVMXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ACE5107ACF2;
	Tue, 23 Jun 2020 05:36:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A515D9DA;
	Tue, 23 Jun 2020 05:36:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67E06833C6;
	Tue, 23 Jun 2020 05:35:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05MNxtrA011312 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 19:59:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38F418A4AA; Mon, 22 Jun 2020 23:59:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DAB8A4A7
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 23:59:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 544FD811E77
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 23:59:52 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-fu3u0MxpPvukjfuRnvOT8Q-1; Mon, 22 Jun 2020 19:59:47 -0400
X-MC-Unique: fu3u0MxpPvukjfuRnvOT8Q-1
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
	20200622235945epoutp01468d5b68b9175d81a8ae11d19284b054~bAy0Iqz3Z0474904749epoutp017
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 23:59:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
	20200622235945epoutp01468d5b68b9175d81a8ae11d19284b054~bAy0Iqz3Z0474904749epoutp017
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20200622235944epcas1p1d7b823d4a1887b71eccd67af654f27fe~bAyzmnqUJ1886118861epcas1p11;
	Mon, 22 Jun 2020 23:59:44 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.166]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 49rRGl41M6zMqYkk;
	Mon, 22 Jun 2020 23:59:43 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	73.54.28581.FE541FE5; Tue, 23 Jun 2020 08:59:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20200622235942epcas1p3cda4faa2bf5ad932189cbe1a87b0b0fd~bAyyBP-sU2815928159epcas1p38;
	Mon, 22 Jun 2020 23:59:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20200622235942epsmtrp13d82fa0db9948bc0dac8fdbe90844315~bAyyAg5232670726707epsmtrp1d;
	Mon, 22 Jun 2020 23:59:42 +0000 (GMT)
X-AuditID: b6c32a38-2e3ff70000006fa5-fa-5ef145efa0c5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	10.F1.08303.EE541FE5; Tue, 23 Jun 2020 08:59:42 +0900 (KST)
Received: from [10.253.105.155] (unknown [10.253.105.155]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20200622235942epsmtip16d13b33e18f9c69da82d677090e641a9~bAyxdYJnb0379503795epsmtip1G;
	Mon, 22 Jun 2020 23:59:42 +0000 (GMT)
To: Milan Broz <gmazyland@gmail.com>, Mike Snitzer <snitzer@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>
From: JeongHyeon Lee <jhs2.lee@samsung.com>
Message-ID: <250156a6-a2d6-dbfd-daa3-be9c36f0cf36@samsung.com>
Date: Tue, 23 Jun 2020 08:53:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b7eaf4a7-6692-ffdf-2bbc-b622f93ef601@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmnu57149xBr1P5SzWnzrGbPHkQDuj
	xd53s1ktju2fxW6xsG0Ji8XlXXPYLJaueMtq0bbxK6MDh8fOWXfZPRZsKvVY3DeZ1eP9vqts
	Hp83yQWwRuXYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
	5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMDQo0CtOzC0uzUvXS87PtTI0
	MDAyBapMyMmYdnEha8EW/op1K3gbGKfwdDFyckgImEhce/+TsYuRi0NIYAejxL/bd5ghnE+M
	El+ezYbKfGaUuH96KhtMy4dXz5kgErsYJQ6uOwPlvGeU+Ll6EwtIlbCAnsTHzq+sILaIQJHE
	tAVNYHFmILv381uwOJuAtsTtlk3sIDavgJ3E338XmUBsFgFVid27l4LViwpESNw/toEVokZQ
	4uTMJ2BxTgFbiY3rjjJBzJSX2P52DjOELS5x68l8sIMkBHo5JDZNmMUCcbaLxIT+U6wQtrDE
	q+Nb2CFsKYmX/W1QdrnElabLjBB2jcSEC91Q9cYS81sWAi3gAFqgKbF+lz5EWFFi5++5jBB7
	+STefe1hBSmREOCV6GgTgihRkljx7xrUBRISGw53QwPRQ2Jp63TWCYyKs5B8NgvJN7OQfDML
	YfECRpZVjGKpBcW56anFhgUmyJG9iRGcTLUsdjDOfftB7xAjEwfjIUYJDmYlEd7XAe/ihHhT
	EiurUovy44tKc1KLDzGaAsN6IrOUaHI+MJ3nlcQbmhoZGxtbmJiZm5kaK4nznrS6ECckkJ5Y
	kpqdmlqQWgTTx8TBKdXAxCouFXBE41fyuvWJXNlmamvSz7/05lghwtP/J/mP/pE1hdP2lCw+
	bbZ1Xr9XiMyUuVbBgg1+/6dKqc6+6TKhoqbf9ZdqoPCGkt95s930jm+Y0jOrOcr4v4ToX801
	bKbufvYfHd8Yfz99+INWVvDz3X2LDv/Ln2tc8s/Vp0lUNee8Ea/axCMMHU2Lurnla7wcrQWE
	JkyMvfqTs7zhx4mFhzRmG9Zk1y+UenvAluH/R/7okF5dyd/amy8fv7lWnXNLKSev7rcW5ZvS
	3S/Kfn2/uuLlarVtZlslHzf/3aS55WTVwlrBkPn3o+vOya2Sijfc9NmcYwZfeM3p+NtmzHtk
	kv0ueKzVSAn7MtPQ08xSiaU4I9FQi7moOBEAtqQW3C8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSnO47149xBktmGFqsP3WM2eLJgXZG
	i73vZrNaHNs/i91iYdsSFovLu+awWSxd8ZbVom3jV0YHDo+ds+6yeyzYVOqxuG8yq8f7fVfZ
	PD5vkgtgjeKySUnNySxLLdK3S+DKmHZxIWvBFv6KdSt4Gxin8HQxcnJICJhIfHj1nKmLkYtD
	SGAHo8TL9p1MEAkJiQ2b1rJ3MXIA2cIShw8XQ9S8ZZS4unovO0iNsICexMfOr6wgtohAkcS7
	BQ/AbGYge+ftk1BDtzFJTGyYzwKSYBPQlrjdsgmsmVfATuLvv4tgy1gEVCV2714KViMqECFx
	5v0KFogaQYmTM5+A2ZwCthIb1x1lglhgJjFv80NmCFteYvvbOVC2uMStJ/OZJjAKzULSPgtJ
	yywkLbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcPVpaOxj3rPqgd4iR
	iYPxEKMEB7OSCO/rgHdxQrwpiZVVqUX58UWlOanFhxilOViUxHm/zloYJySQnliSmp2aWpBa
	BJNl4uCUamCSZ/lyeI3ItBfuVxRWSWzKj3ZplDt7NIht6UaVnSkNjV+jH3u91N9lYt9u+O3W
	3hdrVynffuzzfIv8ta0X9j16+y28Kz79/bo1TRxbVuQ8tFqvf+yir6Hp94KWstPZkcWxO2y/
	MTNefRdy8WdUWYXsesa2vPMms1MvcbIrtfrKXlj4ek3oldvcqjOTtq0W9+dRELZJD1ZMPvO7
	1+x1rudJP20u/uKP575qLzTxNb+gI3vj0I+Vn65WqB68q1xjFWk7W3pa288HM2L4c7ovZU2y
	/LIy4qzhjLSs3dq7FwVIG30x921pnqRzjONiZFHJJl62w6yOHYsjqjY0b54b2Zd42TWdb33z
	/eQf0rb3612UWIozEg21mIuKEwGDjIQCDQMAAA==
X-CMS-MailID: 20200622235942epcas1p3cda4faa2bf5ad932189cbe1a87b0b0fd
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
	<20200618165006.GA103290@google.com>
	<20200618170952.GA18057@redhat.com>
	<b7eaf4a7-6692-ffdf-2bbc-b622f93ef601@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 23 Jun 2020 01:35:28 -0400
Cc: dm-devel@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	agk@redhat.com, linux-doc@vger.kernel.org
Subject: Re: [dm-devel] New mode DM-Verity error handling
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear Milan Broz.

Thank for your reply.


I didn't understand well, could you explain it in more detail?

For what reason isn't panic better?

Is it because there is a place to use other device-mapper?

Or other things? I just wonder. I would like to hear various 
explanations and information.


I just wanted user to use what they wanted through the options(flags).

Yes, If adding a new feature, modify user-space to support.


Oh, I'm sorry :(

If when i suggested new patch, i will send you a patch that increased 
minor version.

Thank you for all your detailed information.


Thanks.

JeongHyeon Lee



On 22/06/2020 16:58, Milan Broz wrote:
> On 18/06/2020 19:09, Mike Snitzer wrote:
>> On Thu, Jun 18 2020 at 12:50pm -0400,
>> Sami Tolvanen <samitolvanen@google.com> wrote:
>>
>>> On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
>>>> I do not accept that panicing the system because of verity failure is
>>>> reasonable.
>>>>
>>>> In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
>>>>
>>>> The device should be put in a failed state and left for admin recovery.
>>> That's exactly how the restart mode works on some Android devices. The
>>> bootloader sees the verification error and puts the device in recovery
>>> mode. Using the restart mode on systems without firmware support won't
>>> make sense, obviously.
>> OK, so I need further justification from Samsung why they are asking for
>> this panic mode.
> I think when we have reboot already, panic is not much better :-)
>
> Just please note that dm-verity is used not only in Android world (with own tooling)
> but in normal Linux distributions, and I need to modify userspace (veritysetup) to support
> and recognize this flag.
>
> Please *always* increase minor dm-verity target version when adding a new feature
> - we can then provide some better hint if it is not supported.
>
> Thanks,
> Milan
>
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

