Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFE4CCDA
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 13:24:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 643DC88E5C;
	Thu, 20 Jun 2019 11:24:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2129B5C205;
	Thu, 20 Jun 2019 11:24:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A62D1806B0E;
	Thu, 20 Jun 2019 11:23:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KBN5MY031560 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 07:23:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C81F51001DF3; Thu, 20 Jun 2019 11:23:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2CA91001DD2
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:23:03 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A49A62F8BE5
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:23:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s3so2686563wms.2
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KqQ/0lNgatbAFjvI+UVLmFxYwFfw0GJxlYHEsE9riuI=;
	b=EqwlB9wrZg7QLGcc8q6YnqqCrDzdvMYEbGXNYG+FRDI5VxzNfajkiCb20/BAbsgSDN
	Vef7665o/zWK17Zp1xRcjyn6ZuIkR5fWhViv4hP5sWLzwEVuW+t/ohGYx6/2/3EKgZmC
	SIBY5QU9w0krvt+zTIkUukCY3KDAjmZz6aEDUyaN+Gd7k+hmRVIBeXbl5svknvqxgENX
	j9dLelMWUZj97HgfgBxHcrWJ5oG1X7OC07ctG8ubYz+EMOASHlvKYnxzRCPPu/FH3FWN
	zqujdMNR2NoKYC0LE12m3vOlgJYa2lBzQJP7PtpPgDvUwlw07PPEVe9x+tITHlhIAMoI
	ZO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KqQ/0lNgatbAFjvI+UVLmFxYwFfw0GJxlYHEsE9riuI=;
	b=l+0GyE7mkaA20lovMLxKANf7H+cS+Ry7owMJvyzTuf7CkDQGbjACfPYb8+aNzJhMbh
	rGhaYERTBWg0mawBKyNolS4R+naSjbOqskTU1OtVXKFLwu2w6qbXDAoyVbQM08IYFiDc
	1EcTNaIK65fO8EmkdcZ/li1oMgniLYjpnhIln7Yvcjbs7nuQOmXas+ue0dIoFRnxceXu
	ogaMDHMB86fFwTwSdflbL5Sz7zfTnE5Roa845ARIGQ20cSkCywmbQzHuN58FsnodFnJ0
	5r6MmfuynxyHL1ULJyQlzvysEDefYhffjhY6ivQFt22jMU7i8Ap8vaJkRngXgEYZS0mN
	CZSA==
X-Gm-Message-State: APjAAAVJIY+X2OB0x3T6UIfM2ilxn88AFDpCsQPDSDG8rSjv2kprFRWm
	zEBuQ3s2Mhduar3+ByiDbPU=
X-Google-Smtp-Source: APXvYqw6DquVhD4CuXe0+0nmPPcROjtQRWpC/Htr2sGU0pUZBI7eYfu7fFX+7QUJi13w7zzOaFK3sQ==
X-Received: by 2002:a1c:f61a:: with SMTP id w26mr2678480wmc.75.1561029779427; 
	Thu, 20 Jun 2019 04:22:59 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	n1sm16511014wrx.39.2019.06.20.04.22.58
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 04:22:58 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
Date: Thu, 20 Jun 2019 13:22:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 20 Jun 2019 11:23:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 20 Jun 2019 11:23:02 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 20 Jun 2019 11:24:53 +0000 (UTC)

On 19/06/2019 18:29, Ard Biesheuvel wrote:
> This series creates an ESSIV template that produces a skcipher or AEAD
> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> encapsulated sync or async skcipher/aead by passing through all operations,
> while using the cipher/shash pair to transform the input IV into an ESSIV
> output IV.
> 
> This matches what both users of ESSIV in the kernel do, and so it is proposed
> as a replacement for those, in patches #2 and #4.
> 
> This code has been tested using the fscrypt test suggested by Eric
> (generic/549), as well as the mode-test script suggested by Milan for
> the dm-crypt case. I also tested the aead case in a virtual machine,
> but it definitely needs some wider testing from the dm-crypt experts.
> 
> Changes since v2:
> - fixed a couple of bugs that snuck in after I'd done the bulk of my
>   testing
> - some cosmetic tweaks to the ESSIV template skcipher setkey function
>   to align it with the aead one
> - add a test case for essiv(cbc(aes),aes,sha256)
> - add an accelerated implementation for arm64 that combines the IV
>   derivation and the actual en/decryption in a single asm routine

I run tests for the whole patchset, including some older scripts and seems
it works for dm-crypt now.

For the new CRYPTO_ESSIV option - dm-crypt must unconditionally
select it (we rely on all IV generators availability in userspace),
but that's already done in patch 4.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
