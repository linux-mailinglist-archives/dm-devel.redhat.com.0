Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C80258C04D
	for <lists+dm-devel@lfdr.de>; Tue, 13 Aug 2019 20:16:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C74D881F0D;
	Tue, 13 Aug 2019 18:16:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D921A82AC0;
	Tue, 13 Aug 2019 18:16:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD1814A486;
	Tue, 13 Aug 2019 18:16:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DIGUhh016320 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 14:16:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6CCE4B6; Tue, 13 Aug 2019 18:16:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E794AD
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 18:16:28 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2608A3001839
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 18:16:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p77so1614032wme.0
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Nrxu1gfhcbocfYIZUw0NkOzczURAyLQVnvTJn31YeTc=;
	b=x2xJ9KtUYmejpdb+kbqiHkXaAfhfDNN7U5IiJWhmumpTtrK2rYVpy7DfvU5zbhsimZ
	BFn+M9U7v5lyzCZ8INrOLufJ55/GJ6x2y97ZMvzps+dzZwn/ZnbZyp5Qmriva94OcoXF
	UFQo5zsChF51q+meunPCt2HLWsmUCIWsAhFmvmIppYUwsLjq+fhqxN8xBzryTW2S5icI
	qFsR9P/sxKCOP8dg2dA7Ukpb18hfmjtwUBGMmhgM07rBO0+og1B1PYI/6+EaIiGn97DZ
	8DslTNM23x8u8/qGyruiVB51ZiixCmm0J0n9o2HMF/S9F02kEtZMxm/C7vAv8BRvUCMC
	iKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Nrxu1gfhcbocfYIZUw0NkOzczURAyLQVnvTJn31YeTc=;
	b=cS/n1STnRJH3YED9OxabO/I2z2H670fh/l/46yzBN5d10x3R+HYuWudGpBeTMy4wA/
	LGXhn2BqqKsUjLzQpjfIgjPUDjnpkZ5ybPYIYHvOEQI+9JB7I97n9y8KkogTcQct/vOa
	z3WS5YveFuZIAE7bjTVn7gT2mJooeL6iVlhm1s7JeA6muiD5VWPxMwkFqjoEIv683dm0
	7MwN9/JEJYU9pQ9n7F9nkL/bFKzljWimNDyYDpg5Yla9N4LZmGhejOJYeMXLdRMZOq/D
	4qLHdhvPRWtlz8PlsQRd3DggBTQVRKsj5DiX9h/J+mGUXdJgfLdUuggyULihNJ+pIOZ6
	ZmXA==
X-Gm-Message-State: APjAAAUHVZ3Ic17WVWC1f3qEEY/5oeKxccGQvHRDZkXcx9kIg5XH0OUD
	jFgW1CvgE97uFEgSfK6Nc87LMowRSyD0YjOR+caklQ==
X-Google-Smtp-Source: APXvYqxtZ6RS190EVhcPAEXpCsTTHX9gHaKFcumPuHU1VSD712jSdxyEDlEcsx+6ns9L97XUK86wnf9qb5k9JtXw1r8=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr4097412wmi.61.1565720185710; 
	Tue, 13 Aug 2019 11:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
	<20190812145324.27090-3-ard.biesheuvel@linaro.org>
	<20190812194747.GB131059@gmail.com>
	<CAKv+Gu-9aHY0op6MEmN8PfQhNa0kv=xNYB6rqtaCoiUdH4OASA@mail.gmail.com>
	<20190813180020.GA233786@gmail.com>
In-Reply-To: <20190813180020.GA233786@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 13 Aug 2019 21:16:14 +0300
Message-ID: <CAKv+Gu8BFxyre0XDpE2To6yEvBP4E16abMZbR=r17TpQQko54Q@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org, Gilad Ben-Yossef <gilad@benyossef.com>, 
	Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 13 Aug 2019 18:16:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 13 Aug 2019 18:16:27 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v10 2/7] fs: crypto: invoke crypto API for
 ESSIV handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 13 Aug 2019 18:16:45 +0000 (UTC)

On Tue, 13 Aug 2019 at 21:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Aug 13, 2019 at 08:09:41AM +0300, Ard Biesheuvel wrote:
> > On Mon, 12 Aug 2019 at 22:47, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Mon, Aug 12, 2019 at 05:53:19PM +0300, Ard Biesheuvel wrote:
> > > > Instead of open coding the calculations for ESSIV handling, use a
> > > > ESSIV skcipher which does all of this under the hood.
> > > >
> > > > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > >
> > > This looks fine (except for one comment below), but this heavily conflicts with
> > > the fscrypt patches planned for v5.4.  So I suggest moving this to the end of
> > > the series and having Herbert take only 1-6, and I'll apply this one to the
> > > fscrypt tree later.
> > >
> >
> > I think the same applies to dm-crypt: at least patch #7 cannot be
> > applied until my eboiv patch is applied there as well, but [Milan
> > should confirm] I'd expect them to prefer taking those patches via the
> > dm tree anyway.
> >
> > Herbert, what would you prefer:
> > - taking a pull request from a [signed] tag based on v4.3-rc1 that
> > contains patches #1, #4, #5 and #6, allowing Eric and Milan/Mike to
> > merge it as well, and apply the respective fscrypt and dm-crypt
> > changes on top
> > - just take patches #1, #4, #5 and #6 as usual, and let the fscrypt
> > and dm-crypt changes be reposted to the respective lists during the
> > next cycle
> >
>
> FWIW I'd much prefer the second option, to minimize the number of special things
> that Linus will have to consider or deal with.  (There's also going to be a
> conflict between the fscrypt and keyrings trees.)  I'd be glad to take the
> fscrypt patch for 5.5, if the essiv template is added in 5.4.
>

Works for me. I'll respin with the dm-crypt and fscrypt patches
omitted (and the minor fixes you suggested applied).

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
