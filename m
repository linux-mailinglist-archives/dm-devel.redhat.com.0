Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 171E5BC599
	for <lists+dm-devel@lfdr.de>; Tue, 24 Sep 2019 12:18:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8A9B3007C5E;
	Tue, 24 Sep 2019 10:18:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F188C5C1B2;
	Tue, 24 Sep 2019 10:18:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E1B01800B74;
	Tue, 24 Sep 2019 10:18:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8O8Snd0005667 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Sep 2019 04:28:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28757608C0; Tue, 24 Sep 2019 08:28:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896B960852;
	Tue, 24 Sep 2019 08:28:46 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E147CA26674;
	Tue, 24 Sep 2019 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1569313715;
	bh=81JZBQpINSCG3/xfWngKEmRt/JYECAlDxcVtcKbD0XQ=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=hEr+GJ4RlK/hsMoY0C/r5GnM/nsLXtR9L9fV42Ha784ZP0Sc4t/aqOBD/fg1HZiBy
	i1uVvlHrGPxx/zcQtXq78+Y/KD9WNz/3HPFRjacY9XR1hA/dW7mWt+92f0ke2ko63S
	4YsFsEvHo/8F4aS94Z36l7FnvuBbDE6nCRyCijAg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.71.162]) by smtp.web.de (mrweb001
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MfYXz-1iWfm420E7-00P72Z;
	Tue, 24 Sep 2019 10:28:35 +0200
To: Valentin Schneider <valentin.schneider@arm.com>,
	Julia Lawall <julia.lawall@lip6.fr>
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
	<alpine.DEB.2.21.1909231228200.2272@hadrien>
	<d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
	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
	FEE=
Message-ID: <a1491516-a701-8804-8277-75fb5247191a@web.de>
Date: Tue, 24 Sep 2019 10:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
Content-Language: en-US
X-Provags-ID: V03:K1:+LGehVKc09r1KuvfQbU6UtXN4wMbiGphRgKwWf6E5/pcoBay+CX
	hxQtIG/AXQEA72ofNH+z/E/IQpI5dOlGwrkTiXGvRXac9WkyaBILSc1Nm7Y6OAR1aZzZvWg
	nHknsoTJNX0ExTzcE5uNE85trDQdcAC0c4Zi+3Wh4WnEWRN1kWL+oGgg1Dsbvi+YoiGCEiN
	8Xi5iXU/pgbViJyNEWwpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ndp5C+YO2XY=:bEjXmQLpbsDAKujsReYlP8
	/XjsIU2C+Ky2XLlpzdHutvatEFcllHuXSxRUC/kxW5mVs4L56PKsiWb3Vu/awYqYOSUjCiFtK
	Tn9ch+XE0/oigNL9MCWTwiVeKf/bl4s1ntlH+QK8zpEvIghww7JM9k0mLUP/MKrAgBcIJGXk6
	fFTmhQenEdXjTJjJtRE4qykb3cgp25icMONDt+BUgdfLscQDk79gZxs04A0VtoCP21oxIxYNs
	M9/mqOV9UawZUTzbd0k0GAHBRPp64+TqC8YIhXu9TXcLeBW+PFPqXCCU6kT718VIb3HthvWLr
	pcnu7HKUmXXdsvpfY0qiNtG3iOxFkdFA2FKJecfLN+VZlHVVbu1yaJ+bJlLebOfFKdwR1q3/r
	GlEDkuCt+L0BHFMgUge/73z14ZDk7KGwdJm6CykFn741DOBovrJDgDC6RiBotpTVbHtqPWj6V
	6NoW29Efn3woO+w1Nrodwj3W7HoDLZej+GyZy6Da8Cl6/cTNegUSGny8MyAoxbCW5gaiEsTb1
	C55rPTkg/WF4UxWSzF7x3OIUL3wHCVp5oDlCA+m201nBGwmnnLZchCXqmgWJLg9I8zXafKddS
	RIiiLMh2Va39nInIuOUxk80sTu6FVl9qBr3qCqAy8V5L3QuPhkktVyioTrCVqYVSTRX+I0/mM
	LGspeNnawObv8ixw0+lwHzH3N//oWVGlZgskvghpDq8vRH0tO/+YYVjrg+prIcLfoZxeWajJi
	0EsVGGgtOLIVAPAdh+ge5KNHqK3nxJ8lQG1VvelpOAX1YFrn/BVzG1UI1OzVqVKM4jaEN9b+b
	qXzH/7M3UTlAYS0GiP26fbg+yd/Fqf0wTsf8YcSc5pOHjyORTLwkRqcVd0r3xa/5VhFf6Yh8N
	TBayi9AAhDN1fyYMMVDhawHQzU8jy2448GMq4o8ze5kDpw6ZwkfnAHzboUSLwf64eurYTvWQG
	IkmrpazD352W9fmVxHlN+84kAdiRohhnJS9Rxp0rs21rPduut3yWyVsyA3hV3ttpfbu8V9NJf
	zF9ou78u4fguhc8JeEJOaj94oMGvFZ4hYceM/9vhku023HywU45SYPKwN1gIpgRkiYdSfZW9s
	xFIA9iaQArvMJ6HKnkb9sQ8p6CnMAsusNE+Aj4m54WGP/xTrHYIma4f60oFCs2XyX5D7oTDtX
	MA7L5LzS8o0IhUz/EW1A9YN59hv1REZcUDAt97uYZ8+H/6xx6wYnPxKfVfGQQ35r4f7GWyfDh
	vWqXuncgK1OxgPp40RuPQf91P3AKVzgbkTbNhqFhA99XjSI7T/vcRzwinywY=
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 24 Sep 2019 08:28:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 24 Sep 2019 08:28:45 +0000 (UTC) for IP:'212.227.15.3'
	DOMAIN:'mout.web.de' HELO:'mout.web.de'
	FROM:'Markus.Elfring@web.de' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, SPF_HELO_NONE,
	SPF_PASS) 212.227.15.3 mout.web.de 212.227.15.3 mout.web.de
	<Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8O8Snd0005667
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 06:18:27 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, rcu@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [dm-devel] sched: make struct task_struct::state 32-bit
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 24 Sep 2019 10:18:47 +0000 (UTC)

>>> identifier task_state =~ "^TASK_";
>>
>> Are there a lot of options?  You can also enumerate them in {}, ie
>>
>> identifier task_state = {TASK_BLAH, TASK_BLAHBLAH};
>
> Around a dozen, can be enumerated easily and is indeed probably better than
> a regexp.

Can the application of a regular expression be more convenient
for such an use case?


>> You want to look at the definitions of called functions?
>> Coccinelle doesn't really support that,

I got an other impression.


>> but there are hackish ways to add that.

How do you think about to discuss corresponding software development challenges?

Regards,
Markus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
