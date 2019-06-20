Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3B4CD7C
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 14:11:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A4A67FDF9;
	Thu, 20 Jun 2019 12:10:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4675C1001E73;
	Thu, 20 Jun 2019 12:10:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F252E1806B0E;
	Thu, 20 Jun 2019 12:10:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KC9Xej008444 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 08:09:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 076BD1001B1D; Thu, 20 Jun 2019 12:09:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3E12100164A
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 12:09:30 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EF5E619FB
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 12:09:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so2749200wru.10
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5mvPAeiaYnKYEQR24EInixOGLfqaTMkg5VDMI1QMmMg=;
	b=pGQojq13gpTSCFuKobX79+3Cf9Ml5Lo1gq8THOBHUlnhFxv34m3uy/JOF0LlcQFe17
	FJLrcQwDz14qisxiRbhjz2FLNDTMgU3VtVnUs8DwAgrslevzrKlBObNOur4jAsWQeuZz
	cR81mIsxu5qIp/LIZN9elRR/tLAwdDR9abHjj7JIKmOuae+xEba87HrTM3yLkg9hlUbP
	eaVr3hr1M58XPyCyKIZF1h90OGdGpelI8YRwIYG4rhQ3d4m91C540TalmWoXlZFv+kn+
	ECr4O6xxdNeSsebyhocdHAEd4um52Rvx8eaaJ26wz/a8z3OvnQ+LgXTAmIC5wnS85HeJ
	05Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5mvPAeiaYnKYEQR24EInixOGLfqaTMkg5VDMI1QMmMg=;
	b=GKGIgsld5mambnmsXA0sX2mJ6NhFUoPDBCO+6XnN5gQ4S/g1FaMh0qyfGw2mBJsZ45
	PLI/8f4BcSi998QEbYKoUJ3V8spGh2TLV36q3XkFuzw2y+MhAfekKY+ISo8pmv9QTRcz
	tw2+ojJYAGI3MvZY1d44wXPY7bMFwxGa2LXSu3sDZZaRv1GUFjOSw/3wJhprkdR2k22j
	OGqquAW3zKEmPbmkgjMz6IPVTGrLwrYr1nzBrGiTh5HKneZFh1CpFtWWal9S7sq4a001
	IXhONqMdFYMbB75NVRnJJ68XUxTH+YTxjJAklh1KH2Lr1CrGQ1nVDeZrTRIsz8YFvYdC
	wctQ==
X-Gm-Message-State: APjAAAVS2q0Ih8zFZLE0ggYklOCujdefA6pSixU/4x6ro9FRFT1Dxy6V
	8JaL6bVadY2pLyxPDwtfsG0=
X-Google-Smtp-Source: APXvYqyY1DjkAMtvJgSsiPIR9M/m05hvqBQ8unv5XRo45PSSzjG0yRy5CETsPxPn/L1QURVdkuA1jQ==
X-Received: by 2002:adf:e446:: with SMTP id t6mr79712848wrm.115.1561032558831; 
	Thu, 20 Jun 2019 05:09:18 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	f204sm6483119wme.18.2019.06.20.05.09.18
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 05:09:18 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
	<CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
Date: Thu, 20 Jun 2019 14:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Jun 2019 12:09:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 20 Jun 2019 12:09:20 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
	ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 20 Jun 2019 12:11:28 +0000 (UTC)

On 20/06/2019 13:54, Ard Biesheuvel wrote:
> On Thu, 20 Jun 2019 at 13:22, Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 19/06/2019 18:29, Ard Biesheuvel wrote:
>>> This series creates an ESSIV template that produces a skcipher or AEAD
>>> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
>>> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
>>> encapsulated sync or async skcipher/aead by passing through all operations,
>>> while using the cipher/shash pair to transform the input IV into an ESSIV
>>> output IV.
>>>
>>> This matches what both users of ESSIV in the kernel do, and so it is proposed
>>> as a replacement for those, in patches #2 and #4.
>>>
>>> This code has been tested using the fscrypt test suggested by Eric
>>> (generic/549), as well as the mode-test script suggested by Milan for
>>> the dm-crypt case. I also tested the aead case in a virtual machine,
>>> but it definitely needs some wider testing from the dm-crypt experts.
>>>
>>> Changes since v2:
>>> - fixed a couple of bugs that snuck in after I'd done the bulk of my
>>>   testing
>>> - some cosmetic tweaks to the ESSIV template skcipher setkey function
>>>   to align it with the aead one
>>> - add a test case for essiv(cbc(aes),aes,sha256)
>>> - add an accelerated implementation for arm64 that combines the IV
>>>   derivation and the actual en/decryption in a single asm routine
>>
>> I run tests for the whole patchset, including some older scripts and seems
>> it works for dm-crypt now.
>>
> 
> Thanks Milan, that is really helpful.
> 
> Does this include configurations that combine authenc with essiv?

Hm, seems that we are missing these in luks2-integrity-test. I'll add them there.

I also used this older test
https://gitlab.com/omos/dm-crypt-test-scripts/blob/master/root/test_dmintegrity.sh

(just aes-gcm-random need to be commented out, we never supported this format, it was
written for some devel version)

But seems ESSIV is there tested only without AEAD composition...

So yes, this AEAD part need more testing.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
