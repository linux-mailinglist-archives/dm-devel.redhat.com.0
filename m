Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAFB4718E
	for <lists+dm-devel@lfdr.de>; Sat, 15 Jun 2019 20:20:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB18C057F31;
	Sat, 15 Jun 2019 18:20:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CBEB608C6;
	Sat, 15 Jun 2019 18:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC7F11806B19;
	Sat, 15 Jun 2019 18:20:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5FIJbKd018912 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Jun 2019 14:19:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4580660487; Sat, 15 Jun 2019 18:19:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E9632B9D3;
	Sat, 15 Jun 2019 18:19:35 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21F653091754;
	Sat, 15 Jun 2019 18:19:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so5224262wmj.5;
	Sat, 15 Jun 2019 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NeSR6GnrdqlIjdqD3lSHhsRl+Jd7829fRlrkgMWMgPs=;
	b=hgqO/z1b4Hx6SULrkZJIDlpNnoYvvGGS7AWkh9SO2NGoLojVNruj2KGEH8h9PLfFjX
	VDFT5DrK8tM/FRLNhUHfZupm8TD7FfuL15GEACUbIdSJV3/jern+dSAxmnunMUql0Yx1
	g/1PlHr63lr12IM2YnYZAMRjKusNAWBXX47U1Rysw0MXOAUKvJX65LYi0V2cMyY89Qu1
	Z9QVya8+CDWwF+GhCtwztFUjQawWna/4EuNzTwSnGI1QLCbh26m5RtXimNGfjgCfS6lt
	xvWQwtLu5dw7ILrP0Wt4uiYHuXRQDjdT1EExm5bnTdp5VjwyGPEzpEddkgkvMBV/bBXG
	iaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NeSR6GnrdqlIjdqD3lSHhsRl+Jd7829fRlrkgMWMgPs=;
	b=QZKExO6UOMYayMQfxoA9/2kn2axKIaDqMqERPO39JYh5q+3pd2GNBplLxiYB8QYzDa
	OhkTQ+/Gi7qcmrB7SzYp1e85FvfcQ18wkoNA4JW0bsnH/MitVg1N6RbVwHCtFS9/TAl8
	u5jw2OoCckaJ9Ak2lqKjhhLY62HopAGr8992YcVFWrWqtR1Az/C1ugwCtNXYfgVZH4s6
	lLkTIYpdtgqXnuyUfevD/cnmpyWT8rKw+8GoldIIUT29atQzpy0wplXnebnsL2w3bmxS
	Idsw9oW4bhL9kBv/RSsn2Y5R0/YM/9mM+SvmlrhrftEWP+Fakf44a8uqn3qOqbzFA9aE
	eLJg==
X-Gm-Message-State: APjAAAUYPA21RHDW/SUDXD8LNFVpi/0oBwehWot29/cSLLmK86dfClFN
	UViXxP3aZQ6gcJoO4j8q9eP2mqiC1KTsDw==
X-Google-Smtp-Source: APXvYqw/K+cFbhCT0NWMIXD+LYK92nb5mpf/Ry2WAxMHuJb3dpuPdrfgG+0oXd/KUVmRuPPLBOK6/w==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr12930224wme.94.1560622764575;
	Sat, 15 Jun 2019 11:19:24 -0700 (PDT)
Received: from [192.168.1.158] ([178.17.7.30])
	by smtp.gmail.com with ESMTPSA id s7sm3021728wmc.2.2019.06.15.11.19.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Jun 2019 11:19:24 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <9cd635ec-970b-bd1b-59f4-1a07395e69a0@gmail.com>
Date: Sat, 15 Jun 2019 20:19:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sat, 15 Jun 2019 18:19:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sat, 15 Jun 2019 18:19:26 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 15 Jun 2019 18:20:53 +0000 (UTC)

On 14/06/2019 10:34, Ard Biesheuvel wrote:
> This series is presented as an RFC for a couple of reasons:
> - it is only build tested
> - it is unclear whether this is the right way to move away from the use of
>   bare ciphers in non-crypto code
> - we haven't really discussed whether moving away from the use of bare ciphers
>   in non-crypto code is a goal we agree on
> 
> This series creates an ESSIV shash template that takes a (cipher,hash) tuple,
> where the digest size of the hash must be a valid key length for the cipher.
> The setkey() operation takes the hash of the input key, and sets into the
> cipher as the encryption key. Digest operations accept input up to the
> block size of the cipher, and perform a single block encryption operation to
> produce the ESSIV output.
> 
> This matches what both users of ESSIV in the kernel do, and so it is proposed
> as a replacement for those, in patches #2 and #3.
> 
> As for the discussion: the code is untested, so it is presented for discussion
> only. I'd like to understand whether we agree that phasing out the bare cipher
> interface from non-crypto code is a good idea, and whether this approach is
> suitable for fscrypt and dm-crypt.

If you want some discussion, it would be very helpful if you cc device-mapper list
to reach dm-crypt developers. Please add at least dm-devel list.

Just a few comments:

 - ESSIV is useful only for CBC mode. I wish we move to some better mode
in the future instead of cementing CBC use... But if it helps people
to actually use unpredictable IV for CBC, it is the right approach.
(yes, I know XTS has own problems as well... but IMO that should be the default
for sector/fs-block encryption these days :)

- I do not think there is a problem if ESSIV moves to crypto API,
but there it is presented as a hash... It is really just an IV generator.

> - wiring up some essiv(x,y) combinations into the testing framework. I wonder
>   if anything other than essiv(aes,sha256) makes sense.

In cryptsetup testsuite, we test serpent and twofish ciphers at least, but in
reality, essiv(aes,sha256) is the most used combination.
If it makes sense, I can run some tests with dm-crypt and this patchset.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
