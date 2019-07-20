Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 931186EE40
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jul 2019 09:35:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0074285AE;
	Sat, 20 Jul 2019 07:35:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DFB6402D;
	Sat, 20 Jul 2019 07:35:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 538F51800204;
	Sat, 20 Jul 2019 07:35:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6K7ZXHb022233 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jul 2019 03:35:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 386591001DD7; Sat, 20 Jul 2019 07:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3257D10190BA
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 07:35:30 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDCD230BC5EF
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 07:35:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so34257775wru.10
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aTgqFuUx+iLi6PHQcMOEzebXL2+OwnsPRMPIdzzMI50=;
	b=N98VZMUn7EWiC0MbiNP40BvMrQe6p/Gx2mE8wmrMIVNtjMd+JpagvU0arbPSWEYp81
	z7mvzLbLjYXz8BkgtHt5Ul+GRXesG4W/QYbuM/TxkcbADf571wVtIlD90aAuJRkjxHhh
	7s2l6XXzn57y0zimmCg1VTQxeVT7NRp/Fa/SmC6JbknLplEVj6oF/bvRKdm1AVa/Ydkh
	QpcXz5yiyOF4NUDCfpzc1a17PAgr5+RuxaGj5v8UjqSFR8kTAFO4HkzA5MLHYBZFFQqZ
	3QJTUEqSRDhXMuodbt0PgyPjfFiRZofYaHaeT/KM3iDpxcsPU3M6MY4vOZgLieHdV3bX
	cpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aTgqFuUx+iLi6PHQcMOEzebXL2+OwnsPRMPIdzzMI50=;
	b=KBe5f10bhFN9FX0MsdzJ3rqt4zc1LYEpNvWtGbaBA8Vuo7jHxIMEb4RvnrkerwUzEj
	RPnCVYb3C3/p68qKQ1biyEUmCQnEMwtMTp2GyWnkkMX8RRzOl2YsR648X9Y/xlN3okjQ
	yASOVYbWZrRpFsyCNZV1AWPBoeAC3AmVzfSIXO3igsyXrDD2kX+ZV1nV77zSmDjxc/rm
	3SwX/M7CHHpw9Z0LLfXJsml+WnVc7svzMHLOIoSYO8Pl/gFRvtA8ONiZQe8Hu1qFgmTt
	wShX8KwyeCU5WPiU/VWtjO1SAyOBRk5RGvpmhnUmkuV4Nopp9zlYc4pFgDq5t6e3ulcT
	8psw==
X-Gm-Message-State: APjAAAXAyj1dtS3E4E1I+VCj+uLrlZRMwr0ZYEKVfsGzvEpbE5xuFvPS
	J+IZXDyUW/kMPXO1fwZ0TuXgZ9xd0Lo=
X-Google-Smtp-Source: APXvYqzvUhh9TQTW84Wl2D2uGdpRQNZAqbHpd8XnY5c27KNJo7o336kxlMhwPJAFaXL7/TxXbySorQ==
X-Received: by 2002:adf:dd8e:: with SMTP id x14mr59960579wrl.344.1563608128567;
	Sat, 20 Jul 2019 00:35:28 -0700 (PDT)
Received: from [192.168.8.100] (37-48-49-65.nat.epc.tmcz.cz. [37.48.49.65])
	by smtp.gmail.com with ESMTPSA id
	p14sm27232138wrx.17.2019.07.20.00.35.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Jul 2019 00:35:27 -0700 (PDT)
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Horia Geanta <horia.geanta@nxp.com>
References: <20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<b042649c-db98-9710-b063-242bdf520252@gmail.com>
	<20190720065807.GA711@sol.localdomain>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
Date: Sat, 20 Jul 2019 09:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190720065807.GA711@sol.localdomain>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 20 Jul 2019 07:35:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 20 Jul 2019 07:35:30 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Sat, 20 Jul 2019 07:35:48 +0000 (UTC)

On 20/07/2019 08:58, Eric Biggers wrote:
> On Thu, Jul 18, 2019 at 01:19:41PM +0200, Milan Broz wrote:
>> Also, I would like to avoid another "just because it is nicer" module dependence (XTS->XEX->ECB).
>> Last time (when XTS was reimplemented using ECB) we have many reports with initramfs
>> missing ECB module preventing boot from AES-XTS encrypted root after kernel upgrade...
>> Just saying. (Despite the last time it was keyring what broke encrypted boot ;-)
>>
> 
> Can't the "missing modules in initramfs" issue be solved by using a
> MODULE_SOFTDEP()?  Actually, why isn't that being used for xts -> ecb already?
> 
> (There was also a bug where CONFIG_CRYPTO_XTS didn't select CONFIG_CRYPTO_ECB,
> but that was simply a bug, which was fixed.)

Sure, and it is solved now. (Some systems with a hardcoded list of modules
have to be manually updated etc., but that is just bad design).
It can be done properly from the beginning.

I just want to say that that switching to XEX looks like wasting time to me
for no additional benefit.

Fully implementing XTS does make much more sense for me, even though it is long-term
the effort and the only user, for now, would be testmgr.

So, there are no users because it does not work. It makes no sense
to implement it, because there are no users... (sorry, sounds like catch 22 :)

(Maybe someone can use it for keyslot encryption for keys not aligned to
block size, dunno. Actually, some filesystem encryption could have use for it.) 

> Or "xts" and "xex" could go in the same kernel module xts.ko, which would make
> this a non-issue.

If it is not available for users, I really see no reason to introduce XEX when
it is just XTS with full blocks.

If it is visible to users, it needs some work in userspace - XEX (as XTS) need two keys,
people are already confused enough that 256bit key in AES-XTS means AES-128...
So the examples, hints, man pages need to be updated, at least.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
