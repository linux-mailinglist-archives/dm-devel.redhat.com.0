Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9D47FE5
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 12:42:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B873E8552E;
	Mon, 17 Jun 2019 10:41:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08B6417165;
	Mon, 17 Jun 2019 10:41:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E924E161;
	Mon, 17 Jun 2019 10:40:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HAe7gW018267 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 06:40:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23D7358CB0; Mon, 17 Jun 2019 10:40:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC1158CA4
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:40:04 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16A42307E04A
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:39:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p11so9380600wre.7
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=POQUQG4MYB5xEHchrmHz7dMXS7q/nCg6auQxpiFJVc8=;
	b=SyGcWgtgdAELquNabM+nexfBqTjNd4wqDx+BMeVDp2zKguLYpfaJd8f8Tp8ZgTRDTP
	5unNl9XeVCGRuzKTqNV2Jwz6s/ScWZnIBnJdmokb0nmN9i98EKKSQwJDHizG0fJPC9qK
	t32Jp2KHAOqlHuuPpcxVqHspzqRtT2LBwahgRL+vnPqQ9gawO/beN00XaF8N86VdiOZH
	22sciINSBhtIQhUexugsvn4RMg0z+foU9cALIdOZdbcuz6z2BDYG5w3gzsAKyDjpXr+g
	WjJ9Pp306eDSJ7rZMj9+bMRqjSazuZk2Z/gutwnmKAxEY0viiaBAsffTNIqdsgelic5K
	EWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=POQUQG4MYB5xEHchrmHz7dMXS7q/nCg6auQxpiFJVc8=;
	b=HHazxWM4Q5nv+eYtw4qb5fAOER26/DnDygs/YB1BwP9Ze4sFdFoD+/YsUi6jXpXYz4
	2yezDAXdCCp36rVtJLlEHrR1D1gFNfBsHwhUE2VApg4Xm3QLSWCLBFRyNmy2VRib7UUw
	bkPT/lGV56WrFJKELO6vbKBW/Y/Ne7923CZ4h0DuRupOGEfdaYL+3po/3IBBLZah7s7a
	DZjQkkBFoumKJpBu7/3iMsjFKGsJZVCmk+0JqwAbFDHUFAcgoWkvvBZukFNZhU/+WPQ1
	L/48ZbxKVjEp0A6AFyu03AGpEBVQKw4KMrev8QA+5zyUIdo1XwlH5MmJf1LpLvtnbyr0
	J8TQ==
X-Gm-Message-State: APjAAAXEJodEBe88PKE1q8siNrYftBA5y6oP/wdUqa2PFKaz1KwOxJFf
	cbcEhGu1ZfLBAfLLKpJRLmE=
X-Google-Smtp-Source: APXvYqzTNH7Cwt878QuhzyY23K0t/xeUu+dLMMLRZoWPCvFvYZd++TVVE10lVz3uqAU/v/QTuo+niQ==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr39219046wrs.116.1560767995778; 
	Mon, 17 Jun 2019 03:39:55 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	c11sm8392658wrs.97.2019.06.17.03.39.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 03:39:55 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
Date: Mon, 17 Jun 2019 12:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 10:39:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 10:39:57 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 17 Jun 2019 10:42:13 +0000 (UTC)

On 17/06/2019 11:15, Ard Biesheuvel wrote:
>> I will also add that going the skcipher route rather than shash will
>> allow hardware tfm providers like CryptoCell that can do the ESSIV
>> part in hardware implement that as a single API call and/or hardware
>> invocation flow.
>> For those system that benefit from hardware providers this can be beneficial.
>>
> 
> Ah yes, thanks for reminding me. There was some debate in the past
> about this, but I don't remember the details.
> 
> I think implementing essiv() as a skcipher template is indeed going to
> be the best approach, I will look into that.

For ESSIV (that is de-facto standard now), I think there is no problem
to move it to crypto API.

The problem is with some other IV generators in dm-crypt.

Some do a lot of more work than just IV (it is hackish, it can modify data, this applies
for loop AES "lmk" and compatible TrueCrypt "tcw" IV implementations).

For these I would strongly say it should remain "hacked" inside dm-crypt only
(it is unusable for anything else than disk encryption and should not be visible outside).

Moreover, it is purely legacy code - we provide it for users can access old systems only.

If you end with rewriting all IVs as templates, I think it is not a good idea.

If it is only about ESSIV, and patch for dm-crypt is simple, it is a reasonable approach.

(The same applies for simple dmcryp IVs like "plain" "plain64", "plain64be and "benbi" that
are just linear IVs in various encoded variants.)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
