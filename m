Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EE8E46C
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 07:15:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD83CC08EC15;
	Thu, 15 Aug 2019 05:15:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BFD8CB91;
	Thu, 15 Aug 2019 05:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C07F18005A0;
	Thu, 15 Aug 2019 05:15:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7F5Fi7O019044 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 01:15:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD59D5D9DC; Thu, 15 Aug 2019 05:15:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A4E8CBAD
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 05:15:42 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 484ACC057E9F
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 05:15:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so280280wma.1
	for <dm-devel@redhat.com>; Wed, 14 Aug 2019 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tZvl7hZAVmWv/+YDt5+Kq+rIGSJNDblM26jfYGFa+5Y=;
	b=ZKtwATa8tD6O8PODiFtAorn2s4xCi1sj40QhgWI7Dt9ueCHGTqKN3xj40Yhq9VCl0q
	hEJJ0umG9idpPvnyPM70Wy/wu2+ROGl6SdB9XfuMMSE2Bf0kFGRGa4gDLo9+TAE2zzqV
	8i+0tnQ1osbcWmUqXSnskXMbMEMUAluTGaJNOC4M8ZJf1tAkSiZ6vyAvkucEajTeowrJ
	GQV4+H+JZqvPFliqetxOAMtwGwkwBkzTtOx9EuMRqGkgKdjQ7oJS+sXGIXiHTS9GOTIL
	7nqXGPl1bJ8TWGmi4gP+N9GrfAccnzeAPlu/bpAOjh8moZgOrHOo9WL+WB9jOPbPpUlY
	ZPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tZvl7hZAVmWv/+YDt5+Kq+rIGSJNDblM26jfYGFa+5Y=;
	b=kuaN1a5CZDCADdk+FhqDIdQtpJQAprz1399bXKkGyNGiEuM1JCuxXhdqH31zGFJSwZ
	nufZ4A11b0cQy2PI4g4XSQVlecVF7JtWdS5YwGPdAHcQMwQ2wTrOacV5YesSD5zr+PHU
	1riyWwRcgCgc+x/llDj3feHIrEDg37urzjTNa5jyyTFInQAg6N02mpNq4K0smqxyDB34
	y7w8EWTKKJ2ts8r/eTCU8GhWrz4LuNcqeIZuY4YUDxSaN9Wdjh6KYTdXPvQLLiM6K5z5
	RXYBEPo9UuQxXhJ21rnMRwgiRU66SPfwwH6U2a94rV9g+XVGzE4+7HhmVjkHsdpHs37x
	49UA==
X-Gm-Message-State: APjAAAWccrNSQZJJHBMEws87mFTedhKJZqqUDhErXjjtNChMsiNkQ2KG
	DfuesTmg36cQ7nem8W/O5vfSnEjw0YEZ7MyxT/ZGqg==
X-Google-Smtp-Source: APXvYqxSYK1gIzM7UQ19HMpn96OXM4qgebmodWy6UF/z594An7E0XMo09PI+9IgbQarmBDb87ls7X2nJ2fhMb76nvtI=
X-Received: by 2002:a05:600c:231a:: with SMTP id
	26mr730899wmo.136.1565846139967; 
	Wed, 14 Aug 2019 22:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814163746.3525-1-ard.biesheuvel@linaro.org>
	<20190814163746.3525-2-ard.biesheuvel@linaro.org>
	<20190815023734.GB23782@gondor.apana.org.au>
	<CAKv+Gu_maif=kZk-HRMx7pP=ths1vuTgcu4kFpzz0tCkO2+DFA@mail.gmail.com>
	<20190815051320.GA24982@gondor.apana.org.au>
In-Reply-To: <20190815051320.GA24982@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 15 Aug 2019 08:15:29 +0300
Message-ID: <CAKv+Gu_OVUfXW6t+j1RHA4_Uc43o50Sspke2KkVw9djbFDd04g@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 05:15:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 05:15:41 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v11 1/4] crypto: essiv - create wrapper
	template for ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 15 Aug 2019 05:15:53 +0000 (UTC)

On Thu, 15 Aug 2019 at 08:13, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 15, 2019 at 07:59:34AM +0300, Ard Biesheuvel wrote:
> >
> > So how do I ensure that the cipher and shash are actually loaded at
> > create() time, and that they are still loaded at TFM init time?
>
> If they're not available at TFM init then you just fail the init
> and therefore the TFM allocation.  What is the problem?
>
> IOW the presence of the block cipher and unkeyed hash does not
> affect the creation of the instance object.
>

Right.

So what about checking that the cipher key size matches the shash
digest size, or that the cipher block size matches the skcipher IV
size? This all moves to the TFM init function?

Are there any existing templates that use this approach?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
