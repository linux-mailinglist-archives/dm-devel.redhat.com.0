Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CFD6CD47
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 13:20:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5889B8553B;
	Thu, 18 Jul 2019 11:20:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C42D608C2;
	Thu, 18 Jul 2019 11:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 988851800206;
	Thu, 18 Jul 2019 11:20:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IBJmJ5008687 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 07:19:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47A5460A35; Thu, 18 Jul 2019 11:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A05608C2
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 11:19:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B795046288
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 11:19:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id u25so14912525wmc.4
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dVSqJxHc4hCvBMkoZU5D2dsbrzY2xQ+hZ5J9LTcwpq0=;
	b=fiRi2Hl+UrQDj+8dcNWYCnG1fNGF8sOVkl4NDNgxWp93/6q89O2hkW7pxrD6eahVWr
	hqWNLJNJJpenvEAcVSNdoN94+FnBvRFhqS+S223Vl+KHhXZKCwKGxi1L3wv7yQMgqyT6
	xd16JL6y4iBZImcqbChMkiqlWBrur1IhVHxGeMlVJM4aecueogn54AHZLPT1AXWYjfJK
	gN5YRzdt5sgRfRMhjmAZL/m/Ux/jGWf56/jtJg5dpUW8zp8JsqJl3nA+rHX2XLFCxhuR
	LJiia4/RTQFD3POvLh9V5nn2gTs3xQlB3W5s4hbpC1lMOq8Cxyf4MmT9GRfbJEb3NHLA
	tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dVSqJxHc4hCvBMkoZU5D2dsbrzY2xQ+hZ5J9LTcwpq0=;
	b=tQ4fXkMAABeo9V6HHzD9eCaSFKrrGljIFWVyKyaLAI8fH+8IoW/ifxXQCkxWKNtCF3
	6hXBUdzFgmu+UONwIcL2izMIg/61LInfKQ8l+Wzr7o4t7PK7Kqk6bOUMCISmGP22E8L4
	LoIdFK6s269yBqPkp5AZTGHqQ8A18X6lQaiiQ37C+qmRc0oWaDJjzJWjx1sJYEUdkx2a
	bWGw2bC26CkRKsy+7m5GveFJ7RFDXeKjRT3r0LZAFMvnslbI0w/vnyc1RcxZf4NvKxE6
	Z0D24WtmVwb/flLa9qGMpWmZNJn3EdazryJ/3095NeTkEOVzO+up5ztBWK3EA28n1RHT
	33fw==
X-Gm-Message-State: APjAAAX33ZK4UFjEwH4GJR11A6vug5UFU6sY/IUdE8WH88FdrQwPi0hb
	qAPwGAEjBRi7jtW8xuljOs0as/4PNlk=
X-Google-Smtp-Source: APXvYqzoS0Ffmm8deRB6JwC01KjMLES3GLEqqD/hHGxw/p+yQnzvsULFfXSROWTJvD3KsbAEkR/TJg==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr41379998wma.58.1563448783085;
	Thu, 18 Jul 2019 04:19:43 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	v15sm27046226wrt.25.2019.07.18.04.19.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 04:19:42 -0700 (PDT)
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <b042649c-db98-9710-b063-242bdf520252@gmail.com>
Date: Thu, 18 Jul 2019 13:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Jul 2019 11:19:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 18 Jul 2019 11:19:45 +0000 (UTC) for IP:'209.85.128.52'
	DOMAIN:'mail-wm1-f52.google.com' HELO:'mail-wm1-f52.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.52 mail-wm1-f52.google.com 209.85.128.52
	mail-wm1-f52.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 18 Jul 2019 11:20:16 +0000 (UTC)

On 18/07/2019 12:40, Pascal Van Leeuwen wrote:
...
>> See the reference in generic code - the 3rd line - link to the IEEE standard.
>> We do not implement it properly - for more than 12 years!
>>
> 
> Full XTS is XEX-TCB-CTS so the proper terminology for "XTS without CTS" would be XEX-TCB.
> But the problem there is that TCB and CTS are generic terms that do not imply a specific 
> implementation for generating the tweak -or- performing the ciphertext stealing.
> Only the *full* XTS operation is standardized (as IEEE Std P1619).

Yes. Also XTS is allowed in FIPS now. Because the current code cannot submit
anything else than aligned blocks, we are ok.
(I hope. Speaking for disk encryption, dm-crypt, only).

> In fact, using the current cts template around the current xts template actually does NOT
> implement standards compliant XTS at all, as the CTS *implementation* for XTS is 
> different from the one for CBC as implemented by the current CTS template.
> The actual implementation of the ciphertext stealing has (or may have) a security impact,
> so the *combined* operation must be cryptanalyzed and adding some random CTS scheme
> to some random block cipher mode would be a case of "roll your own crypto" (i.e. bad).

> From that perspective - to prevent people from doing cryptographically stupid things -
> IMHO it would be better to just pull the CTS into the XTS implementation i.e. make
> xts natively support blocks that are not a multiple of (but >=) the cipher blocksize ...

I would definitely prefer adding CTS directly to XTS (as it is in gcrypt or OpenSSL now)
instead of some new compositions.

Also, I would like to avoid another "just because it is nicer" module dependence (XTS->XEX->ECB).
Last time (when XTS was reimplemented using ECB) we have many reports with initramfs
missing ECB module preventing boot from AES-XTS encrypted root after kernel upgrade...
Just saying. (Despite the last time it was keyring what broke encrypted boot ;-)

(That said, I will try to find some volunteer to help with CTS in XTS implementation, if needed.)

>> Reality check - nobody in block layer needs ciphertext stealing, we are always
>> aligned to block. AF_ALG is a different story, though.
> 
> So you don't support odd sector sizes like 520 , 528, 4112, 4160 or 4224 bytes?

No. Dm-crypt supports only power of two blocks, up to 4k (IOW: 512, 1024, 2048, 4096 bytes).
(Not more, because of compatible page size - this could be fixed in future though.)

The 520 hw sector is usually 512 + 8 bytes for DIF (data integrity field).
We can emulate something similar with dm-integrity, but the data section (input to encryption)
must be always as specified above (rest is in integrity bio section).

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
