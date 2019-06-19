Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C32454C3D3
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 00:44:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B8BF3087935;
	Wed, 19 Jun 2019 22:44:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6901001E80;
	Wed, 19 Jun 2019 22:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96D471806B18;
	Wed, 19 Jun 2019 22:44:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JMiEWb021269 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 18:44:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D73C608CA; Wed, 19 Jun 2019 22:44:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26840608A5
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 22:44:11 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40E1630872EE
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 22:44:03 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e3so1306724ioc.12
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cqxlS8TUrayOrx9RbCCJk5wRQ9lf+ZHmU1Gk3w573sA=;
	b=Zo1OClAyhkahly1M3GDgTSgP8bluNQ3KeJKArO+j5QmLCtuO3iq7To5FgWOUm2TQ7H
	vnxsuXXb9FhJZEtz7mnlEpM7m6n1QPIJ428Tktag2AvEf3iFS9wxAIQwevEtXysPQXxr
	F17f2AZUvSmIuo5i/y/ioaQFG2wivHpLH4+EtPD22dBE/YkIIjVt+yMpQen2bEnocUab
	FlWffctvJ22Z82i77vdnmcRkbW14uOwLDAl5ZTFsiJ8BEqN+yEbdvCxmOTWd3BZzqbEx
	Gzixhlz8c1YWVEXGT1+zas646xkbxUlm93S+2MSNB91B0zxwF05m7IK3rQGMrVuJFdFS
	U0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cqxlS8TUrayOrx9RbCCJk5wRQ9lf+ZHmU1Gk3w573sA=;
	b=gHQurEdj3z4KnH2liUlO5TWraeEvfECDjplbxp5x92PqLZmOcR0X5E9/rLja4H89vV
	/FjaBJUWkee+lyAsY7RNq3PNoHZBJeSZMcPahurBStJIaksCbw23p/OuiXWzql5lg2Tj
	5LfzjKW30AETn+JauP9QnwoTgRhXEay0ef5w5cpujocSV9ITG1t87nb9NqrSxQ44RDVN
	QYDQL716qoSyvj5wcVltO2mc5oEie/u2Eyg2InLRfjn6vnIJjaNM674Rgyon/ZReaXn4
	S7YADkJi5myBsWIdg1XS10zxcMxaRcdtByHrATbfDNhivXHIQTgtzNokpzN3jXk3lkFw
	M3Xw==
X-Gm-Message-State: APjAAAWXyRbUZSvA6mMASA1gP3vRAVwbyW26iRzuu3g3wYfZeKGXUmb+
	1eLY0rAdM7BSxNiqyKSYbwPpMOHh0abP3A8tZvW9kkS/
X-Google-Smtp-Source: APXvYqw/sCUfskyBvggMUZjvIJpXali3ibXg+KltmWlgJQ0z55nAS0Yzei1eJqAONy0eZ2XuO0dBunkxkRJM9M2L9to=
X-Received: by 2002:a5e:820a:: with SMTP id l10mr13301247iom.283.1560984242534;
	Wed, 19 Jun 2019 15:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-7-ard.biesheuvel@linaro.org>
	<20190619223710.GC33328@gmail.com>
In-Reply-To: <20190619223710.GC33328@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 00:43:50 +0200
Message-ID: <CAKv+Gu8_iPOA58xP+y-UvF7SPt86uYZZRb0Z9jEHo3d3Q6PhCg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 19 Jun 2019 22:44:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 19 Jun 2019 22:44:03 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 6/6] crypto: arm64/aes - implement
 accelerated ESSIV/CBC mode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 19 Jun 2019 22:44:30 +0000 (UTC)

On Thu, 20 Jun 2019 at 00:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jun 19, 2019 at 06:29:21PM +0200, Ard Biesheuvel wrote:
> > Add an accelerated version of the 'essiv(cbc(aes),aes,sha256)'
> > skcipher, which is used by fscrypt, and in some cases, by dm-crypt.
> > This avoids a separate call into the AES cipher for every invocation.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> I'm not sure we should bother with this, since fscrypt normally uses AES-256-XTS
> for contents encryption.  AES-128-CBC-ESSIV support was only added because
> people wanted something that is fast on low-powered embedded devices with crypto
> accelerators such as CAAM or CESA that don't support XTS.
>
> In the case of Android, the CDD doesn't even allow AES-128-CBC-ESSIV with
> file-based encryption (fscrypt).  It's still the default for "full disk
> encryption" (which uses dm-crypt), but that's being deprecated.
>
> So maybe dm-crypt users will want this, but I don't think it's very useful for
> fscrypt.
>

If nobody cares, we can drop it. I don't feel too strongly about this,
and since it is on the mailinglist now, people will be able to find it
and ask for it to be merged if they have a convincing use case.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
