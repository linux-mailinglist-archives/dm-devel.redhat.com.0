Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA936010D
	for <lists+dm-devel@lfdr.de>; Fri,  5 Jul 2019 08:33:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A53AF30842AC;
	Fri,  5 Jul 2019 06:33:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5524C48B;
	Fri,  5 Jul 2019 06:33:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20A7154D3D;
	Fri,  5 Jul 2019 06:33:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x656WlPI012526 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 02:32:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0ED877E655; Fri,  5 Jul 2019 06:32:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0946C7E654
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 06:32:42 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BAA430842D1
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 06:32:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p13so8634521wru.10
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ovsHUna91hEc0tSDDPGIwh4AWoKdmf0FnMPYL9dLv6w=;
	b=mdY+FRbfsdqRqYPNOtfUlf7FXQtpeXltB2OgJdlnN1tKhoHvyjiEkWrNQI+CqpUoIx
	O+sosMBjjJIQs0wkN4aL3vLMDGTgatrLzsYOfLwpoN7V4V5Ys1VX7OsBxija0v8dDSbB
	A7c74jcFMT5FxS5zv10CXJyerpfcNH6L+bhyziDmBNO1fWZi3rJT9KObqJXre7K5tZK6
	LR0Tp2B1rRPUX2PyPoyey+gbLahcR6lrITAc2rqte3aGU4oIIE8KHaqxSdbONCZydLiE
	J619uAj0r52PO2FMLBvE/3L6scNOfZ6Ia+xVCFJCGCDvoI4KvcDLkBhfPks+9IyLqjnp
	4BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ovsHUna91hEc0tSDDPGIwh4AWoKdmf0FnMPYL9dLv6w=;
	b=sfOKZgcAV6Ta3hRT8LuV7uoXZKhgzK/bOupLRxy2Bf+UP5GXhNCT3pQ8v5dPP71s96
	bB/jyGfJfJTMdic/2uomyGzIwY+BVeclFEzbQCpPmotI60OrerUf4ClfQ7s+1BG1uqd8
	kGK/DjQGwdJlYfr/0SxH/dj6n+i+q/hHoI8P87csultsJnM6glKN6EBHgQP0Fw87eftd
	xj+1oxGyoAwuirNEsfqF/Vt84pOjkr1NyJttwRR4cqX+oxKQLK7sKOKvTTNZWW28XOSV
	9YE+1/mYf5Vi5hGt5vvI+vwJK7g9SLYfH1yThVPr/tmG2zNiaEmG9NAIJXQcsk0bcyIz
	p/Jg==
X-Gm-Message-State: APjAAAV0iuEVj8p4YQB/XJ5e5Z76+zen2hjnIHTfu+ynMYpDE9TCo961
	5YE+KNSKXVq7VAW58UCUZlSjQQyL0J5IKp1kIwGA4A==
X-Google-Smtp-Source: APXvYqwETauqYCtkBKoF5CX6TqitunjyLTSGH36GNl2j7u0g2rRUYRBc90s2zTuCFyzOn0sWZK36urPzzL+5c97kpK8=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr2202654wrw.169.1562308339870; 
	Thu, 04 Jul 2019 23:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
	<7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
	<CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
	<CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
	<4286b8f6-03b5-a8b4-4db2-35dda954e518@gmail.com>
	<CAKv+Gu_Nesqtz-xs0LkHYZ6HXrKkbJjq8dKL6Cnrk9ZsQ=T3jg@mail.gmail.com>
	<20190705030827.k6f7hnhxjsoxdj6b@gondor.apana.org.au>
In-Reply-To: <20190705030827.k6f7hnhxjsoxdj6b@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 5 Jul 2019 08:32:03 +0200
Message-ID: <CAKv+Gu-Nye8TF68bZ=fKzU-SBpW7nx3F8ECcZjLjKD_TTbtsmw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 05 Jul 2019 06:32:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 05 Jul 2019 06:32:21 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.103  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH 3/3] dm-crypt: Implement eboiv - encrypted
 byte-offset initialization vector.
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 05 Jul 2019 06:33:53 +0000 (UTC)

On Fri, 5 Jul 2019 at 05:08, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jul 04, 2019 at 08:11:46PM +0200, Ard Biesheuvel wrote:
> >
> > To be clear, making the cipher API internal only is something that I
> > am proposing but hasn't been widely discussed yet. So if you make a
> > good argument why it is a terrible idea, I'm sure it will be taken
> > into account.
> >
> > The main issue is that the cipher API is suboptimal if you process
> > many blocks in sequence, since SIMD implementations will not be able
> > to amortize the cost of kernel_fpu_begin()/end(). This is something
> > that we might be able to fix in other ways (and a SIMD get/put
> > interface has already been proposed which looks suitable for this as
> > well) but that would still involve an API change for something that
> > isn't the correct abstraction in the first place in many cases. (There
> > are multiple implementations of ccm(aes) using cipher_encrypt_one() in
> > a loop, for instance, and these are not able to benefit from, e.g,
> > the accelerated implementation that I created for arm64, since it open
> > codes the CCM operations)
>
> I agree with what you guys have concluded so far.  But I do have
> something I want to say about eboiv's implementation itself.
>
> AFAICS this is using the same key as the actual data.  So why
> don't you combine it with the actual data when encrypting/decrypting?
>
> That is, add a block at the front of the actual data containing
> the little-endian byte offset and then use an IV of zero.
>

That would only work for encryption.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
