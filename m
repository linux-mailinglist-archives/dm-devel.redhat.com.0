Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23A8F2AC
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 20:00:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BDC831752BC;
	Thu, 15 Aug 2019 18:00:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7553A17ADA;
	Thu, 15 Aug 2019 18:00:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5A7718005A0;
	Thu, 15 Aug 2019 18:00:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FHxcB1015664 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 13:59:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E7AF422C; Thu, 15 Aug 2019 17:59:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196AE601A5
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 17:59:35 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D6EC05AA6A
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 17:59:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p17so2954126wrf.11
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fDiKGk9sGd71gzB1JxmvmDU6+YxWpqZzFJYbeb3g5Oc=;
	b=s+PbkYI63wwqg2bZSGV+5aCPEIRQdmwZ6g0owPrEyE1RefJJ79JWsHHZ+8xF5aufB9
	CT1xKQkXFHIeBDO7jO9PEHXNPS34Z/Irm3bGuuBfWcQkmr18XhRYv6XicDfswx6A90Yi
	LU+IQGF6SfF4kFURVmasNni8o5o3AibM3C+jMFzJ6ALff5N3YIJQE21janxNeEWE9/Ii
	WIpt8nswQe2VLtFXT/DwklNd4i+9fYtohOIEQxPzBrmHoth1JxkHWYXKixu2qsJ6mLa6
	0o8istn6X646ZaS5eUZBlFcdilMiod6scvyXx87cjL4jq1damUM145EeO+iVzUg2LkP+
	ymgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fDiKGk9sGd71gzB1JxmvmDU6+YxWpqZzFJYbeb3g5Oc=;
	b=BoGIHyMlv6EiM1WJg8Um7bfFewit0MG1U4zXz02fD0ziujE1ogsf9JDdxv0U2JDkQr
	q8C3278Ho+d3p5WW/hH67yT0r0Vtjs1QwFi/1DFjGL6MD6K7pQVZXK0jf96ReH43h4sh
	kVAHWQNJ3jgI7/rmI72EZXumOyLyfPjrDcZqQ4upoOkyrcr3w6VUGmhFjx1z/EwbhEC3
	oPYt+INs8DSxEHr1e44DcLyPPYjF9O+bB1nQJE6NskphyvOLp5EQjgvTmlue+JeBwJIh
	syhvvPbM7gxP/OXePhg8gJjDzPJIwdq9wndq1ZXUg3HqG7VqYgpJgRPUslFksL78VTuH
	sYiA==
X-Gm-Message-State: APjAAAWcpIQbfnROaFHuePw6FEJ7+dmBMjzNV3FAcDEZ/KTs2+LSQTLK
	0gS5yfX9K4L7FGvW8BmVNBWXT/hzNEzgu5a+KTzLUg==
X-Google-Smtp-Source: APXvYqzZXQJtLZz35otOaBEz0CFyoFQKMPLr3kKlvp4Bb0CNFG6zHi3siAAk337L0RQzmGYzvAhUKBi6JyPlOUBWQ04=
X-Received: by 2002:adf:eb52:: with SMTP id u18mr6426644wrn.174.1565891972765; 
	Thu, 15 Aug 2019 10:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814163746.3525-1-ard.biesheuvel@linaro.org>
	<20190814163746.3525-2-ard.biesheuvel@linaro.org>
	<20190815023734.GB23782@gondor.apana.org.au>
	<CAKv+Gu_maif=kZk-HRMx7pP=ths1vuTgcu4kFpzz0tCkO2+DFA@mail.gmail.com>
	<20190815051320.GA24982@gondor.apana.org.au>
	<CAKv+Gu_OVUfXW6t+j1RHA4_Uc43o50Sspke2KkVw9djbFDd04g@mail.gmail.com>
	<20190815113548.GA27723@gondor.apana.org.au>
	<CAKv+Gu9Yx3Jk_ikZC1GrR8rR1zV_5CzkXv5NntXnLYim2n+R9g@mail.gmail.com>
In-Reply-To: <CAKv+Gu9Yx3Jk_ikZC1GrR8rR1zV_5CzkXv5NntXnLYim2n+R9g@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 15 Aug 2019 20:59:21 +0300
Message-ID: <CAKv+Gu9wK_8RxOer5x5UuMu4rTZOWP+6xaCu+LpSDff2o_ukOg@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 17:59:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 17:59:34 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.28  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 15 Aug 2019 18:00:14 +0000 (UTC)

On Thu, 15 Aug 2019 at 20:46, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Thu, 15 Aug 2019 at 14:35, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Thu, Aug 15, 2019 at 08:15:29AM +0300, Ard Biesheuvel wrote:
> > >
> > > So what about checking that the cipher key size matches the shash
> > > digest size, or that the cipher block size matches the skcipher IV
> > > size? This all moves to the TFM init function?
> >
> > I don't think you need to check those things.  If the shash produces
> > an incorrect key size the setkey will just fail naturally.  As to
> > the block size matching the IV size, in the kernel it's not actually
> > possible to get an underlying cipher with different block size
> > than the cbc mode that you used to derive it.
> >
>
> dm-crypt permits any skcipher to be used with ESSIV, so the template
> does not enforce CBC to be used.
>
> > The size checks that we have in general are to stop people from
> > making crazy combinations such as lrw(des3_ede), it's not there
> > to test the correctness of a given implementation.  That is,
> > we assume that whoever provides "aes" will give it the correct
> > geometry for it.
> >
> > Sure we haven't made it explicit (which we should at some point)
> > but as it stands, it can only occur if we have a bug or someone
> > loads a malicious kernel module in which case none of this matters.
> >
>
> OK.
>
> > > Are there any existing templates that use this approach?
> >
> > I'm not sure of templates doing this but this is similar to fallbacks.
> > In fact we don't check any gemoetry on the fallbacks at all.
> >
>
> OK, so one other thing: how should I populate the cra_name template
> field if someone instantiates essiv(cbc(aes),sha256-ce)? We won't know
> until TFM init time what cra_name allocating the sha256-ce shash
> actually produces, so the only way to populate those names is to use
> the bare string supplied by the caller, which could be bogus.
>
> To me, it seems like retaining the spawn for the shash is more
> idiomatic, and avoids strange issues like the one above. Dropping the
> spawn for the encapsulated cipher (which is tightly coupled to the
> skcipher/aead being encapsulated) does seem feasible, so I'll go with
> that.

Actually, I should be able to lookup the alg without using it to
create a spawn. Let me try that instead.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
