Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 850796CA16
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CEA830BA077;
	Thu, 18 Jul 2019 07:40:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 931401001B02;
	Thu, 18 Jul 2019 07:40:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F127B1800208;
	Thu, 18 Jul 2019 07:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I7eJgX004522 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 03:40:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66CA260C77; Thu, 18 Jul 2019 07:40:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF3660C4C
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:40:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F71F30BA078
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:40:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id f9so27465916wre.12
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8Ets9DwLOZVAU6fNpoFk58BESPFJh1jtTqQh2d/rdgA=;
	b=Q8RSszfwbaBbTcKCdYB4rZi3IlzgC2nBGE4+cOKO37g6oLxfPfHR0yFvV51VyIaXV8
	dbe0496/B+HfIAgO/Q/HIgtV1GMya9jx8s5fYFl7IFhAC9+UvLch6tOduPB1G9atAFLA
	YZxrb6Wn/TFtbBj3TiOki4rRGf+pnRKulZcfQdoRTh5iIPztJU978326joEn8Pm9Zz5z
	2hXdIZ/ch1qo5haTon071iQ9oZteCR+BdW5yeesLajqQF9vA9H9cbsq8anMGDjmuyRho
	nu7mPghSn37t7sl8qeoRJ6phl01Ur84wrKmRax/DUdaapb3KzeihrVpXsU7HbM4bW5Ah
	eJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8Ets9DwLOZVAU6fNpoFk58BESPFJh1jtTqQh2d/rdgA=;
	b=P0TyAHrB172pvOf2dAzcjV0yVT1dEqpJJMt0UD98aaXBuDo1uc7MLRGvvpaZevK4th
	lf6voU6GZPAH+XNN9q/N4WuHNLRMWP80oSW+Wu5IEjOmmZt3KPiBYznAk1lUXzuBXnlW
	4FkkUPpeW9yVPNw1QBWymEKtq11kJzq/vj+7A7KDFPUL7aUO3hhXghe6SYbZC/dfuXRf
	2hivbNhZ1ZhLY7St3bx02+NJyYDWuxmy42OGCJiQNktu869HLuoH8z+SUT0nMnSVztHx
	ToXhPt6wXcSMztJnRW7J//9r2/xVASU4fPKcAczquO0PYuiebaw7ZMH33/S5/M6vl1ix
	ZPAQ==
X-Gm-Message-State: APjAAAW5q84Nf4/KnCeiR92EgmV0YrDB1f4SFv7lQBGS4vzf+bw5buOU
	S9G1xN5JaAMFB+oWPWBYqzrIXWCgmAM=
X-Google-Smtp-Source: APXvYqxbf6KAe77UBX6m38X+WIIUli0ULfcoB5r6fTp/YzaSZZTCqbBLoWOjawnGl/CjeYCxOX2JXg==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr40132324wrj.232.1563435613007; 
	Thu, 18 Jul 2019 00:40:13 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	r14sm24128962wrx.57.2019.07.18.00.40.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 00:40:12 -0700 (PDT)
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
Date: Thu, 18 Jul 2019 09:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Jul 2019 07:40:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 18 Jul 2019 07:40:14 +0000 (UTC) for IP:'209.85.221.54'
	DOMAIN:'mail-wr1-f54.google.com' HELO:'mail-wr1-f54.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.54 mail-wr1-f54.google.com 209.85.221.54
	mail-wr1-f54.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 18 Jul 2019 07:40:32 +0000 (UTC)

On 18/07/2019 09:21, Herbert Xu wrote:
> On Thu, Jul 18, 2019 at 09:15:39AM +0200, Ard Biesheuvel wrote:
>>
>> Not just the generic implementation: there are numerous synchronous
>> and asynchronous implementations of xts(aes) in the kernel that would
>> have to be fixed, while there are no in-kernel users that actually
>> rely on CTS. Also, in the cbc case, we support CTS by wrapping it into
>> another template, i.e., cts(cbc(aes)).
>>
>> So retroactively redefining what xts(...) means seems like a bad idea
>> to me. If we want to support XTS ciphertext stealing for the benefit
>> of userland, let's do so via the existing cts template, and add
>> support for wrapping XTS to it.
> 
> XTS without stealing should be renamed as XEX.  Sure you can then
> wrap it inside cts to form xts but the end result needs to be called
> xts.

While I fully agree here from the technical point of view,
academically XEX, XEX* is a different mode.
It would create even more confusion.

Couldn't resist, but this is a nice example of what happens when academic,
standardization, and reality meets in one place :)

XTS is already implemented in gcrypt and OpenSSL.
IMO all the implementation should be exactly the same.

I agree with Herbert that the proper way is to implement ciphertext stealing.
Otherwise, it is just incomplete implementation, not a redefining XTS mode!

See the reference in generic code - the 3rd line - link to the IEEE standard.
We do not implement it properly - for more than 12 years!

Reality check - nobody in block layer needs ciphertext stealing, we are always
aligned to block. AF_ALG is a different story, though.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
