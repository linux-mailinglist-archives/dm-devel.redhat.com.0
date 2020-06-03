Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 016731F03BB
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402452;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=AoPumZnhVQdwaZ6Q0iPiQQZfL9QZeV8qmE+N7QmkdnQ=;
	b=Yue4x0td7znwP0dI1CyMMtsLHdhQQdh6XZjhiAFNqPucGq5uZ5Fb87KFeoqZo91n0/so4Y
	cp1vecN1AX6yTRGgtokxiKqg6iAhVvCKkV+CM28pdPM+tfIJPbXmCsiU8OGl4GuE1FzNAL
	TUidK+m8LcT2SBNARyMNVo8oVd4hoXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-ricpNaoxN9atwJQWQzHRSQ-1; Fri, 05 Jun 2020 20:14:10 -0400
X-MC-Unique: ricpNaoxN9atwJQWQzHRSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4E4EC1A1;
	Sat,  6 Jun 2020 00:14:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD29019D71;
	Sat,  6 Jun 2020 00:14:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90B101805311;
	Sat,  6 Jun 2020 00:14:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053JUOdS020055 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 15:30:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57F98100B19F; Wed,  3 Jun 2020 19:30:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5321310CD2D1
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 19:30:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6882386CBA9
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 19:30:20 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-365-N0ezW2W0P06HfkoWnPWLGA-1;
	Wed, 03 Jun 2020 15:30:16 -0400
X-MC-Unique: N0ezW2W0P06HfkoWnPWLGA-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0Mb8d1-1jQGKH3FwR-00Kckz;
	Wed, 03 Jun 2020 21:30:10 +0200
To: Colin Ian King <colin.king@canonical.com>, dm-devel@redhat.com
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <6ae5a0f1-68d3-a0f9-e7f0-5c9f008204a8@web.de>
Date: Wed, 3 Jun 2020 21:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Bn9dduKdWLaVz4HGfEeblTBOd5rRdpGCjDDRsgChYo+6jdtV7Ws
	YYUJEh6HyaoK2PncVm7mLiizeMlL7mnMwVNUyh7qsfXOv7HT8iKhBumZ2KATjMc8/STPR48
	Ac1cmTRW1WisC1YPrsly5scavA5N04EWDF6K92msIMGe1Rr3lsjgpf1OLCvRBJlbk7JDYgc
	xEIOjeLYfHs23Rk1X8l9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8rATjH4Yuhc=:eEEMQqjK5dkT0Lh3bI34Rz
	aEpJqI3YbptUONxcHgRjdRXSsdkXAerOnNEv/2CDiVnOZoeGDHEiKNRMAPL4cyEsuyZBLovBz
	VPwhf8IB0lJJon3ShXH0bRgp3QTJ/eNWWeuFCS9EQ4/kB9oY7SEGBFPrRl+pWQ1fdf2I4jbeU
	U2Q77yWCMdmPaU3rWtnKXS0y33JgzWS74j3ahV6JnMTQ69+2ex5sSZIQ/yg9DKqkmHaej+3kI
	jDUmi7FssjkaRW2KTsY43uYpyqlj7SuA/aTj9WY0QMbsF8lML5SXA61E/zoaG+C5cAf1iuQVl
	8TtDGBL9pKn/SvIECWy1qx3kt71AEjq/JKqZ315M4AoGWPIBRYaA7MT4Ioi303ilrc/mcIHIn
	Ee8LUfKq2I/d6xto4yejeP6du13B0jsCy7VRiGLV4fIbdS0ZmqSa31oaeUP1HPFqDLp9C2wd8
	PTJUSYHbOnUc5tjyEi0Qb1RJ6yJJ9jXlF3QvQwLGcxJKGp0t4jWmkUTP9JyT5PdK5ftxqWnkM
	a/ZEt1wk+miN3vbbrhXdoz4LiexMUP3HxjgKnPNcvVKyx+EyOkLZ626oqVJWvlv5CEJSwirY1
	Gm5XXFp3KiEQkP14Dxpiq1HpfiF7l8K8zBT8esQJ16FUpNVfoMSHnCW+pYJw6tpHFC2tUkVOJ
	EouHtAAqCTCXI+BLdUxOqplaMqjdXzH1VRGKmey4KEOuzQmFDV0+tDTqCkQlukHm+opd6D4HO
	++p4Pd+8E6CmGxo2CqkJl5zxa2nfhBS3V60tXFpZNPknTLgzceK1Rv8KhNdZ46Ew1mM8LL8vR
	kXm1NWO6Dw1LLjqWIzUP2/1QvdUXVnXGqCvusrYKFiiPHPOoMbqNiBekgXyj4g2XpljVrLKCx
	O/SQ4ivIAolbmg9hrkcVEfo7byRcn60GKkcn1Qq628PC/n2F8PE/ksuD6bBxrNOQccCccpOX4
	y2YQURBHBbeAhjtHtS1gvAQdrlIfuTORT2jTSj4UZeE7dA274ULDqh4ahgoJr1cdCNK9anCiy
	8N9esFpYkmsHePBenS0tnlDJcwejEQONCcKBf+WzTLPzTY5AhqI4UvPSchvO3SeF/uT+LOqr3
	GN/avlPXWeQH30yZxUYRrLridX8v3D1/LY3Y26VcDzB/datjTsWYDpdKAq4D4Ded015Pkh+qS
	B5FjL32c0U5gii3xorB2n1KmipM6NO/6/ZZ3a0GSmB2D8hFO/mEodmkry+uSK/0hi12LwfCWr
	wTYZ0CUzZP2Mfa6ZU
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 053JUOdS020055
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm zoned: Fix memory leak of newly allocated
 zone on xa_insert failure
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBDdXJyZW50bHkgaWYgYW4geGFfaW5zZXJ0IGZhaWxzIHRoZW4gdGhlcmUgaXMgYSBtZW1vcnkg
bGVhZCBvZiB0aGUKPiByZWNlbnRseSBhbGxvY2F0ZWQgem9uZSBvYmplY3QuIOKApgoKSSBob3Bl
IHRoYXQgYSB0eXBvIHdpbGwgYmUgYXZvaWRlZCBmb3IgdGhlIGZpbmFsIGNoYW5nZSBkZXNjcmlw
dGlvbi4KClJlZ2FyZHMsCk1hcmt1cwoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==

